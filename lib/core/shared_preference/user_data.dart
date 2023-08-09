import 'dart:collection';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
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

class NiaPreferencesDataSource extends GetxService {
  Future setFollowedTopicIds(Set<String> topicIds) async {
    final preference = await SharedPreferences.getInstance();
    return preference.setStringList(
        UserDataKey.followedTopics, topicIds.toList());
  }

  Future toggleFollowedTopicId(
      {required String topicId, required bool followed}) async {
    final preference = await SharedPreferences.getInstance();
    final List<String> topicIds =
        preference.getStringList(UserDataKey.followedTopics) ?? [];
    Set<String> newTopicIds = HashSet.of(topicIds);
    if (followed) {
      newTopicIds.add(topicId);
    } else {
      newTopicIds.remove(topicId);
    }
    preference.setStringList(UserDataKey.followedTopics, newTopicIds.toList());
  }

  Future<List<String>> getFollowedTopicIds() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getStringList(UserDataKey.followedTopics) ?? [];
  }

  Future setThemeBrand(String themeBrand) async {
    final preference = await SharedPreferences.getInstance();
    preference.setString(UserDataKey.themeBrand, themeBrand);
  }

  Future setDynamicColorPreference(bool useDynamicColor) async {
    final preference = await SharedPreferences.getInstance();
    preference.setBool(UserDataKey.useDynamicColor, useDynamicColor);
  }

  Future setDarkThemeConfig(String darkThemeConfig) async {
    final preference = await SharedPreferences.getInstance();
    preference.setString(UserDataKey.darkThemeConfig, darkThemeConfig);
  }

  Future toggleNewsResourceBookmark(
      String newsResourceId, bool bookmarked) async {
    final preference = await SharedPreferences.getInstance();
    final List<String> bookmarkedNewsIds =
        preference.getStringList(UserDataKey.followedTopics) ?? [];
    Set<String> newBookmarkedNewsIds = HashSet.of(bookmarkedNewsIds);
    if (bookmarked) {
      newBookmarkedNewsIds.add(newsResourceId);
    } else {
      newBookmarkedNewsIds.remove(newsResourceId);
    }
    preference.setStringList(
        UserDataKey.bookmarkedNewsResources, newBookmarkedNewsIds.toList());
  }

  Future<ChangeListVersions> getChangeListVersions() async {
    final preference = await SharedPreferences.getInstance();
    return ChangeListVersions(
        topicVersion:
            preference.getInt(UserDataKey.topicChangeListVersion) ?? -1,
        newsResourceVersion:
            preference.getInt(UserDataKey.newsResourceChangeListVersion) ?? -1);
  }

  Future updateChangeListVersion(
      {required ChangeListVersions Function(ChangeListVersions) update}) async {
    final preference = await SharedPreferences.getInstance();
    final currentTopicChangeListVersion =
        preference.getInt(UserDataKey.topicChangeListVersion) ?? -1;
    final currentNewsChangeListVersion =
        preference.getInt(UserDataKey.newsResourceChangeListVersion) ?? -1;
    final updatedChangeListVersions = update(ChangeListVersions(
        newsResourceVersion: currentTopicChangeListVersion,
        topicVersion: currentNewsChangeListVersion));
    await preference.setInt(UserDataKey.topicChangeListVersion,
        updatedChangeListVersions.topicVersion);
    preference.setInt(UserDataKey.newsResourceChangeListVersion,
        updatedChangeListVersions.newsResourceVersion);
  }
}
