import 'dart:async';

import 'package:news/core/shared_preference/user_data.dart';

import '../sync_utils.dart';

UserDataRepository createUserDataRepository() =>
    OfflineFirstUserDataRepository(niaUserDataSource);

abstract class UserDataRepository {
  Future setFollowedTopicIds(Set<String> topicIds);

  Future toggleFollowedTopicId(
      {required String topicId, required bool followed});

  Stream<List<String>> getFollowedTopicIdsStream();

  Future setThemeBrand(String themeBrand);

  Future setDynamicColorPreference(bool useDynamicColor);

  Future setDarkThemeConfig(String darkThemeConfig);

  Future toggleNewsResourceBookmark(String newsResourceId, bool bookmarked);

  Future<ChangeListVersions> getChangeListVersions();

  Future updateChangeListVersion(
      {required ChangeListVersions Function(ChangeListVersions) update});
}

class OfflineFirstUserDataRepository implements UserDataRepository {
  final NiaPreferencesDataSource _niaUserDataSource;

  OfflineFirstUserDataRepository(this._niaUserDataSource);

  @override
  Future<ChangeListVersions> getChangeListVersions() =>
      _niaUserDataSource.getChangeListVersions();

  @override
  Stream<List<String>> getFollowedTopicIdsStream() {
    return _niaUserDataSource.getFollowedTopicIdsStream();
  }

  @override
  Future setDarkThemeConfig(String darkThemeConfig) =>
      _niaUserDataSource.setDarkThemeConfig(darkThemeConfig);

  @override
  Future setDynamicColorPreference(bool useDynamicColor) =>
      _niaUserDataSource.setDynamicColorPreference(useDynamicColor);

  @override
  Future setFollowedTopicIds(Set<String> topicIds) =>
      _niaUserDataSource.setFollowedTopicIds(topicIds);

  @override
  Future setThemeBrand(String themeBrand) =>
      _niaUserDataSource.setThemeBrand(themeBrand);

  @override
  Future toggleFollowedTopicId(
          {required String topicId, required bool followed}) =>
      _niaUserDataSource.toggleFollowedTopicId(
          topicId: topicId, followed: followed);

  @override
  Future toggleNewsResourceBookmark(String newsResourceId, bool bookmarked) =>
      _niaUserDataSource.toggleNewsResourceBookmark(newsResourceId, bookmarked);

  @override
  Future updateChangeListVersion(
          {required ChangeListVersions Function(ChangeListVersions) update}) =>
      _niaUserDataSource.updateChangeListVersion(update: update);
}
