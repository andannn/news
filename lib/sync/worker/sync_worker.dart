import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/sync_utils.dart';
import 'package:news/core/shared_preference/user_data.dart';

SyncWorker syncWorker =
    SyncWorker(niaUserDataSource, topicsRepository, newsRepository);

class SyncWorker extends Synchronizer {
  SyncWorker(this.preference, this.topicsRepository, this.newsRepository);

  final NiaPreferencesDataSource preference;
  final TopicsRepository topicsRepository;
  final NewsRepository newsRepository;

  Future<void> doWork() async {
    await topicsRepository.syncWith(this);
    await newsRepository.syncWith(this);
  }

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
