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
    .info-b = Bir talebi doğrulamak için, onay işaretine tıklayın. Sadece doğru olduğuna inandığınız talepleri doğrulayın.
    .info-c = Bir sahiplik talebi doğrulanınca, diğer doğrulanmamış talepler otomatikmen silinir. Sahiplik talebi doğrulanmış hesaplara tekrar sahiplik talebi yapılamaz.
    .info-d = Arkaplanı yeşil olan talep doğrulanmış, arkaplanı mavi olan talep ise doğrulanmamıştır/incelenmemiştir.

    .claim-no-records = Taleplenen oyuncunun ({ $player-id }) listte kabul edilmiş kaydı yoktur

claim-listed-user = Kim tarafından talep edilmiş:
claim-listed-player = Hangi oyuncu talep edilmiş:

claim-initiate-panel = Talep açın
    .info = Sahibi olmak istediğiniz oyuncuyu seçin

# { $discord } is replaced by .info-discord, which is turned into a
# clickable link to Pointercrate Central by default (this can be modified
# in pointercrate-example/src/main.rs)
claim-info-panel = Sahiplik Talebi 101
    .info-a = Sahiplik talebi ile bir türklist hesabını bir oyuncuya bağlayabilirsiniz. Oyuncuyu hesaba bağlayınca, kayıtlarınızın durumunu vs. görebilirsiniz.
    .info-b = Bir talep başlatmak için, Seçilen Oyuncu kısmındaki kaleme tıklayın. Sonra, sağdaki panelden talep ettiğiniz oyuncuyu seçin. Talebinizin doğrulanması için { $discord } #list-claimler kanalına mesaj atın.
    .info-c = Doğrulanmış bir talebe sahip olan oyunculara talep atamazsınız.

    .info-discord = Türklist Discord Sunucusunda

claim-video-panel = Kayıt videosu
    .info = Sahiplik Taleplerini Yönet panelinde bir talebe tıklayınca talep edilen oyuncunun rastgele bir kaydının videosunu gösteri.