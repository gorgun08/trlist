user-username = Kullanıcı Adı:
user-displayname = Görünen Ad:
    .none = Yok
user-id = Kullanıcı ID'si:

user-permissions = Yetkiler:
    .moderator = Moderator
    .administrator = Administrator

    .list-helper = List Helper
    .list-moderator = List Moderator
    .list-administrator = List Administrator

## Auth input fields
auth-username = Kullanıcı Adı:
    .validator-valuemissing = Kullanıcı adınızı giriniz
    .validator-tooshort = Kullanıcı adı çok kısa. En az 3 karakter uzunluğunda olmalıdır.
    .error-alreadytaken = Bu kullanıcı adı alınmış. Lütfen başka bir kullanıcı adı seçin
auth-password = Şifre:
    .validator-valuemissing = Şifrenizi giriniz
    .validator-tooshort = Şifre çok kısa. En az 10 karakter uzunluğunda olmalıdır.
auth-repeatpassword = Şifre Tekrar:
    .validator-notmatching = Şifreler uyuşmuyor

## Login/registration forms
#
# The .redirect-link attributes will be turned into
# clickable link, which will replace { $redirect-link }
# in the .redirect attributes
#
login = Giriş Yap
    .oauth-info = If you have linked your pointercrate account with a Google account, you must sign in via Google oauth by clicking the button below:

    .methods-separator = otherwise

    .info = Kullanıcı adınızı ve şifrenizi kullanarak giriş yapınız. Yalnızca 3 kere şifrenizi yanlış girme hakkınız bulunur. Bu haklar 30 dakikada bir yenilenir.
    .submit = Giriş Yap

    .error-invalidcredentials = Bilgiler geçersiz

    .redirect = Zaten bir türklist hesabınız var mı? { $redirect-link }
    .redirect-link = Giriş Yap

register = Kaydol
    .info = Yeni bir hesap oluşturun. Hesap oluşturduktan sonra kullanıcı adı değiştirilemez, dikkatlice seçin!
    .submit = Kaydol

    .redirect = Bir türklist hesabınız yok mu? { $redirect-link }
    .redirect-link = Kaydol

register-oauth = Kullanıcı adınızı seçiniz:
    .submit = Kaydol!

## Users tab
users = Kullanıcılar

user-viewer = Türklist Hesap Yöneticisi
    .welcome = Başlamak için soldan bir kullanıcıya tıklayın!
    .delete-user = Kullanıcıyı sil
    .edit-user = Onayla

    .edit-success = Kullanıcı başarıyla düzenlendi!
    .edit-notmodified = Hiçbir değişiklik yapılmadı!
    .delete-success = Kullanıcı başarıyla silindi!

    .own-account = Bu senin hesabın. Bu arayüzü kullanarak kendi hesabını düzenleyemezsin!

user-listed = ID: { $user-id }
    .displayname = Görünen isim:

user-idsearch-panel = Kullanıcı bul
    .info = Kullanıcılar kendilerine has ID'lere sahiptir. Birinin hesabını düzenlemek için, onun ID'sine ihtiyacınız var. Eğer ID'sini bilmiyorsanız, soldaki listeden bakabilirsiniz.
    .id-field = Kullanıcı ID'si:

    .submit = ID ile bul

    .id-validator-valuemissing = Kullanıcı ID'si Gerekli

## Profile tab
profile = Profil
    .header = Profil - {$username}

profile-username = Kullanıcı Adı
    .info = Türklist'e kayıtlı olduğunuz ve giriş yapmak için kullandığınız isim. Bu isim hesabınıza özgüdür ve değiştirilemez.

profile-display-name = Görünen Ad
    .info = Düzenlediğiniz takdirde kullanıcı adınız yerine bu ad gözükücektir. Görünen adlar hesaba özgü değildir ve türklist hesabına giriş yapmak için kullanılamaz.

    .dialog-header = Görünen Adı Düzenle
    .dialog-newname = Yeni görünen ad:

    .dialog-submit = Düzenle

profile-youtube = YouTube hesabı
    .info = Eğer bir youtube hesabınız varsa linkini buraya koyabilirsiniz. Eğer youtube hesabınızı koyarsanız sitede adınızın geçtiği yerler youtube hesabınıza yönlendirilecektir.

    .dialog-header = Youtube Kanal Linkini Düzenle
    .dialog-newlink = Yeni YouTube linki:

    .dialog-submit = Düzenle

    .newlink-validator-typemismatch = Lütfen geçerli bir URL girin

profile-permissions = Yetkiler
    .info = Türklist'te sahip olduğunuz yetkiler. 'List ...' Türklist'in bir üyesi olduğunuzun simgesidir. 'Moderator' ve 'Administrator' türklist'in yönetici ekibinin bir parçası olduğunuzu gösterir.

profile-delete-account = Hesabımı Sil
    .dialog-header = Hesabı Sil
    .dialog-info = Hesabınızı silmek geri alınamaz bir işlemdir!
    .dialog-submit = Sil

profile-change-password = Şifreyi Değiştir
    .dialog-header = Şifreyi Değiştir
    .dialog-info = Profille ilgili düzenlemeler yapmak için, şifrenizi aşağıya yeniden girmeniz gerekmektedir. Şifrenizi değiştirmek sizin hesabınızdan çıkmanıza ve giriş sayfasına yönlendirilmenize sebep olacaktır. Tüm erişim tokenleriniz geçersiz olacaktır.

    .dialog-newpassword = Yeni şifre:
    .dialog-repeatnewpassword = Yeni şifreyi tekrarla:
    .dialog-authenticate = Mevcut şifreniz:

    .dialog-submit = Düzenle

    .authenticate-validator-valuemissing = Şifre gereklidir
    .authenticate-validator-tooshort = Şifre çok kısa. En az 10 karakter uzunluğunda olmalıdır.

    .newpassword-validator-tooshort = Şifre çok kısa. En az 10 karakter uzunluğunda olmalıdır.

    .repeatnewpassword-validator-tooshort = Şifre çok kısa. En az 10 karakter uzunluğunda olmalıdır.
    .repeatnewpassword-validator-notmatching = Şifreler uyuşmuyor

profile-logout = Çıkış Yap
    .info = Bu tarayıcıda Türklist hesabınızdan çıkış yapın.
    .button = Çıkış Yap

profile-get-token = Erişim tokeninizi alın
    .info = Türklist erişim tokenin senin -veya senin izin verdiğin yazılımların- senin adına API'yı kullanmanı sağlar. Ancak, kendi hesabında değişiklik yapmana izin vermez.
    .button = Erişim tokeninizi alın

    .view-header = Sizin erişim tokeniniz

profile-invalidate-tokens = Tokenleri geçersizleştir
    .info = Eğer erişim tokeniniz leaklenirse, tokeni geçersizleştirebilirsiniz. Tokenleri geçersizleştirmek hesabınızın tüm tokenlerinin çalışmasını durduracaktır. Bu şu an tarayıcıda depolanan token için de geçerlidir, yani geçersizleştirdikten sonra tekrar giriş yapmanız gerekecektir!
    .button = Tüm tokenleri geçersizleştir

profile-oauth = Link With Google
    .info = Enable signing in to your pointercrate account via Google oauth. More secure than password login, and avoids account lock-outs due to forgotten passwords. Linking a Google account is irreversible, and you cannot change the linked Google account later on!
