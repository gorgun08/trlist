player-banned = Banlı
    .yes = Evet
    .no = Hayır

player-nationality = Millet
    .info = Bu sadece yaşadığınız ülkeyi belirtir, nereli olduğunuzu belirtmez.
    .none = Yok

player-subdivision = Siyasi alt birim
    .none = Yok

## Players tab
players = Oyuncular

player-manager = Oyuncu Yöneticisi

player-viewer = Oyuncu #
    .welcome = Başlamak için soldaki bir oyuncuya tıklayın!

    .info = Oyuncu yöneticisine hoş geldiniz. Burada bir oyuncu banlayabilir ve banını kaldırabilirsiniz. Bir oyuncuyu banlamak, tüm kayıtlarını siler ve her kaydı reddedilmiş olur.
    .records-redirect = Kayıtları kayıt yöneticisinde göster

player-idsearch-panel = Oyuncuyu ID ile ara
    .info = Her oyuncunun kendine özgü ID'si vardır. O ID ile oyuncu varsa, soldaki panelde seçilir.
    .id-field = Oyuncu ID'si:

    .submit = ID ile bul

    .id-validator-valuemissing = ID gereklidir

player-name-dialog = Oyuncu adını değiştir
    .info = Bu oyuncunun adını değiştir. Bu, onun adını her kayıtta değiştirir. Eğer o adla oyuncu zaten varsa, iki oyuncunun kayıtları birleşir.
    .name-field = Ad:

    .submit = Düzenle

    .name-validator-valuemissing = Lütfen bir ad girin

## List integration tab
list-integration = List Etkileşimi

claimed-player = Seçilen oyuncu
    .verified = Doğrulanmış
    .unverified = Doğrulanmamış

# .info-api-link is turned into a clickable link to the geolocation API
# pointercrate uses, and replaces { $info-api-link }
claim-geolocate = Geolocate statsviewer flag
    .info = Clicking the above button let's you set your claimed player's statsviewer flag via IP Geolocation. To offer this functionality, pointercrate uses { $info-api-link }. Clicking the above button also counts as your consent for pointercrate to send your IP to abstract.
    .info-api-link = abstract's IP geolocation API

    .submit = Go

    .edit-success = Set nationality to { $nationality }
    .edit-success-subdivision = Set nationality to { $nationality }/{ $subdivision }

claim-lock-submissions = Gönderimleri kilitle
    .info = Gönderimleri kilitleyince, sadece siz -hesabına giriş yapılmış bir şekilde- kayıt atabilirsiniz.

    .edit-success = Başarılı bir şekilde gönderimler kilitlendi

claim-records = Seçtiğiniz oyuncunun kayıtları
    .info = Burada gönderilen, kabul edilen, reddedilen ve incelenmekte olan her kaydınız bulunur. Bir kayda tıklayınca list moderatörünün kaydınıza bıraktığı notu görebilirsiniz. Her kaydın arkaplan rengi kaydın { $record-approved-styled }, { $record-submitted-styled }, { $record-rejected-styled } veya { $record-underconsideration-styled } olduğunu gösterir.

    .record-notes = { $record-id }'li kaydın notları:
    .record-notes-none = Burada bir not yok!

claim-manager = Sahiplik Taleplerini Yönet
    .info-a = Aşağıdaki arayüz ile sahiplik taleplerini yönetebilirsiniz. Taleplerin listesi arama kutusu ile filtrelenebilir. Geçersiz talepler çöp kutusuna tıklanarak kaldırılmalıdır.
    .info-b = To verify a claim, click the checkmark. Only verify claims you have verified to be correct (this will probably mean talking to the player that's being claimed, and asking if they initiated the claim themselves, or if the claim is malicious).
    .info-c = Once a claim on a player is verified, all other unverified claims on that player are auto-deleted. Users cannot put new, unverified claims on players that have a verified claim on them.
    .info-d = A claim with a green background is verified, a claim with a blue background is unverified/unchecked.

    .claim-no-records = The claimed player ({ $player-id }) does not have an approved record on the list

claim-listed-user = Claim by user:
claim-listed-player = Claim on player:

claim-initiate-panel = Initiate Claim
    .info = Select the player you wish to claim below

# { $discord } is replaced by .info-discord, which is turned into a
# clickable link to Pointercrate Central by default (this can be modified
# in pointercrate-example/src/main.rs)
claim-info-panel = Claiming 101
    .info-a = Player claiming is the process of associated a demonlist player with a pointercrate user account. A verified claim allows you to to modify some of the player's properties, such as nationality.
    .info-b = To initiate a claim, click the pen left of the 'Claimed Player' heading. Once initiated, you have an unverified claim on a player. These claims will then be manually verified by members of the pointercrate team. You can request verification in { $discord }.
    .info-c = You cannot initiate a claim on a player that already has a verified claim by a different user on it.

    .info-discord = this discord server

claim-video-panel = Record video
    .info = Clicking a claim in the 'Manage Claims' panel will pull up a random video of an approved record by the claimed player.