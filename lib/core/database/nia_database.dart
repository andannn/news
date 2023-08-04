
import 'package:news/core/database/dao/topic_dao.dart';

const databaseFileName = "nia_data_base.db";

abstract class NiaDatabaseBase {
  TopicDao getTopicDao();
}