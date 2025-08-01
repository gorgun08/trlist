pub fn submission_webhook() -> Option<String> {
    std::env::var("DISCORD_WEBHOOK").ok()
}

#[cfg(feature = "geolocation")]
pub fn abstract_api_key() -> Option<String> {
    std::env::var("ABSTRACT_API_KEY").ok()
}

pub fn submission_moderator_role_id() -> Option<String> {
    std::env::var("LIST_MOD_ROLE_ID").ok()
}