import 'dart:collection';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/sync_utils.dart';


mixin UserDataKey {
  static const bookmarkedNewsResources = "bookmarked_news_resources";
  static const viewedNewsResources = "viewed_news_resources";
  static const followedTopics = "followed_topics";
  static const themeBrand = "theme_brand";
  static const darkThemeConfig = "dark_theme_config";
  static const useDynamicColor = "use_dynamic_color";
  static const shouldHideOnboarding = "should_hide_onboarding";
  static const topicChangeListVersion = "topic_change_list_version";
  static const newsResourceChangeListVersion =
      "news_resource_change_list_version";
}

mixin ThemeBrand {
  static const defaultBrand = "default";
  static const androidBrand = "android";
}

mixin DarkThemeConfig {
  static const followSystem = "follow_system";
  static const light = "light";
  static const dark = "dark";
}

class NiaPreferencesDataSource {
  late SharedPreferences _preference;

  static NiaPreferencesDataSource niaUserData = NiaPreferencesDataSource();

  init() async {
    _preference = await SharedPreferences.getInstance();
  }

  Future setFollowedTopicIds(Set<String> topicIds) async {
    return _preference.setStringList(
        UserDataKey.followedTopics, topicIds.toList());
  }

  Future toggleFollowedTopicId(
      {required String topicId, required bool followed}) async {
    final List<String> topicIds =
        _preference.getStringList(UserDataKey.followedTopics) ?? [];
    Set<String> newTopicIds = HashSet.of(topicIds);
    if (followed) {
      newTopicIds.add(topicId);
    } else {
      newTopicIds.remove(topicId);
    }

    _preference.setStringList(UserDataKey.followedTopics, newTopicIds.toList());
  }

  Future<List<String>> getFollowedTopicIds() async {
    return _preference.getStringList(UserDataKey.followedTopics) ?? [];
  }

  Future setThemeBrand(String themeBrand) async {
    _preference.setString(UserDataKey.themeBrand, themeBrand);
  }

  Future setDynamicColorPreference(bool useDynamicColor) async {
    _preference.setBool(UserDataKey.useDynamicColor, useDynamicColor);
  }

  Future setDarkThemeConfig(String darkThemeConfig) async {
    _preference.setString(UserDataKey.darkThemeConfig, darkThemeConfig);
  }

  Future toggleNewsResourceBookmark(
      String newsResourceId, bool bookmarked) async {
    final List<String> bookmarkedNewsIds =
        _preference.getStringList(UserDataKey.followedTopics) ?? [];
    Set<String> newBookmarkedNewsIds = HashSet.of(bookmarkedNewsIds);
    if (bookmarked) {
      newBookmarkedNewsIds.add(newsResourceId);
    } else {
      newBookmarkedNewsIds.remove(newsResourceId);
    }
    _preference.setStringList(
        UserDataKey.bookmarkedNewsResources, newBookmarkedNewsIds.toList());
  }

  Future<ChangeListVersions> getChangeListVersions() async {
    return ChangeListVersions(
        topicVersion:
            _preference.getInt(UserDataKey.topicChangeListVersion) ?? -1,
        newsResourceVersion:
            _preference.getInt(UserDataKey.newsResourceChangeListVersion) ??
                -1);
  }

  Future updateChangeListVersion(
      {required ChangeListVersions Function(ChangeListVersions) update}) async {
    final currentTopicChangeListVersion =
        _preference.getInt(UserDataKey.topicChangeListVersion) ?? -1;
    final currentNewsChangeListVersion =
        _preference.getInt(UserDataKey.newsResourceChangeListVersion) ?? -1;

    final updatedChangeListVersions = update(ChangeListVersions(
        newsResourceVersion: currentTopicChangeListVersion,
        topicVersion: currentNewsChangeListVersion));

    await _preference.setInt(UserDataKey.topicChangeListVersion,
        updatedChangeListVersions.topicVersion);
    await _preference.setInt(UserDataKey.newsResourceChangeListVersion,
        updatedChangeListVersions.newsResourceVersion);
  }
}
