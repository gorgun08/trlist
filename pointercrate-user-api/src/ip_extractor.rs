use rocket::{http::Status, request::{FromRequest, Outcome, Request}};
use std::net::IpAddr;

#[derive(Debug, Clone, Copy)]
pub struct RealIp(pub IpAddr);

#[rocket::async_trait]
impl<'r> FromRequest<'r> for RealIp {
    type Error = ();

    async fn from_request(req: &'r Request<'_>) -> Outcome<Self, Self::Error> {
        if let Some(ip) = req.headers().get_one("Fly-Client-IP")
            .or_else(|| req.headers().get_one("X-Forwarded-For"))
            .and_then(|raw| raw.split(',').next())
            .and_then(|ip| ip.trim().parse::<IpAddr>().ok()) 
        {
            Outcome::Success(RealIp(ip))
        } else if let Some(ip) = req.client_ip() {
            Outcome::Success(RealIp(ip))
        } else {
            Outcome::Error((Status::BadRequest, ()))
        }
    }
}
