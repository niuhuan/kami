use crate::copy_client::{Author, ErrorInfo, LoginResult, MemberInfo};
use crate::database::active::comic_view_log;
use crate::database::cache::{image_cache, web_cache};
use crate::database::download::{
    download_comic, download_comic_chapter, download_comic_group, download_comic_page,
};
use crate::database::properties::property;
use crate::commons::udto::{
    ExportsType, UICacheImage, UIChapterData, UIComicData, UIComicQuery, UIDownloadComic,
    UIDownloadComicChapter, UIDownloadComicGroup, UIDownloadComicPage, UILoginState,
    UIPageCollectedComic, UIPageComicChapter, UIPageComicInExplore, UIPageRankItem,
    UIPageUIComicInList, UIPageUIViewLog, UIQueryDownloadComic, UIRegisterResult, UITags,
    UIViewLog,
};
use crate::commons::utils::{hash_lock, join_paths};
use crate::commons::{downloading, define::{get_image_cache_dir, CLIENT}};
use anyhow::Result;
use image::EncodableLayout;
use reqwest::Proxy;
use std::time::Duration;

pub async fn save_property(k: String, v: String) -> Result<()> {
    property::save_property(k, v).await
}

pub async fn load_property(k: String) -> Result<String> {
    property::load_property(k).await
}

pub async fn get_proxy() -> Result<String> {
    property::load_property("proxy".to_owned()).await
}

pub async fn set_proxy(proxy: String) -> Result<()> {
    CLIENT
        .set_agent(
            if proxy.is_empty() {
                reqwest::Client::builder()
            } else {
                reqwest::Client::builder().proxy(Proxy::all(proxy.as_str())?)
            }
                .build()?,
        )
        .await;
    property::save_property("proxy".to_owned(), proxy).await?;
    Ok(())
}

pub async fn init_login_state() -> Result<UILoginState> {
    let token = property::load_property("token".to_owned()).await?;
    if token.is_empty() {
        Ok(UILoginState {
            state: 0,
            message: "".to_string(),
            member: Default::default(),
        })
    } else {
        CLIENT.set_token(token).await;
        match CLIENT.member_info().await {
            Ok(member) => Ok(UILoginState {
                state: 1,
                message: "".to_string(),
                member: Some(member),
            }),
            Err(err) => {
                match err.info {
                    ErrorInfo::Network(e) => Ok(UILoginState {
                        state: 2,
                        message: e.to_string(),
                        member: Default::default(),
                    }),
                    ErrorInfo::Message(_) => {
                        // token 已经失效
                        // todo : 用来token过期重新登录
                        // property::load_property("username".to_owned()).await?;
                        // property::load_property("password".to_owned()).await?;
                        property::save_property("token".to_owned(), "".to_owned()).await?;
                        Ok(UILoginState {
                            state: 0,
                            message: "".to_string(),
                            member: None,
                        })
                    }
                    ErrorInfo::Convert(e) => Ok(UILoginState {
                        state: 2,
                        message: e.to_string(),
                        member: None,
                    }),
                    ErrorInfo::Other(e) => Ok(UILoginState {
                        state: 2,
                        message: e.to_string(),
                        member: None,
                    }),
                }
            }
        }
    }
}

pub async fn login(username: String, password: String) -> Result<UILoginState> {
    let result = CLIENT.login(username.as_str(), password.as_str()).await;
    match result {
        Ok(ok) => {
            CLIENT.set_token(ok.token.clone()).await;
            property::save_property("token".to_owned(), ok.token.clone()).await?;
            property::save_property("username".to_owned(), username).await?;
            property::save_property("password".to_owned(), password).await?;
            let _ = web_cache::clean_web_cache_by_like(format!("COMIC_QUERY$%").as_str()).await;
            Ok(UILoginState {
                state: 1,
                message: "".to_string(),
                member: Some(member_from_result(ok)),
            })
        }
        Err(err) => match err.info {
            ErrorInfo::Network(err) => Ok(UILoginState {
                state: 2,
                message: err.to_string(),
                member: None,
            }),
            ErrorInfo::Message(err) => Ok(UILoginState {
                state: 2,
                message: err,
                member: None,
            }),
            ErrorInfo::Convert(err) => Ok(UILoginState {
                state: 2,
                message: err.to_string(),
                member: None,
            }),
            ErrorInfo::Other(err) => Ok(UILoginState {
                state: 2,
                message: err.to_string(),
                member: None,
            }),
        },
    }
}

fn member_from_result(result: LoginResult) -> MemberInfo {
    MemberInfo {
        user_id: result.user_id,
        username: result.username,
        nickname: result.nickname,
        avatar: result.avatar,
        is_authenticated: result.is_authenticated,
        datetime_created: result.datetime_created,
        b_verify_email: result.b_verify_email,
        email: result.email,
        mobile: result.mobile,
        mobile_region: result.mobile_region,
        point: result.point,
        comic_vip: result.comic_vip,
        comic_vip_end: result.comic_vip_end,
        comic_vip_start: result.comic_vip_start,
        cartoon_vip: result.cartoon_vip,
        cartoon_vip_end: result.cartoon_vip_end,
        cartoon_vip_start: result.cartoon_vip_start,
        ads_vip_end: result.ads_vip_end,
        close_report: result.close_report,
        downloads: result.downloads,
        vip_downloads: result.vip_downloads,
        reward_downloads: result.reward_downloads,
        invite_code: result.invite_code,
        invited: result.invited,
        b_sstv: result.b_sstv,
        scy_answer: result.scy_answer,
        day_downloads_refresh: "".to_owned(),
        day_downloads: 0,
    }
}

pub async fn register(username: String, password: String) -> Result<UIRegisterResult> {
    match CLIENT.register(username.as_str(), password.as_str()).await {
        Ok(data) => Ok(UIRegisterResult {
            state: 1,
            message: "".to_string(),
            member: Some(data),
        }),

        Err(err) => match err.info {
            ErrorInfo::Network(err) => Ok(UIRegisterResult {
                state: 2,
                message: err.to_string(),
                member: None,
            }),
            ErrorInfo::Message(err) => Ok(UIRegisterResult {
                state: 2,
                message: err,
                member: None,
            }),
            ErrorInfo::Convert(err) => Ok(UIRegisterResult {
                state: 2,
                message: err.to_string(),
                member: None,
            }),
            ErrorInfo::Other(err) => Ok(UIRegisterResult {
                state: 2,
                message: err.to_string(),
                member: None,
            }),
        },
    }
}

pub async fn rank(date_type: String, offset: u64, limit: u64) -> Result<UIPageRankItem> {
    let key = format!("COMIC_RANK${}${}${}", date_type, offset, limit);
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 2),
        Box::pin(async move { CLIENT.comic_rank(date_type.as_str(), offset, limit).await }),
    ).await
}

pub async fn recommends(offset: u64, limit: u64) -> Result<UIPageUIComicInList> {
    let key = format!("COMIC_RECOMMENDS${}${}", offset, limit);
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 2),
        Box::pin(async move { CLIENT.recommends(offset, limit).await }),
    ).await
}

pub async fn comic(path_word: String) -> Result<UIComicData> {
    let key = format!("COMIC${}", path_word);
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 2),
        Box::pin(async move { CLIENT.comic(path_word.as_str()).await }),
    ).await
}

pub async fn comic_chapters(
    comic_path_word: String,
    group_path_word: String,
    limit: u64,
    offset: u64,
) -> Result<UIPageComicChapter> {
    let key = format!("COMIC_CHAPTERS${comic_path_word}${group_path_word}${limit}${offset}");
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 2),
        Box::pin(async move {
            CLIENT
                .comic_chapter(
                    comic_path_word.as_str(),
                    group_path_word.as_str(),
                    limit,
                    offset,
                )
                .await
        }),
    ).await
}

pub async fn comic_query(path_word: String) -> Result<UIComicQuery> {
    let key = format!("COMIC_QUERY${path_word}");
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 2),
        Box::pin(async move { CLIENT.comic_query(path_word.as_str()).await }),
    ).await
}

pub async fn comic_chapter_data(comic_path_word: String, chapter_uuid: String) -> Result<UIChapterData> {
    let key = format!("COMIC_CHAPTER_DATA${comic_path_word}${chapter_uuid}");
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 2),
        Box::pin(async move {
            CLIENT
                .comic_chapter_data(comic_path_word.as_str(), chapter_uuid.as_str())
                .await
        }),
    ).await
}

pub async fn tags() -> Result<UITags> {
    let key = format!("COMIC_TAGS");
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 15),
        Box::pin(async move { CLIENT.tags().await }),
    ).await
}

pub async fn explorer(
    ordering: Option<String>,
    top: Option<String>,
    theme: Option<String>,
    offset: u64,
    limit: u64,
) -> Result<UIPageComicInExplore> {
    let key = format!(
        "COMIC_EXPLORER${:?}${:?}${:?}${}${}",
        ordering, top, theme, limit, offset
    );
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 2),
        Box::pin(async move {
            CLIENT
                .explore(
                    ordering.as_deref(),
                    top.as_deref(),
                    theme.as_deref(),
                    offset,
                    limit,
                )
                .await
        }),
    ).await
}

pub async fn comic_search(
    q_type: String,
    q: String,
    offset: u64,
    limit: u64,
) -> Result<UIPageUIComicInList> {
    let key = format!("COMIC_SEARCH${}${}${}${}", q_type, q, limit, offset);
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 2),
        Box::pin(async move {
            CLIENT
                .comic_search(q_type.as_str(), q.as_str(), offset, limit)
                .await
        }),
    ).await
}

pub async fn view_comic_info(
    comic_path_word: String,
    comic_name: String,
    comic_authors: Vec<Author>,
    comic_cover: String,
) -> Result<()> {
    comic_view_log::view_info(comic_view_log::Model {
        comic_path_word,
        comic_name,
        comic_authors: serde_json::to_string(&comic_authors)?,
        comic_cover,
        ..Default::default()
    }).await
}

pub async fn view_chapter_page(
    comic_path_word: String,
    chapter_uuid: String,
    chapter_name: String,
    chapter_ordered: i64,
    chapter_size: i64,
    chapter_count: i64,
    page_rank: i32,
) -> Result<()> {
    comic_view_log::view_page(comic_view_log::Model {
        comic_path_word,
        chapter_uuid,
        chapter_name,
        chapter_ordered,
        chapter_size,
        chapter_count,
        page_rank,
        ..Default::default()
    }).await
}

pub async fn find_comic_view_log(path_word: String) -> Result<Option<UIViewLog>> {
    Ok(
        if let Some(model) = comic_view_log::view_log_by_comic_path_word(path_word).await? {
            Some(UIViewLog::from(model))
        } else {
            None
        },
    )
}

pub async fn list_comic_view_logs(offset: i64, limit: i64) -> Result<UIPageUIViewLog> {
    let count = comic_view_log::count().await?;
    let list = comic_view_log::load_view_logs(offset as u64, limit as u64).await?;
    Ok(UIPageUIViewLog {
        total: count as i64,
        limit,
        offset,
        list: list.into_iter().map(UIViewLog::from).collect(),
    })
}

pub async fn collect_to_account(
    comic_id: String,
    is_collect: bool,
    comic_path_word: String,
) -> Result<()> {
    collect_to_account_move(
        comic_id,
        is_collect,
        comic_path_word,
    ).await
}

async fn collect_to_account_move(
    comic_id: String,
    is_collect: bool,
    comic_path_word: String,
) -> Result<()> {
    CLIENT.collect(comic_id.as_str(), is_collect).await?;
    web_cache::clean_web_cache_by_like("COMIC_COLLECT%").await?;
    web_cache::clean_web_cache_by_like(format!("COMIC_QUERY${comic_path_word}").as_str()).await?;
    Ok(())
}

pub async fn collect_from_account(
    free_type: i64,
    ordering: String,
    offset: u64,
    limit: u64,
) -> Result<UIPageCollectedComic> {
    let key = format!("COMIC_COLLECT${free_type}${ordering}${offset}${limit}$");
    web_cache::cache_first_map(
        key,
        Duration::from_secs(60 * 60 * 2),
        Box::pin(async move {
            CLIENT
                .collected_comics(free_type, ordering.as_str(), offset, limit)
                .await
        }),
    ).await
}

pub async fn cache_image(
    cache_key: String,
    url: String,
    useful: String,
    extends_field_first: Option<String>,
    extends_field_second: Option<String>,
    extends_field_third: Option<String>,
) -> Result<UICacheImage> {
    let _ = hash_lock(&url).await;
    if let Some(model) = image_cache::load_image_by_cache_key(cache_key.as_str()).await? {
        image_cache::update_cache_time(cache_key.as_str()).await?;
        Ok(UICacheImage::from(model))
    } else if let Some(model) = download_comic::has_download_cover(cache_key.clone()).await? {
        // check downloads images has the same key
        Ok(UICacheImage::from(model))
    } else if let Some(model) = download_comic_page::has_download_pic(cache_key.clone()).await?
    {
        // check downloads images has the same key
        Ok(UICacheImage::from(model))
    } else {
        let local_path = hex::encode(md5::compute(&url).as_slice());
        let abs_path = join_paths(vec![get_image_cache_dir().as_str(), &local_path]);
        let bytes = CLIENT.download_image(url.as_str()).await?;
        let format = image::guess_format(bytes.as_bytes())?;
        let format = if let Some(format) = format.extensions_str().first() {
            format.to_string()
        } else {
            "".to_string()
        };
        let image = image::load_from_memory(&bytes)?;
        let model = image_cache::Model {
            cache_key,
            url,
            useful,
            extends_field_first,
            extends_field_second,
            extends_field_third,
            local_path,
            cache_time: chrono::Local::now().timestamp_millis(),
            image_format: format,
            image_width: image.width(),
            image_height: image.height(),
        };
        let model = image_cache::insert(model.clone()).await?;
        tokio::fs::write(&abs_path, &bytes).await?;
        Ok(UICacheImage::from(model))
    }
}

pub async fn clean_cache(time: i64) -> Result<()> {
    let time = chrono::Local::now().timestamp() - time;
    clean_web(time).await?;
    clean_image(time).await?;
    crate::database::cache::vacuum().await?;
    Ok(())
}

async fn clean_web(time: i64) -> Result<()> {
    web_cache::clean_web_cache_by_time(time).await
}

async fn clean_image(time: i64) -> Result<()> {
    let dir = get_image_cache_dir();
    loop {
        let caches: Vec<image_cache::Model> = image_cache::take_100_cache(time).await?;
        if caches.is_empty() {
            break;
        }
        for cache in caches {
            let local = join_paths(vec![dir.as_str(), cache.local_path.as_str()]);
            image_cache::delete_by_cache_key(cache.cache_key).await?; // 不管有几条被作用
            let _ = std::fs::remove_file(local); // 不管成功与否
        }
    }
    Ok(())
}

pub async fn delete_download_comic(comic_path_word: String) -> Result<()> {
    downloading::delete_download_comic(comic_path_word).await
}

pub async fn append_download(data: UIQueryDownloadComic) -> Result<()> {
    downloading::append_download(data).await
}

pub async fn in_download_chapter_uuid(comic_path_word: String) -> Result<Vec<String>> {
    download_comic_chapter::in_download_chapter_uuid(
        comic_path_word,
    ).await
}

pub async fn reset_fail_downloads() -> Result<()> {
    downloading::reset_fail_downloads().await
}

pub async fn download_comics() -> Result<Vec<UIDownloadComic>> {
    Ok(download_comic::all().await?
        .into_iter()
        .map(UIDownloadComic::from)
        .collect())
}

pub async fn download_comic_groups(comic_path_word: String) -> Result<Vec<UIDownloadComicGroup>> {
    Ok(download_comic_group::find_by_comic_path_word(
        comic_path_word.as_str(),
    ).await?
        .into_iter()
        .map(UIDownloadComicGroup::from)
        .collect())
}

pub async fn download_comic_chapters(comic_path_word: String) -> Result<Vec<UIDownloadComicChapter>> {
    Ok(download_comic_chapter::find_by_comic_path_word(
        comic_path_word.as_str(),
    ).await?
        .into_iter()
        .map(UIDownloadComicChapter::from)
        .collect())
}

pub async fn download_comic_pages(
    comic_path_word: String,
    chapter_uuid: String,
) -> Result<Vec<UIDownloadComicPage>> {
    Ok(
        download_comic_page::find_by_comic_path_word_and_chapter_uuid(
            comic_path_word.as_str(),
            chapter_uuid.as_str(),
        )
        .await?
        .into_iter()
        .map(UIDownloadComicPage::from)
        .collect())
}

pub async fn download_is_pause() -> Result<bool> {
    Ok(downloading::download_is_pause().await)
}

pub async fn download_set_pause(pause: bool) -> Result<()> {
    Ok(downloading::download_set_pause(pause).await)
}

pub async fn http_get(url: String) -> Result<String> {
    Ok(reqwest::ClientBuilder::new()
        .user_agent("kami")
        .build()?
        .get(url)
        .send()
        .await?
        .error_for_status()?
        .text()
        .await?)
}

pub async fn exports(
    uuid_list: Vec<String>,
    export_to_folder: String,
    exports_type: ExportsType,
) -> Result<()> {
    crate::commons::exports::exports(
        uuid_list,
        export_to_folder,
        exports_type,
    ).await
}
