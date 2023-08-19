
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news/app/ui/app.dart';
import 'package:news/core/database/nia_database.dart';
import 'package:news/core/shared_preference/user_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  debugPaintSizeEnabled = true;

  /// init shared preference used in app.
  await NiaPreferencesDataSource.niaUserData.init();

  /// init date base used in this app.
  await niaDatabase.initDatabase();

  /// run app after core instance initialized.
  runApp(const NiaApp());
}
