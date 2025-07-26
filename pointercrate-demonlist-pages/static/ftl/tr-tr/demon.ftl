## Demon information, including information fetched by dash-rs
## Fields included in forms may have validators
demon-name = Demon İsmi
    .validator-valuemissing = Lütfen bir isim belirtin

demon-password = Level Şifresi

demon-id = Level ID'si
    .validator-rangeunderflow = Level ID'si pozitif olmalıdır

demon-length = Level Uzunluğu

demon-objects = Nesne Sayısı

demon-difficulty = Oyun İçi Zorluk

demon-gdversion = Yapıldığı Versiyon

demon-ngsong = Newgrounds Şarkısı

demon-score = Türklist puanı ({$percent}%)

demon-video = Verification Videosu
    .validator-typemismatch = Lütfen geçerli bir URL girin

demon-thumbnail = Kapak resmi
    .validator-typemismatch = Lütfen geçerli bir URL girin
    .validator-valuemissing = Lütfen URL girin

demon-position = Pozisyon
    .validator-rangeunderflow = Demon pozisyonu en az 1 olmalı
    .validator-badinput = Demon pozisyonu gerçek bir tam sayı olmalıdır
    .validator-stepmismatch = Demon pozisyonu kesirli olmalıdır
    .validator-valuemissing = Lütfen pozisyon belirtin

demon-requirement = Kayıt gereksinimi
    .validator-rangeunderflow = Kayıt gereksinimi negatif olamaz
    .validator-rangeoverflow = Kayıt gereksinimi 100'den büyük olamaz
    .validator-badinput = Kayıt gereksinimi gerçek bir tam sayı olmalıdır
    .validator-stepmismatch = Kayıt gereksinimi kesirli olamaz
    .validator-valuemissing = Lütfen bir kayıt gereksinimi belirtin

demon-publisher = Yayınlayan
    .validator-valuemissing = Lütfen bir publisher belirtin

demon-verifier = Verifier
    .validator-valuemissing = Lütfen bir verifier belirtin

demon-creators = Creators

demon-headline-by = { $creator } tarafından yapıldı
demon-headline-verified-by = { $verifier } tarafından verifylandı
demon-headline-published-by = { $publisher } tarafından yayınlandı

# { $verified-and-published } represents two possible variations of text
# either .same-verifier-publisher OR .unique-verifier-publisher
#
# { $more } in .more-creators is transformed into a tooltip listing all of
# a demon's creators, with the text being .more-creators-tooltip
demon-headline = { $creator } tarafından
    .same-verifier-publisher = { $publisher } tarafından verifylandı ve yayınlandı
    .unique-verifier-publisher = { demon-headline-published-by }, { demon-headline-verified-by }

    .no-creators = bilinmeyen tarafından yapıldı, { $verified-and-published }

    .one-creator = { demon-headline-by }, { $verified-and-published }
    .one-creator-is-publisher = { demon-headline-by }, { $verifier } tarafından verifylandı
    .one-creator-is-verifier = { demon-headline-by }, { $publisher } tarafından yayınlandı

    .two-creators = { $creator1 } ve { $creator2 } tarafından yapıldı, { $verified-and-published }

    .more-creators = { $creator } ve { $more } tarafından yapıldı, { $verified-and-published }
    .more-creators-tooltip = diğer

## Position history table
movements = Pozisyon Tarihçesi
    .date = Tarih
    .change = Değişim

movements-newposition = Yeni Pozisyon
    .legacy = Legacy

movements-reason = Sebep
    .added = Liste eklendi
    .addedabove = { $demon } üzerine eklendi
    .moved = Yeri değiştirildi
    .movedabove = { $demon } bu demonun üzerine yerleştirildi
    .movedbelow = { $demon } bu demonun altına yerleştirildi

## Records table
demon-records = Kayıtlar

demon-records-qualify = Kabul için {$percent}% { $percent ->
    [100] gerekli
    *[other] veya daha fazlası gerekli
}

demon-records-total = {$num-records} { $num-records ->
    [one] kayıt kayıtlı
    *[other] kayıt kayıtlı
}, ve bunlardan {$num-completions} { $num-completions ->
    [one] tanesi 100%
    *[other] tanesi 100%
}

## Demons tab in user area
demons = Demonlar
demon-manager = Demon Yöneticisi

demon-listed = {$demon} (ID: {$demon-id})
    .publisher = {$publisher} tarafından

demon-viewer = Demon #
    .welcome = Başlamak için sağdaki herhangi bir Demon'a tıkla!

    .video-field = { demon-video }:
    .thumbnail-field = { demon-thumbnail }:
    .position-field = { demon-position }:
    .requirement-field = { demon-requirement }:
    .publisher-field = { demon-publisher }:
    .verifier-field = { demon-verifier }:
    .creators-field = { demon-creators }:

demon-add-panel = Demon Ekle
    .button = Demon ekle!

# Demon addition form
demon-add-form = Demon Ekle
    .name-field = { demon-name }:
    .name-validator-valuemissing = Lütfen Demon için bir isim gir

    .levelid-field = Geometry Dash Level ID'si:
    .position-field = { demon-position }:
    .requirement-field = { demon-requirement }:
    .verifier-field = { demon-verifier }:
    .publisher-field = { demon-publisher }:
    .video-field = { demon-video }:
    .creators-field = { demon-creators }:

    .submit = Demon Ekle

    .edit-success = Demon başarılı bir şekilde eklendi!

# Demon viewer dialogs
demon-video-dialog = Verification video linkini değiştir
    .info = Bu kaydın verification linkini değiştir. Verification videosunu kaldırmak için boş bırak.
    .video-field = Video linki:
    .submit = Düzenle

demon-name-dialog = Demon adını değiştir
    .info = Bu demonun adını değiştir. Aynı adla birkaç demon destekleniyor!
    .name-field = Ad:
    .submit = Düzenle

# { $video-id } will be replaced by https://i.ytimg.com/vi/{.info-videoid}/mqdefault.jpg but italicized
# in english, this looks like https://i.ytimg.com/vi/VIDEO_ID/mqdefault.jpg
demon-thumbnail-dialog = Videonun kapak resmini değiştir
    .info = Bu kaydın kapak fotoğrafı linkini değiştir. Bir youtube videosunun kapak resmine yönlendirmek için, { $video-id } olarak ayarla.
    .info-videoid = VIDEO_ID

    .thumbnail-field = Kapak resmi linki:
    .submit = Düzenle

demon-position-dialog = Demon pozisyonunu değiştir
    .info = Bu demonun pozisyonunu değiştir. 0'dan büyük ve en fazla listin level sayısı olmalı.
    .position-field = Pozisyon:
    .submit = Düzenle

demon-requirement-dialog = Demon kayıt gereksinimini değiştir
    .info = Bu demonun kayıt gereksinimini değiştir. 0 ve 100 dahil bu sayılar arasında olmalı.
    .requirement-field = Kayıt Gereksinimi:
    .submit = Düzenle

demon-publisher-dialog = Demon yayınlayıcısını değiştir
    .info = Bu demonun yeni yayınlayıcısını aşağıdaki yere yaz. Eğer yeni yayınlayıcı listte varsa, aşağıda öneri olarak gösterilecektir. Sonra aşağıdaki tuşa tıklayın.
    .submit = Düzenle

demon-verifier-dialog = Demon verifierı değiştir
    .info = Bu demonun yeni verifierını aşağıdaki yere yaz. Eğer yeni verifier listte varsa, aşağıda öneri olarak gösterilecektir. Sonra aşağıdaki tuşa tıklayın.
    .submit = Düzenle

demon-creator-dialog = Creator ekle
    .info = Bu demona creator olarak eklenecek kişiyi aşağıdaki yere yaz. Eğer yeni creator listte varsa, aşağıda öneri olarak gösterilecektir. Sonra aşağıdaki tuşa tıklayın.
    .submit = Creatoru Ekle

    .edit-success = Creator başarılı bir şekilde eklendi!