use base64::Engine;
use once_cell::sync::OnceCell;
use flutter_rust_bridge::for_generated::anyhow::Result;
use lazy_static::lazy_static;
use crate::commons::utils::{create_dir_if_not_exists, join_paths};
use std::sync::Arc;
use crate::copy_client::Client;

const API_URL: &str = "aHR0cHM6Ly9hcGkubWFuZ2Fjb3B5LmNvbQ==";
// const API_URL_ORIGIN: &str = "aHR0cHM6Ly9hcGkuY29weW1hbmdhLm5ldA==";

fn api_url() -> String {
    String::from_utf8(base64::prelude::BASE64_STANDARD.decode(API_URL).unwrap()).unwrap()
}

lazy_static! {
        pub(crate) static ref CLIENT: Arc<Client> = Arc::new(Client::new(reqwest::Client::new(), api_url()));
}

pub(crate) static ROOT: OnceCell<String> = OnceCell::new();
pub(crate) static IMAGE_CACHE_DIR: OnceCell<String> = OnceCell::new();
pub(crate) static DATABASE_DIR: OnceCell<String> = OnceCell::new();
pub(crate) static DOWNLOAD_DIR: OnceCell<String> = OnceCell::new();

pub(crate) async fn init_dirs(root: &str) -> Result<()> {
    ROOT.set(root.to_owned()).unwrap();
    IMAGE_CACHE_DIR
        .set(join_paths(vec![root, "image_cache"]))
        .unwrap();
    DATABASE_DIR
        .set(join_paths(vec![root, "database"]))
        .unwrap();
    DOWNLOAD_DIR
        .set(join_paths(vec![root, "download"]))
        .unwrap();
    create_dir_if_not_exists(ROOT.get().unwrap());
    create_dir_if_not_exists(IMAGE_CACHE_DIR.get().unwrap());
    create_dir_if_not_exists(DATABASE_DIR.get().unwrap());
    create_dir_if_not_exists(DOWNLOAD_DIR.get().unwrap());
    Ok(())
}

#[allow(dead_code)]
pub(crate) fn get_root() -> &'static String {
    ROOT.get().unwrap()
}

pub(crate) fn get_image_cache_dir() -> &'static String {
    IMAGE_CACHE_DIR.get().unwrap()
}

pub(crate) fn get_database_dir() -> &'static String {
    DATABASE_DIR.get().unwrap()
}

pub(crate) fn get_download_dir() -> &'static String {
    DOWNLOAD_DIR.get().unwrap()
}
