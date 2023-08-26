import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feature/book_marked/presentation/book_marked_screen.dart';

import '../../app/local/nia_localizations.dart';
import '../../core/design_system/common_widget/nia_snackbar.dart';
import 'bloc/book_marked_bloc.dart';

class BookMarkedPage extends StatefulWidget {
  const BookMarkedPage({super.key});

  @override
  State<BookMarkedPage> createState() => _BookMarkedPageState();
}

class _BookMarkedPageState extends State<BookMarkedPage> {

  ScaffoldFeatureController<dynamic, SnackBarClosedReason>? snackBarController;

  @override
  void dispose() {
    super.dispose();

    // dismiss current snack bar if this page is disposed.
    snackBarController?.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BookMarkedScreen(
        onNewsRemoved: (String removedId) async {
          context.read<BookMarkedBloc>().add(OnBookMarkedNewsRemoved(removedId));
          snackBarController = showSnackBarMessage(context,
              label: NiaLocalizations.of(context).bookmarkRemoved,
              action: NiaLocalizations.of(context).undoLabel);

          final closedReason = await snackBarController!.closed;
          if (closedReason == SnackBarClosedReason.action) {
            context.read<BookMarkedBloc>().add(OnUndoRemoveBookMarkedNews());
          }
          snackBarController = null;
        },
      ),
    );
  }
}
