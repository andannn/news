
import 'package:news/core/database/dao/news_resource_dao.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/tables.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../common/platform_handler.dart';

const databaseFileName = "nia_data_base.db";

abstract class NiaDatabaseBase {
  TopicDao getTopicDao();
  NewsResourceDao getNewsResourceDao();
}

class NiaDatabase extends NiaDatabaseBase {

  Database? niaDB;

  TopicDao? _topicDao;
  NewsResourceDao? _newsResourceDap;

  Future<void> initDatabase({String? dbName, bool isTest = false}) async {
    if (isTest) {
      niaDB = await initDeleteDb('../../../test/database/$dbName');
    } else {
      final path = join(await getDatabasesPath(), dbName ?? databaseFileName);
      niaDB = await openDatabase(path);
    }

    await _createTables();
  }

  @override
  TopicDao getTopicDao() {
    if (niaDB == null) {
      throw "";
    }

    return _topicDao ??= TopicDaoImpl(niaDB!);
  }

  @override
  NewsResourceDao getNewsResourceDao() {
    if (niaDB == null) {
      throw "";
    }

    return _newsResourceDap ??= NewsResourceDaoImpl(niaDB!);
  }

  Future _createTables() async {
    await niaDB!.execute('CREATE TABLE IF NOT EXISTS ${Tables.topicsDaoName} ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'name TEXT, '
        'shortDescription TEXT, '
        'longDescription TEXT, '
        'url TEXT, '
        'imageUrl TEXT)'
    );

    await niaDB!.execute('CREATE TABLE IF NOT EXISTS ${Tables.newsResourceDaoName} ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'title TEXT, '
        'content TEXT, '
        'url TEXT, '
        'header_image_url TEXT, '
        'publish_date TEXT, '
        'type TEXT)'
    );
  }
}