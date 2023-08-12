import 'package:news/core/data/sync_utils.dart';
import 'package:news/core/shared_preference/user_data.dart';

class TestSynchronizer extends Synchronizer {
  TestSynchronizer(this.preference);

  final NiaPreferencesDataSource preference;

  @override
  Future<ChangeListVersions> getChangeListVersions() async {
    return preference.getChangeListVersions();
  }

  @override
  Future updateChangeListVersions(
      ChangeListVersions Function(ChangeListVersions version) update) async {
    return preference.updateChangeListVersion(update: update);
  }
}
