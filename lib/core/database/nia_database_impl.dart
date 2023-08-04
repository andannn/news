
import 'package:news/common/platform_handler.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/dao/topic_dao_impl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'nia_database.dart';

class NiaDatabase extends NiaDatabaseBase {

  Database? niaDB;

  TopicDao? _topicDao;

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

  Future _createTables() async {
    await niaDB!.execute('CREATE TABLE IF NOT EXISTS topics ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'name TEXT, '
        'shortDescription TEXT, '
        'longDescription TEXT, '
        'url TEXT, '
        'imageUrl TEXT)'
    );
  }
}