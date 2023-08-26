import 'package:flutter/material.dart';

ScaffoldFeatureController<dynamic, SnackBarClosedReason> showSnackBarMessage(BuildContext context,
    {String label = '', String action = ''}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(_createSnackBar(context, label, action));
}

SnackBar _createSnackBar(BuildContext context, String label, String action) {
  return SnackBar(
    content: Text(label),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.vertical,
    action:
        action.isNotEmpty ? SnackBarAction(label: action, onPressed: () {}) : null,
  );
}
