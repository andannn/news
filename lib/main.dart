
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news/app/ui/app.dart';
import 'package:news/core/database/nia_database.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:workmanager/workmanager.dart';

import 'sync/initializers/sync_initializers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // debugPaintSizeEnabled = true;
  // Workmanager().initialize();

  /// init shared preference used in app.
  await niaUserDataSource.init();

  /// init date base used in this app.
  await niaDatabase.initDatabase();

  /// post initial sync task.
  Sync().initialize();

  /// run app after core instance initialized.
  runApp(const NiaApp());
}
