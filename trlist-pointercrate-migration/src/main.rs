// rahhhhhhhhhhhhhhhhhhhhh

use std::collections::{HashMap, HashSet};
use std::str::FromStr;
use std::{path::Path};
use std::fs;
use dotenvy::dotenv;
use pointercrate_demonlist::player::DatabasePlayer;
use serde::Deserialize;
use anyhow::{Result};
use sqlx::types::ipnetwork::IpNetwork;
use sqlx::PgPool;

#[derive(Debug, Deserialize)]
struct TSLDemon {
    id: i32,
    name: String,
    author: String,
    creators: Vec<String>,
    verifier: String,
    verification: String,
    percentToQualify: i16,
    records: Option<Vec<TSLRecord>>,
}

#[derive(Debug, Deserialize)]
struct TSLRecord {
    user: String,
    link: Option<String>,
    percent: i16,
}

struct TSLDemonWithFileAndPosition {
    demon: TSLDemon,
    filename: String,
    position: i16,
}

struct TSLData {
    demons: Vec<TSLDemonWithFileAndPosition>,
    list: Vec<String>,
}

fn import_tsl_data<P: AsRef<Path>>(dir: P) -> Result<TSLData> {
    let mut tsl_demons = Vec::new();
    let mut tsl_list: Vec<String> = Vec::new();

    for entry in fs::read_dir(dir)? {
        let entry = entry?;
        let path = entry.path();

        if path.extension().map(|ext| ext == "json").unwrap_or(false) {
            let content = fs::read_to_string(&path)?;
            if path.file_name().and_then(|f| f.to_str()) == Some("_list.json") {
                // process _list.json
                tsl_list = serde_json::from_str(&content)?;
                continue;
            }
            if path.file_name().and_then(|f| f.to_str()) == Some("_editors.json") {
                // ignore
                continue;
            }
            if path.file_name().and_then(|f| f.to_str()) == Some("_packlist.json") {
                // ignore
                continue;
            }
            let tsl_demon: TSLDemon = serde_json::from_str(&content)?;
            let filename = path.file_stem().unwrap().to_string_lossy().to_string();
            // set position to 0 until sorted
            tsl_demons.push(TSLDemonWithFileAndPosition { demon: tsl_demon, filename: filename, position: 0 });
        }
    }

    Ok(TSLData { demons: tsl_demons, list: tsl_list })
}

// some levels have a .json file but aren't on the list. they are filtered here.
fn filter_demons_by_list(demons: &mut Vec<TSLDemonWithFileAndPosition>, tsl_list: &[String]) {
    let valid_files: HashSet<&str> = tsl_list.iter().map(|s| s.as_str()).collect();

    demons.retain(|d| valid_files.contains(d.filename.as_str()));
}

fn sort_demons_by_list_order(tsl_demons: &mut Vec<TSLDemonWithFileAndPosition>, tsl_list: &[String]) {
    let order_map: HashMap<&str, usize> = tsl_list.iter()
        .enumerate()
        .map(|(idx, name)| (name.as_str(), idx))
        .collect();

    // Sort demons based on the position in the list
    tsl_demons.sort_by_key(|demon| {
        order_map.get(demon.filename.as_str()).cloned().unwrap_or(usize::MAX)
    });

    // Set position field (1-based index)
    for (idx, demon) in tsl_demons.iter_mut().enumerate() {
        demon.position = (idx + 1) as i16;
    }
}

#[tokio::main]
async fn main() -> Result<()> {
    dotenvy::dotenv().ok();
    let TSLData { mut demons, list } = import_tsl_data("trlist-pointercrate-migration/tsl_data")?;

    filter_demons_by_list(&mut demons, &list);
    sort_demons_by_list_order(&mut demons, &list);

    let pool = PgPool::connect(&std::env::var("DATABASE_URL").unwrap()).await?;
    let mut conn = pool.acquire().await?;

    let _ = sqlx::query!(
                            "INSERT INTO submitters (submitter_id, ip_address, banned) \
                            VALUES ($1, $2, $3) ON CONFLICT (submitter_id) DO NOTHING RETURNING submitter_id",
                            2,
                            IpNetwork::from_str("127.0.0.1").unwrap(),
                            false
                        )
                        .fetch_optional(&mut *conn)
                        .await?;

    for demon in demons {
        use pointercrate_demonlist::demon::FullDemon;
        use pointercrate_demonlist::demon::post::PostDemon; // or wherever you put the constructor

        let tsl = &demon.demon;

        let existing_demon = sqlx::query!(
            "SELECT id FROM demons WHERE name = $1",
            tsl.name
        )
        .fetch_optional(&mut *conn)
        .await?;

        if existing_demon.is_some() {
            println!("⏭️ Skipping {} with the level id of {:?}: already exists in database", tsl.name, tsl.id);
            continue;
        }

        let post_demon = PostDemon::new(
            tsl.name.clone(),
            demon.position,
            tsl.percentToQualify,
            tsl.verifier.clone(),
            tsl.author.clone(),
            tsl.creators.clone(),
            Some(tsl.verification.clone()),
            Some(tsl.id as i64), // level_id
        );

        match FullDemon::create_from(post_demon, &mut *conn).await {
            Ok(demon) => {
                println!("✅ Inserted: {} at position {} with the level id of {:?}", demon.demon.base.name, demon.demon.base.position, demon.demon.level_id);
                if let Some(records) = &tsl.records {
                    for record in records {
                        let player = DatabasePlayer::by_name_or_create(&record.user, &mut conn).await.unwrap();

                        let _ = sqlx::query!(
                            "INSERT INTO records (progress, status_, player, submitter, demon, video, raw_footage) \
                            VALUES ($1, $2::text::record_status, $3, $4, $5, $6, $7) RETURNING id",
                            record.percent,
                            "APPROVED", // literal value since it's a custom enum
                            player.id,
                            2,
                            demon.demon.base.id,
                            record.link,
                            None::<String>
                        )
                        .fetch_one(&mut *conn)
                        .await?
                        .id;
                    }
                }
            },
            Err(e) => eprintln!("❌ Failed to insert {} at {} with the level id of {:?}: {}", tsl.name, demon.position, tsl.id, e),
        }
    }

    Ok(())
}

