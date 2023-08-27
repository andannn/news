import 'package:flutter/material.dart';
import 'package:news/feature/setting/setting_dialog.dart';

void showSettingDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) => const SettingDialog());
