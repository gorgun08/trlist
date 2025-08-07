submitter-banned = Yasaklı
    .yes = Evet
    .no = Hayır

## Record submitter
record-submission-panel = Kayıt Atın
    .info = Not: Lütfen boş kayıtlar atmayın, bizim işimizi zorlaştırır ve listten yasaklanırsınız. List kopya kayıt göndermeyi reddeder!
    .redirect = Kayıt atın!

# .note will prefix all notes in the record submission panel
# (not to be confused with record notes)
#
# { $guidelines-link } will be replaced by .guidelines-link,
# which is turned into a clickable link to the submission guidelines
record-submission = Kayıt Formu
    .note = Not
    .not = Eğer geçtiğiniz level listte yoksa kaydınızı { $verify-formu } aracılığıyla atınız.
    .verify-formu = bu forum

    .demon = Demon
    .demon-info = Sadece ilk {$list-size}'deki demonlar kabul edilir. Legacy demonlar kabul edilmez!

    .demon-validator-valuemissing = Lütfen bir demon belirtin!

    .holder = Kayıt sahibi
    .holder-info = Eğer bu ilk kaydınızsa isminizi sitede gözükmesini istediğiniz gibi yazın (otomatik tamlamaları boşverin). İlk kaydınız değilse önceden girdiğiniz ismi girip çıkan ismi seçiniz.

    .holder-input-placeholder = Seçmek için yazmaya başlayın.

    .holder-validator-valuemissing = Lütfen bir oyuncu belirtin.
    .holder-validator-rangeoverflow = Kullanıcı adınız çok uzun!

    .progress = Progress
    .progress-info = Yüzdelik olarak progress. Demonun kabul edilmesi için gereken yüzdeye eşit veya büyük olması gerekir!
    .progress-placeholder = örn: '50', '98'

    .progress-validator-valuemissing = Lütfen progress belirtin
    .progress-validator-rangeunderflow = Progress negatif olamaz
    .progress-validator-rangeoverflow = Progress %100'den büyük olamaz
    .progress-validator-badinput = Progress gerçek bir tam sayı olmalıdır
    .progress-validator-stepmismatch = Progress bir tam sayı olmalıdır

    .video = Video
    .video-info = Kaydın hilesiz olduğunu kanıtlamak için video. Eğer kayıt bir canlı yayında gerçekleştirildiyse ve başka hiçbir yere yayınlanmadıysa, lütfen bir canlı yayın linki verin.
    .video-note = Not: Lütfen düzgün URL linki göndermeye dikkat edin!
    .video-placeholder = örn: https://youtu.be/dQw4w9WgXcQ

    .video-validator-valuemissing = Lütfen bir video belirtin
    .video-validator-typemismatch = Lütfen düzgün bir URL girin

    .raw-footage = Raw footage
    .raw-footage-info-a = Kaydın Google Drive'a yayınlanmış, editlenmemiş videosu. Eğer kayıt canlı yayında gerçekleştirildiyse ve raw footage yoksa, lütfen o yayının VOD'unun linkini atın.
    .raw-footage-info-b = Raw footage'da olan gizli ve hassas bilgiler sadece Türklist moderatörlerinde kalacak ve başka kimseye paylaşılmayacaktır. Aynı zamanda, fark etmeden bu tür gizli bilgileri paylaşabileceğinizi de hatırlayın! Bir list yöneticisine söyleyip raw footageınızın veri tabanından kaldırılmasını isteyebilirsiniz.
    .raw-footage-note = Bu liste gönderilen her kayıt için gereklidir!

    .raw-footage-validator-typemismatch = Lütfen düzgün bir URL girin

    .notes = Notlar ya da yorumlar
    .notes-info = Bu gönderiye bakacak list moderatörü için notunuzu buraya girin.
    .notes-placeholder = Bu kayıtla ilgili hayallerin...

    .guidelines = Bu kaydı göndererek { $guidelines-link } kabul etmiş sayılıyorsunuz.
    .guidelines-link = list yönergelerini

    .submit = Kaydı gönder

    .submission-success = Kayıt başarılı bir şekilde gönderildi.
    .submission-success-queue = Kayıt başarılı bir şekilde gönderildi. Sırada { $queue-position }. !

## Submitters tab
submitters = Submitters

submitter-manager = Submitter Manager

submitter-viewer = Submitter #
    .welcome = Click on a submitter on the left to get started!

    .info-a = Welcome to the submitter manager. Here you can ban or unban submitters with an absolute revolutionary UI that totally isn't a straight up copy of the player UI, just with even more emptiness.
    .info-b = Banning a submitter will delete all records they have submitted and which are still in the 'submitted' state. All submissions of their which are approved, rejected or under consideration are untouched.

    .records-redirect = Show records in record manager

submitter-listed = Submitter #{ $submitter-id }

submitter-idsearch-panel = Search submitter by ID
    .info = Submitters can be uniquely identified by ID. Entering a submitters's ID below will select it on the left (provided the submitter exists)
    .id-field = Submitter ID:

    .submit = Find by ID

    .id-validator-valuemissing = Submitter ID required