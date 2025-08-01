use maud::{html, Markup};

pub fn support_panel() -> Markup {
    html! {
        section #stats.panel.fade.js-scroll-anim data-anim = "fade" {
            div.underlined {
                h2 {
                    {"Siteye Destek Olun!"}
                }
            }
            p {
                {"Domain ve siteyi karşılamak için para gerekiyor. Aylık sadece 1$ veya yıllık sadece 10$ ödeyerek siteye destek olabilirsiniz!"}
            }
            script type="text/javascript" src="https://cdnjs.buymeacoffee.com/1.0.0/button.prod.min.js" data-name="bmc-button" data-slug="turklist" data-color="#944843" data-emoji="☕"  data-font="Lato" data-text="Destek Olun!" data-outline-color="#ffffff" data-font-color="#ffffff" data-coffee-color="#FFDD00" {

            }
        }
    }
}