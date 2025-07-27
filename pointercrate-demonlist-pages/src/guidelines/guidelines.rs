use pointercrate_core_pages::PageFragment;
use pointercrate_core_pages::head::Head;
use maud::{html, Markup, PreEscaped};

pub fn guidelines() -> PageFragment {
    PageFragment::new(
        "List Yönergeleri", 
        "Liste kabul edilmek için dikkat edilmesi gereken yönergeler!",
    ).body(html! {
        section.panel.fade.js-scroll-anim data-anim = "fade" style = "flex-grow: 0; max-width:800px; margin:2rem auto;" {
            h1 {
                "List Yönergeleri"
            }
            p {
                "Burada, Türklist'in kuralları vardır. Kusursuz bir deneyim sağlamak için lütfen bu kurallara ve yönergelere uyun! "
                strong {
                    "Yönergelerin her an değişebileceğini unutmayın!"
                }
            }
            small {
                "Not: Burada yazmasa da "
                a.link href="https://pointercrate.com/guidelines/index" {
                    "Pointercrate kuralları"
                }
                "geçerlidir."
            }
        }

        section.panel.fade.js-scroll-anim data-anim = "fade" style = "flex-grow: 0; max-width:800px; margin:2rem auto;" {
            h1 {
                "Raw Footage"
            }
            p {
                "Raw Footage, demonu geçtiğiniz video kaydının editlenmemiş hâlidir. "
                strong {
                    "Her kayıtta raw footage gereklidir! Raw footage en az 5 dakika olmalıdır ve editlenmemelidir! "
                }
                "Raw footage'ınızda mikrofon sesleri izole olarak ayrı bir track'de olmalıdır! Nasıl yapıldığını bilmiyorsanız "
                a.link href="https://youtu.be/YNlRUVk3oE8?feature=shared" {
                    "Pointercrate tarafından yapılan "
                }
                "bu kılavuza bakabilirsiniz. "
                strong {
                    "Raw footage sadece Google Drive'dan paylaşılmalıdır!"
                }
            }
        }

        section.panel.fade.js-scroll-anim data-anim = "fade" style = "flex-grow: 0; max-width:800px; margin:2rem auto;" {
            h1 {
                "Göstergeler"
            }
            p {
                "Her kaydın "
                strong {
                    "FPS Göstergesi ve Cheat Indicator içermesi zorunludur! "
                }
                "Mümkünse CPS sayacı ve saatin gösterilmesi kaydınızın kabul edilme olasılığını arttırır."
            }
        }

        section.panel.fade.js-scroll-anim data-anim = "fade" style = "flex-grow: 0; max-width:800px; margin:2rem auto;" {
            h1 {
                "Skipler"
            }
            p {
                "Eğer demonu geçtiğiniz denemede skip kullandıysanız, "
                strong {
                    "bu skip zorluğu etkilememelidir veya az etkilemelidir! "
                }
                "Demonun çoğunluğunu atlayan veya zorluğu çok düşüren skip kullandıysanız kaydınız reddedilecektir!"
            }
        }

        section.panel.fade.js-scroll-anim data-anim = "fade" style = "flex-grow: 0; max-width:800px; margin:2rem auto;" {
            h1 {
                "İzin verilen hackler/modlar"
            }
            p {
                a.link href="https://docs.google.com/spreadsheets/d/1uRyMYOEKLSE8x9_LghU2dDtGbvOL2xxxubNA-5f2Pzw/edit?usp=sharing" {
                    "Bu listeden "
                }
                "bakın. Eğer bir hack/mod bu listede yoksa ve hile sayılıp sayılmayacağını bilmiyorsanız, "
                a.link href="https://discord.com/invite/aR8BmktE5M" {
                    "Discord sunucumuzdan "
                }
                "bize sorun."
            }
        }
    })
}