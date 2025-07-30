use rocket::{http::Status, request::{FromRequest, Outcome, Request}};
use std::net::IpAddr;

#[derive(Debug, Clone, Copy)]
pub struct RealIp(pub IpAddr);

#[rocket::async_trait]
impl<'r> FromRequest<'r> for RealIp {
    type Error = ();

    async fn from_request(req: &'r Request<'_>) -> Outcome<Self, Self::Error> {
        // Try to get IP from Fly-Client-IP header, then X-Forwarded-For (take first IP), then fallback to Rocket's client_ip()
        let ip_opt = req.headers().get_one("Fly-Client-IP")
            .or_else(|| req.headers().get_one("X-Forwarded-For"))
            .and_then(|raw| raw.split(',').next())
            .and_then(|ip| ip.trim().parse::<IpAddr>().ok())
            .or_else(|| req.client_ip());

        match ip_opt {
            Some(ip) => Outcome::Success(RealIp(ip)),
            None => Outcome::Error((Status::BadRequest, ())),
        }
    }
}
