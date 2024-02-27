// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.25.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/api.dart';
import 'api/global.dart';
import 'commons/udto.dart';
import 'copy_client/dtos.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  Author dco_decode_author(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  Browse dco_decode_box_autoadd_browse(dynamic raw);

  @protected
  int dco_decode_box_autoadd_i_64(dynamic raw);

  @protected
  LastBrowse dco_decode_box_autoadd_last_browse(dynamic raw);

  @protected
  MemberInfo dco_decode_box_autoadd_member_info(dynamic raw);

  @protected
  RegisterResult dco_decode_box_autoadd_register_result(dynamic raw);

  @protected
  UIQueryDownloadComic dco_decode_box_autoadd_ui_query_download_comic(
      dynamic raw);

  @protected
  UIViewLog dco_decode_box_autoadd_ui_view_log(dynamic raw);

  @protected
  Browse dco_decode_browse(dynamic raw);

  @protected
  ChapterComicInfo dco_decode_chapter_comic_info(dynamic raw);

  @protected
  ChapterImage dco_decode_chapter_image(dynamic raw);

  @protected
  ClassifyItem dco_decode_classify_item(dynamic raw);

  @protected
  CollectedComic dco_decode_collected_comic(dynamic raw);

  @protected
  CollectedComicInfo dco_decode_collected_comic_info(dynamic raw);

  @protected
  ExportsType dco_decode_exports_type(dynamic raw);

  @protected
  Group dco_decode_group(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  int dco_decode_i_64(dynamic raw);

  @protected
  LastBrowse dco_decode_last_browse(dynamic raw);

  @protected
  LastChapter dco_decode_last_chapter(dynamic raw);

  @protected
  List<String> dco_decode_list_String(dynamic raw);

  @protected
  List<Author> dco_decode_list_author(dynamic raw);

  @protected
  List<ChapterImage> dco_decode_list_chapter_image(dynamic raw);

  @protected
  List<CollectedComic> dco_decode_list_collected_comic(dynamic raw);

  @protected
  List<Group> dco_decode_list_group(dynamic raw);

  @protected
  Int64List dco_decode_list_prim_i_64_strict(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  List<SexualOrientation> dco_decode_list_sexual_orientation(dynamic raw);

  @protected
  List<Tag> dco_decode_list_tag(dynamic raw);

  @protected
  List<UIComicChapter> dco_decode_list_ui_comic_chapter(dynamic raw);

  @protected
  List<UIComicInExplore> dco_decode_list_ui_comic_in_explore(dynamic raw);

  @protected
  List<UIComicInList> dco_decode_list_ui_comic_in_list(dynamic raw);

  @protected
  List<UIDownloadComic> dco_decode_list_ui_download_comic(dynamic raw);

  @protected
  List<UIDownloadComicChapter> dco_decode_list_ui_download_comic_chapter(
      dynamic raw);

  @protected
  List<UIDownloadComicGroup> dco_decode_list_ui_download_comic_group(
      dynamic raw);

  @protected
  List<UIDownloadComicPage> dco_decode_list_ui_download_comic_page(dynamic raw);

  @protected
  List<UIQueryDownloadComicChapter>
      dco_decode_list_ui_query_download_comic_chapter(dynamic raw);

  @protected
  List<UIQueryDownloadComicGroup> dco_decode_list_ui_query_download_comic_group(
      dynamic raw);

  @protected
  List<UIRankItem> dco_decode_list_ui_rank_item(dynamic raw);

  @protected
  List<UITheme> dco_decode_list_ui_theme(dynamic raw);

  @protected
  List<UIViewLog> dco_decode_list_ui_view_log(dynamic raw);

  @protected
  MemberInfo dco_decode_member_info(dynamic raw);

  @protected
  String? dco_decode_opt_String(dynamic raw);

  @protected
  Browse? dco_decode_opt_box_autoadd_browse(dynamic raw);

  @protected
  int? dco_decode_opt_box_autoadd_i_64(dynamic raw);

  @protected
  LastBrowse? dco_decode_opt_box_autoadd_last_browse(dynamic raw);

  @protected
  MemberInfo? dco_decode_opt_box_autoadd_member_info(dynamic raw);

  @protected
  RegisterResult? dco_decode_opt_box_autoadd_register_result(dynamic raw);

  @protected
  UIViewLog? dco_decode_opt_box_autoadd_ui_view_log(dynamic raw);

  @protected
  RegisterResult dco_decode_register_result(dynamic raw);

  @protected
  SexualOrientation dco_decode_sexual_orientation(dynamic raw);

  @protected
  Tag dco_decode_tag(dynamic raw);

  @protected
  int dco_decode_u_32(dynamic raw);

  @protected
  int dco_decode_u_64(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  UICacheImage dco_decode_ui_cache_image(dynamic raw);

  @protected
  UIChapterAndContents dco_decode_ui_chapter_and_contents(dynamic raw);

  @protected
  UIChapterData dco_decode_ui_chapter_data(dynamic raw);

  @protected
  UIComic dco_decode_ui_comic(dynamic raw);

  @protected
  UIComicChapter dco_decode_ui_comic_chapter(dynamic raw);

  @protected
  UIComicData dco_decode_ui_comic_data(dynamic raw);

  @protected
  UIComicInExplore dco_decode_ui_comic_in_explore(dynamic raw);

  @protected
  UIComicInList dco_decode_ui_comic_in_list(dynamic raw);

  @protected
  UIComicQuery dco_decode_ui_comic_query(dynamic raw);

  @protected
  UIDownloadComic dco_decode_ui_download_comic(dynamic raw);

  @protected
  UIDownloadComicChapter dco_decode_ui_download_comic_chapter(dynamic raw);

  @protected
  UIDownloadComicGroup dco_decode_ui_download_comic_group(dynamic raw);

  @protected
  UIDownloadComicPage dco_decode_ui_download_comic_page(dynamic raw);

  @protected
  UILoginState dco_decode_ui_login_state(dynamic raw);

  @protected
  UIPageCollectedComic dco_decode_ui_page_collected_comic(dynamic raw);

  @protected
  UIPageComicChapter dco_decode_ui_page_comic_chapter(dynamic raw);

  @protected
  UIPageComicInExplore dco_decode_ui_page_comic_in_explore(dynamic raw);

  @protected
  UIPageRankItem dco_decode_ui_page_rank_item(dynamic raw);

  @protected
  UIPageUIComicInList dco_decode_ui_page_ui_comic_in_list(dynamic raw);

  @protected
  UIPageUIViewLog dco_decode_ui_page_ui_view_log(dynamic raw);

  @protected
  UIQueryDownloadComic dco_decode_ui_query_download_comic(dynamic raw);

  @protected
  UIQueryDownloadComicChapter dco_decode_ui_query_download_comic_chapter(
      dynamic raw);

  @protected
  UIQueryDownloadComicGroup dco_decode_ui_query_download_comic_group(
      dynamic raw);

  @protected
  UIRankItem dco_decode_ui_rank_item(dynamic raw);

  @protected
  UIRegisterResult dco_decode_ui_register_result(dynamic raw);

  @protected
  UITags dco_decode_ui_tags(dynamic raw);

  @protected
  UITheme dco_decode_ui_theme(dynamic raw);

  @protected
  UIViewLog dco_decode_ui_view_log(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  Author sse_decode_author(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  Browse sse_decode_box_autoadd_browse(SseDeserializer deserializer);

  @protected
  int sse_decode_box_autoadd_i_64(SseDeserializer deserializer);

  @protected
  LastBrowse sse_decode_box_autoadd_last_browse(SseDeserializer deserializer);

  @protected
  MemberInfo sse_decode_box_autoadd_member_info(SseDeserializer deserializer);

  @protected
  RegisterResult sse_decode_box_autoadd_register_result(
      SseDeserializer deserializer);

  @protected
  UIQueryDownloadComic sse_decode_box_autoadd_ui_query_download_comic(
      SseDeserializer deserializer);

  @protected
  UIViewLog sse_decode_box_autoadd_ui_view_log(SseDeserializer deserializer);

  @protected
  Browse sse_decode_browse(SseDeserializer deserializer);

  @protected
  ChapterComicInfo sse_decode_chapter_comic_info(SseDeserializer deserializer);

  @protected
  ChapterImage sse_decode_chapter_image(SseDeserializer deserializer);

  @protected
  ClassifyItem sse_decode_classify_item(SseDeserializer deserializer);

  @protected
  CollectedComic sse_decode_collected_comic(SseDeserializer deserializer);

  @protected
  CollectedComicInfo sse_decode_collected_comic_info(
      SseDeserializer deserializer);

  @protected
  ExportsType sse_decode_exports_type(SseDeserializer deserializer);

  @protected
  Group sse_decode_group(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  int sse_decode_i_64(SseDeserializer deserializer);

  @protected
  LastBrowse sse_decode_last_browse(SseDeserializer deserializer);

  @protected
  LastChapter sse_decode_last_chapter(SseDeserializer deserializer);

  @protected
  List<String> sse_decode_list_String(SseDeserializer deserializer);

  @protected
  List<Author> sse_decode_list_author(SseDeserializer deserializer);

  @protected
  List<ChapterImage> sse_decode_list_chapter_image(
      SseDeserializer deserializer);

  @protected
  List<CollectedComic> sse_decode_list_collected_comic(
      SseDeserializer deserializer);

  @protected
  List<Group> sse_decode_list_group(SseDeserializer deserializer);

  @protected
  Int64List sse_decode_list_prim_i_64_strict(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  List<SexualOrientation> sse_decode_list_sexual_orientation(
      SseDeserializer deserializer);

  @protected
  List<Tag> sse_decode_list_tag(SseDeserializer deserializer);

  @protected
  List<UIComicChapter> sse_decode_list_ui_comic_chapter(
      SseDeserializer deserializer);

  @protected
  List<UIComicInExplore> sse_decode_list_ui_comic_in_explore(
      SseDeserializer deserializer);

  @protected
  List<UIComicInList> sse_decode_list_ui_comic_in_list(
      SseDeserializer deserializer);

  @protected
  List<UIDownloadComic> sse_decode_list_ui_download_comic(
      SseDeserializer deserializer);

  @protected
  List<UIDownloadComicChapter> sse_decode_list_ui_download_comic_chapter(
      SseDeserializer deserializer);

  @protected
  List<UIDownloadComicGroup> sse_decode_list_ui_download_comic_group(
      SseDeserializer deserializer);

  @protected
  List<UIDownloadComicPage> sse_decode_list_ui_download_comic_page(
      SseDeserializer deserializer);

  @protected
  List<UIQueryDownloadComicChapter>
      sse_decode_list_ui_query_download_comic_chapter(
          SseDeserializer deserializer);

  @protected
  List<UIQueryDownloadComicGroup> sse_decode_list_ui_query_download_comic_group(
      SseDeserializer deserializer);

  @protected
  List<UIRankItem> sse_decode_list_ui_rank_item(SseDeserializer deserializer);

  @protected
  List<UITheme> sse_decode_list_ui_theme(SseDeserializer deserializer);

  @protected
  List<UIViewLog> sse_decode_list_ui_view_log(SseDeserializer deserializer);

  @protected
  MemberInfo sse_decode_member_info(SseDeserializer deserializer);

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer);

  @protected
  Browse? sse_decode_opt_box_autoadd_browse(SseDeserializer deserializer);

  @protected
  int? sse_decode_opt_box_autoadd_i_64(SseDeserializer deserializer);

  @protected
  LastBrowse? sse_decode_opt_box_autoadd_last_browse(
      SseDeserializer deserializer);

  @protected
  MemberInfo? sse_decode_opt_box_autoadd_member_info(
      SseDeserializer deserializer);

  @protected
  RegisterResult? sse_decode_opt_box_autoadd_register_result(
      SseDeserializer deserializer);

  @protected
  UIViewLog? sse_decode_opt_box_autoadd_ui_view_log(
      SseDeserializer deserializer);

  @protected
  RegisterResult sse_decode_register_result(SseDeserializer deserializer);

  @protected
  SexualOrientation sse_decode_sexual_orientation(SseDeserializer deserializer);

  @protected
  Tag sse_decode_tag(SseDeserializer deserializer);

  @protected
  int sse_decode_u_32(SseDeserializer deserializer);

  @protected
  int sse_decode_u_64(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  UICacheImage sse_decode_ui_cache_image(SseDeserializer deserializer);

  @protected
  UIChapterAndContents sse_decode_ui_chapter_and_contents(
      SseDeserializer deserializer);

  @protected
  UIChapterData sse_decode_ui_chapter_data(SseDeserializer deserializer);

  @protected
  UIComic sse_decode_ui_comic(SseDeserializer deserializer);

  @protected
  UIComicChapter sse_decode_ui_comic_chapter(SseDeserializer deserializer);

  @protected
  UIComicData sse_decode_ui_comic_data(SseDeserializer deserializer);

  @protected
  UIComicInExplore sse_decode_ui_comic_in_explore(SseDeserializer deserializer);

  @protected
  UIComicInList sse_decode_ui_comic_in_list(SseDeserializer deserializer);

  @protected
  UIComicQuery sse_decode_ui_comic_query(SseDeserializer deserializer);

  @protected
  UIDownloadComic sse_decode_ui_download_comic(SseDeserializer deserializer);

  @protected
  UIDownloadComicChapter sse_decode_ui_download_comic_chapter(
      SseDeserializer deserializer);

  @protected
  UIDownloadComicGroup sse_decode_ui_download_comic_group(
      SseDeserializer deserializer);

  @protected
  UIDownloadComicPage sse_decode_ui_download_comic_page(
      SseDeserializer deserializer);

  @protected
  UILoginState sse_decode_ui_login_state(SseDeserializer deserializer);

  @protected
  UIPageCollectedComic sse_decode_ui_page_collected_comic(
      SseDeserializer deserializer);

  @protected
  UIPageComicChapter sse_decode_ui_page_comic_chapter(
      SseDeserializer deserializer);

  @protected
  UIPageComicInExplore sse_decode_ui_page_comic_in_explore(
      SseDeserializer deserializer);

  @protected
  UIPageRankItem sse_decode_ui_page_rank_item(SseDeserializer deserializer);

  @protected
  UIPageUIComicInList sse_decode_ui_page_ui_comic_in_list(
      SseDeserializer deserializer);

  @protected
  UIPageUIViewLog sse_decode_ui_page_ui_view_log(SseDeserializer deserializer);

  @protected
  UIQueryDownloadComic sse_decode_ui_query_download_comic(
      SseDeserializer deserializer);

  @protected
  UIQueryDownloadComicChapter sse_decode_ui_query_download_comic_chapter(
      SseDeserializer deserializer);

  @protected
  UIQueryDownloadComicGroup sse_decode_ui_query_download_comic_group(
      SseDeserializer deserializer);

  @protected
  UIRankItem sse_decode_ui_rank_item(SseDeserializer deserializer);

  @protected
  UIRegisterResult sse_decode_ui_register_result(SseDeserializer deserializer);

  @protected
  UITags sse_decode_ui_tags(SseDeserializer deserializer);

  @protected
  UITheme sse_decode_ui_theme(SseDeserializer deserializer);

  @protected
  UIViewLog sse_decode_ui_view_log(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_author(Author self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_browse(Browse self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_i_64(int self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_last_browse(
      LastBrowse self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_member_info(
      MemberInfo self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_register_result(
      RegisterResult self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_ui_query_download_comic(
      UIQueryDownloadComic self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_ui_view_log(
      UIViewLog self, SseSerializer serializer);

  @protected
  void sse_encode_browse(Browse self, SseSerializer serializer);

  @protected
  void sse_encode_chapter_comic_info(
      ChapterComicInfo self, SseSerializer serializer);

  @protected
  void sse_encode_chapter_image(ChapterImage self, SseSerializer serializer);

  @protected
  void sse_encode_classify_item(ClassifyItem self, SseSerializer serializer);

  @protected
  void sse_encode_collected_comic(
      CollectedComic self, SseSerializer serializer);

  @protected
  void sse_encode_collected_comic_info(
      CollectedComicInfo self, SseSerializer serializer);

  @protected
  void sse_encode_exports_type(ExportsType self, SseSerializer serializer);

  @protected
  void sse_encode_group(Group self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_i_64(int self, SseSerializer serializer);

  @protected
  void sse_encode_last_browse(LastBrowse self, SseSerializer serializer);

  @protected
  void sse_encode_last_chapter(LastChapter self, SseSerializer serializer);

  @protected
  void sse_encode_list_String(List<String> self, SseSerializer serializer);

  @protected
  void sse_encode_list_author(List<Author> self, SseSerializer serializer);

  @protected
  void sse_encode_list_chapter_image(
      List<ChapterImage> self, SseSerializer serializer);

  @protected
  void sse_encode_list_collected_comic(
      List<CollectedComic> self, SseSerializer serializer);

  @protected
  void sse_encode_list_group(List<Group> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_i_64_strict(
      Int64List self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_list_sexual_orientation(
      List<SexualOrientation> self, SseSerializer serializer);

  @protected
  void sse_encode_list_tag(List<Tag> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_comic_chapter(
      List<UIComicChapter> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_comic_in_explore(
      List<UIComicInExplore> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_comic_in_list(
      List<UIComicInList> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_download_comic(
      List<UIDownloadComic> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_download_comic_chapter(
      List<UIDownloadComicChapter> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_download_comic_group(
      List<UIDownloadComicGroup> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_download_comic_page(
      List<UIDownloadComicPage> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_query_download_comic_chapter(
      List<UIQueryDownloadComicChapter> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_query_download_comic_group(
      List<UIQueryDownloadComicGroup> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_rank_item(
      List<UIRankItem> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_theme(List<UITheme> self, SseSerializer serializer);

  @protected
  void sse_encode_list_ui_view_log(
      List<UIViewLog> self, SseSerializer serializer);

  @protected
  void sse_encode_member_info(MemberInfo self, SseSerializer serializer);

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_browse(
      Browse? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_i_64(int? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_last_browse(
      LastBrowse? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_member_info(
      MemberInfo? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_register_result(
      RegisterResult? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_ui_view_log(
      UIViewLog? self, SseSerializer serializer);

  @protected
  void sse_encode_register_result(
      RegisterResult self, SseSerializer serializer);

  @protected
  void sse_encode_sexual_orientation(
      SexualOrientation self, SseSerializer serializer);

  @protected
  void sse_encode_tag(Tag self, SseSerializer serializer);

  @protected
  void sse_encode_u_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_u_64(int self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_ui_cache_image(UICacheImage self, SseSerializer serializer);

  @protected
  void sse_encode_ui_chapter_and_contents(
      UIChapterAndContents self, SseSerializer serializer);

  @protected
  void sse_encode_ui_chapter_data(UIChapterData self, SseSerializer serializer);

  @protected
  void sse_encode_ui_comic(UIComic self, SseSerializer serializer);

  @protected
  void sse_encode_ui_comic_chapter(
      UIComicChapter self, SseSerializer serializer);

  @protected
  void sse_encode_ui_comic_data(UIComicData self, SseSerializer serializer);

  @protected
  void sse_encode_ui_comic_in_explore(
      UIComicInExplore self, SseSerializer serializer);

  @protected
  void sse_encode_ui_comic_in_list(
      UIComicInList self, SseSerializer serializer);

  @protected
  void sse_encode_ui_comic_query(UIComicQuery self, SseSerializer serializer);

  @protected
  void sse_encode_ui_download_comic(
      UIDownloadComic self, SseSerializer serializer);

  @protected
  void sse_encode_ui_download_comic_chapter(
      UIDownloadComicChapter self, SseSerializer serializer);

  @protected
  void sse_encode_ui_download_comic_group(
      UIDownloadComicGroup self, SseSerializer serializer);

  @protected
  void sse_encode_ui_download_comic_page(
      UIDownloadComicPage self, SseSerializer serializer);

  @protected
  void sse_encode_ui_login_state(UILoginState self, SseSerializer serializer);

  @protected
  void sse_encode_ui_page_collected_comic(
      UIPageCollectedComic self, SseSerializer serializer);

  @protected
  void sse_encode_ui_page_comic_chapter(
      UIPageComicChapter self, SseSerializer serializer);

  @protected
  void sse_encode_ui_page_comic_in_explore(
      UIPageComicInExplore self, SseSerializer serializer);

  @protected
  void sse_encode_ui_page_rank_item(
      UIPageRankItem self, SseSerializer serializer);

  @protected
  void sse_encode_ui_page_ui_comic_in_list(
      UIPageUIComicInList self, SseSerializer serializer);

  @protected
  void sse_encode_ui_page_ui_view_log(
      UIPageUIViewLog self, SseSerializer serializer);

  @protected
  void sse_encode_ui_query_download_comic(
      UIQueryDownloadComic self, SseSerializer serializer);

  @protected
  void sse_encode_ui_query_download_comic_chapter(
      UIQueryDownloadComicChapter self, SseSerializer serializer);

  @protected
  void sse_encode_ui_query_download_comic_group(
      UIQueryDownloadComicGroup self, SseSerializer serializer);

  @protected
  void sse_encode_ui_rank_item(UIRankItem self, SseSerializer serializer);

  @protected
  void sse_encode_ui_register_result(
      UIRegisterResult self, SseSerializer serializer);

  @protected
  void sse_encode_ui_tags(UITags self, SseSerializer serializer);

  @protected
  void sse_encode_ui_theme(UITheme self, SseSerializer serializer);

  @protected
  void sse_encode_ui_view_log(UIViewLog self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;
}
