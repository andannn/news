import 'package:flutter/cupertino.dart';

import '../network/model/network_change_list.dart';

final class ChangeListVersions {
  ChangeListVersions({this.topicVersion = -1, this.newsResourceVersion = -1});

  final int topicVersion;
  final int newsResourceVersion;
}

abstract class Synchronizer {
  Future<ChangeListVersions> getChangeListVersions();

  Future updateChangeListVersions(
      ChangeListVersions Function(ChangeListVersions version) update);

  Future sync(Syncable syncable) => syncable.syncWith(this);
}

abstract class Syncable {
  Future<bool> syncWith(Synchronizer synchronizer);
}

extension SynchronizerEx on Synchronizer {
  Future<bool> changeListSync({
    required int Function(ChangeListVersions currentChangeListVersion) versionReader,
    required Future<List<NetworkChangeList>> Function(int version) changeListFetcher,
    required ChangeListVersions Function(ChangeListVersions lastVersion, int newVersion) versionUpdater,
    required Function(List<String> ids) modelDeleter,
    required Function(List<String> ids) modelUpdater,
  }) async {
    return Future.delayed(Duration.zero).then((_) async {
      final currentVersion = versionReader(await getChangeListVersions());
      final changeList = await changeListFetcher(currentVersion);

      final deleted = changeList.where((element) => element.isDelete);
      final updated = changeList.where((element) => !element.isDelete);

      await modelDeleter(deleted.map((e) => e.id).toList());
      await modelUpdater(updated.map((e) => e.id).toList());

      final latestVersion = changeList.last.changeListVersion;
      await updateChangeListVersions(
          (version) => versionUpdater(version, latestVersion));
      return true;
    }).catchError((error) {
      debugPrint(error);
      return false;
    });
  }
}
