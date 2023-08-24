import 'dart:async';

import 'package:news/core/shared_preference/user_data.dart';

import '../sync_utils.dart';

UserDataRepository userDataRepository =
    OfflineFirstUserDataRepository(niaUserDataSource);

abstract class UserDataRepository {
  Future setFollowedTopicIds(Set<String> topicIds);

  Future toggleFollowedTopicId(
      {required String topicId, required bool followed});

  Stream<List<String>> getFollowedTopicIdsStream();

  Future updateNewsResourceBookmark(String newsId, bool saved);

  Stream<List<String>> getSavedNewsResourcesStream();

  Future setThemeBrand(String themeBrand);

  Future setShouldHideOnboarding(bool shouldHideOnboarding);

  Stream<bool> getShouldHideOnboardingStream();

  Future setDynamicColorPreference(bool useDynamicColor);

  Future setDarkThemeConfig(String darkThemeConfig);

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
  Future updateChangeListVersion(
          {required ChangeListVersions Function(ChangeListVersions) update}) =>
      _niaUserDataSource.updateChangeListVersion(update: update);

  @override
  Future setShouldHideOnboarding(bool shouldHideOnboarding) =>
      _niaUserDataSource.setShouldHideOnboarding(shouldHideOnboarding);

  @override
  Stream<bool> getShouldHideOnboardingStream() =>
      _niaUserDataSource.getShouldHideOnBoardingStream();

  @override
  Stream<List<String>> getSavedNewsResourcesStream() =>
      _niaUserDataSource.getSavedBookmarkedNewsResourcesStream();

  @override
  Future updateNewsResourceBookmark(String newsId, bool saved) =>
      _niaUserDataSource.updateNewsResourceBookmark(newsId: newsId, saved: saved);
}
