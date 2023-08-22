
import 'package:news/sync/worker/sync_worker.dart';

class Sync {
  static final Sync _instance = Sync._internal();

  factory Sync() => _instance;

  Sync._internal();

  void initialize() {
    syncWorker.doWork();
  }
}