import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:news/core/database/dao/news_resource_dao.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/tables.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../common/platform_handler.dart';

const databaseFileName = "nia_data_base.db";

NiaDatabase niaDatabase = NiaDatabase();

abstract class NiaDatabaseBase with ChangeNotifier {
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

    return _topicDao ??= TopicDaoImpl(this, _onTableUpdated);
  }

  @override
  NewsResourceDao getNewsResourceDao() {
    if (niaDB == null) {
      throw "";
    }

    return _newsResourceDap ??= NewsResourceDaoImpl(this, _onTableUpdated);
  }

  Future _createTables() async {
    await niaDB!.execute('CREATE TABLE IF NOT EXISTS ${Tables.topics} ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'name TEXT, '
        'shortDescription TEXT, '
        'longDescription TEXT, '
        'url TEXT, '
        'imageUrl TEXT)');

    await niaDB!.execute('CREATE TABLE IF NOT EXISTS ${Tables.newsResource} ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'title TEXT, '
        'content TEXT, '
        'url TEXT, '
        'header_image_url TEXT, '
        'publish_date TEXT, '
        'type TEXT)');

    await niaDB!.execute(
        'CREATE TABLE IF NOT EXISTS ${Tables.newsResourceTopicCrossRef} ('
        'news_resource_id TEXT, '
        'topic_id TEXT)');
  }

  _onTableUpdated(String table) {
    notifyListeners();
  }
}

extension NiaDatabaseEx on NiaDatabase {
  Stream<T> createStream<T>(Future<T> Function() getEventData) {
    late StreamController<T> controller;

    _listener() async {
      controller.add(await getEventData());
    }

    controller = StreamController(onListen: () {
      _listener();
      addListener(_listener);
    }, onCancel: () {
      removeListener(_listener);
    });
    return controller.stream;
  }
}
