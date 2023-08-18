
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news/app/ui/app.dart';
import 'package:news/core/shared_preference/user_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // debugPaintSizeEnabled = true;

  /// init shared preference used in app.
  await NiaPreferencesDataSource.niaUserData.init();

  runApp(const NiaApp());
}
