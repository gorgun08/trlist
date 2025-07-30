## Commonly referenced record data
record-submitted = Gönderilmiş
record-underconsideration = İncelenmekte
record-approved = Onaylanmış
record-rejected = Reddedilmiş

record-videolink = Video Linki
record-videoproof = Video Kanıtı
record-rawfootage = Raw Footage
record-demon = Demon
record-holder = Kayıt Sahibi
record-progress = Progress
record-submitter = Gönderenin ID'si

## Records tab (user area)
records = Kayıtlar
record-manager = Kayıt Yöneticisi
    .all-option = Tüm Demonlar

record-listed = { $record-id }. Kayıt
    .progress = { $demon }'da { $percent }%

record-viewer = Kayıt #
    .welcome = Sağdaki kayıtlardan birisine tıklayarak kayıtları yönetebilirsiniz!
    .delete = Kaydı Sil

    .copy-data-success = Kayıt verisi kopyalandı!
    .copy-data-error = Kayıt verisi kopyalanamadı

    .confirm-delete = Bu kaydı silmek istediğinizden emin misiniz? Bu kayıt ile notları silinecek ve bu işlem geri alınamayacaktır!

record-note = Not Ekle
    .placeholder = Buraya kaydın sahibi oyuncunun görmesi için bir not yaz. Sonra 'Ekle' tuşuna tıkla!
    .public-checkbox = Herkese açık not

    .submit = Ekle

record-note-listed = Kaydın { $note-id }. Notu
    .confirm-delete = Notu sileceksiniz ve işlem geri alınamayacak. Silmek istediğinizden emin misiniz?

    .author = Bu not { $author } tarafından bırakıldı.
    .author-submitter = Bu not, kaydı gönderenden bir yorum.
    .editors = Bu not sonrasında şu kişiler tarafından düzenlendi: { $editors }.
    .transferred = Bu not aslında ilk olarak bu kayda bırakılmamıştı.
    .public = Bu not herkese açıktır.

record-status-filter-panel = Filtrele
    .info = Kayıt durumu olarak filtrele

record-status-filter-all = Hepsi

record-idsearch-panel = Kaydı ID ile arat
    .info = Her kaydın kendine özgü ID'si vardır. Aşağıda kaydın ID'sini girin.
    .id-field = Kayıt ID'si:

    .submit = ID ile arat

    .id-validator-valuemissing = ID gereklidir

record-playersearch-panel = Oyuncuya göre filtrele
    .info = Her oyuncunun kendine özgü bir ID'si ve adı vardır. Bunlardan herhangi birini uygun alana yazabilirsiniz.

    .id-field = Oyuncu ID'si:
    .id-submit = ID ile bul

    .name-field = Oyuncu adı:
    .name-submit = İsimle bul

# Record viewer dialogs
record-videolink-dialog = Video bağlantısını değiştir
    .info = Bu kaydın video bağlantısını değiştirin. Liste moderatörüyseniz, bu bağlantıyı kaldırmak için alanı boş bırakabilirsiniz.
    .videolink-field = Video bağlantısı:

    .submit = Düzenle

    .videolink-validator-typemismatch = Lütfen geçerli bir URL girin

record-demon-dialog = Demon'u değiştir
    .info = Bu kayıtla ilişkilendirilecek demon'u değiştirin. Aşağıdan uygun demon'u arayıp tıklayın.

record-holder-dialog = Kayıt sahibini değiştir
    .info = Aşağıdaki alana yeni kayıt sahibini yazın. Eğer oyuncu zaten varsa, altta öneri olarak çıkacaktır. Sonra alttaki butona tıklayın.
    .submit = Düzenle

record-progress-dialog = Kayıt ilerlemesini değiştir
    .info = Bu kaydın ilerleme yüzdesini değiştirin. Demon'un kayıt gereksinimi ile 100 arasında bir değer olmalıdır.
    .progress-field = İlerleme:

    .submit = Düzenle

    .progress-validator-rangeunderflow = Kayıt ilerlemesi negatif olamaz
    .progress-validator-rangeoverflow = Kayıt ilerlemesi %100'den fazla olamaz
    .progress-validator-badinput = Kayıt ilerlemesi geçerli bir tam sayı olmalıdır
    .progress-validator-stepmismatch = Kayıt ilerlemesi ondalık sayı olamaz
    .progress-validator-valuemissing = Lütfen bir ilerleme değeri girin

# Record manager help
record-manager-help = Kayıtları Yönet
    .a = Soldaki listeyi kullanarak kayıtları düzenlemek veya görüntülemek için seçin. Sağdaki panelden kayıtları duruma, oyuncuya vs. göre filtreleyin. En üstteki { record-status-filter-all } alanına tıklayarak demon'a göre filtreleyebilirsiniz.

    .b = Bir kaydın alabileceği dört farklı durum vardır: { record-rejected }, { record-approved }, { record-submitted } ve { record-underconsideration }. Açıklamaları kolaylaştırmak için Bob'un bir oyuncu, Cataclysm'in ise bir demon olduğunu varsayacağız.

    .rejected = Kayıt { record-rejected } durumundaysa, Bob'un Cataclysm'de başka bir kaydı yoktur ve yeni bir gönderim yapılamaz. Tersine, Bob'un Cataclysm'de reddedilmemiş bir kaydı varsa, başka bir reddedilmiş kaydının olamayacağını da biliriz.
    Bob'un Cataclysm'deki herhangi bir kaydını reddetmek, bu demon'daki tüm diğer Bob kayıtlarını siler.

    .approved = Kayıt { record-approved } durumundaysa, bu kayıttan daha düşük ilerlemeye sahip başka bir gönderim mevcut olamaz veya kabul edilmez.
    Kayıt { record-approved } olarak değiştirildiğinde, Bob'un Cataclysm'deki daha düşük ilerlemeli tüm gönderimleri silinir.

    .submitted = Kayıt { record-submitted } durumundaysa, eşsizliği kısıtlayan herhangi bir kural yoktur. Bob'un Cataclysm için birden fazla gönderimi olabilir; yeter ki her birinin video bağlantısı farklı olsun. Ancak, yukarıda açıklandığı gibi, biri kabul ya da reddedildiğinde diğer tüm kopyalar silinir.

    .underconsideration = Kayıt { record-underconsideration } durumundaysa, konsept olarak hâlâ bir gönderimdir. Tek fark, artık Bob'un Cataclysm için başka bir gönderim yapamayacak olmasıdır.

    .note = Not

    .note-a = Bir oyuncu banlıysa, { record-approved }/{ record-submitted } durumundaki kayıtları listede bulunamaz. Tüm { record-submitted } kayıtlar silinir, diğerleri ise { record-rejected } durumuna getirilir.

    .note-b = Bir gönderici banlandığında, hâlâ { record-submitted } durumunda olan tüm kayıtları silinir. Zaten { record-approved }/{ record-rejected } olanlar etkilenmez.
