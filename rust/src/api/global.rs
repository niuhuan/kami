use flutter_rust_bridge::for_generated::anyhow::Result;
use flutter_rust_bridge::for_generated::anyhow::anyhow;
use lazy_static::lazy_static;
use tokio::sync::Mutex;
use crate::api::api::{get_proxy, set_proxy};

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn desktop_root() -> Result<String> {
    crate::commons::utils::desktop_root()
}

lazy_static! {
    static ref INIT_ED: Mutex<bool> = Mutex::new(false);
}

pub async fn init(root: String) -> Result<()> {
    let mut lock = INIT_ED.lock().await;
    if *lock {
        return Err(anyhow!("Already initialized"));
    }
    *lock = true;
    crate::commons::define::init_dirs(root.as_str()).await?;
    crate::database::init_database().await;
    set_proxy(get_proxy().await.unwrap()).await.unwrap();
    crate::commons::downloading::start().await;
    Ok(())
}

