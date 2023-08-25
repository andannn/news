import 'package:flutter/material.dart';
import 'package:news/feature/book_marked/presentation/book_marked_screen.dart';

class BookMarkedPage extends StatefulWidget {
  const BookMarkedPage({super.key});

  @override
  State<BookMarkedPage> createState() => _BookMarkedPageState();
}

class _BookMarkedPageState extends State<BookMarkedPage> {
  @override
  Widget build(BuildContext context) {
    return const BookMarkedScreen();
  }
}
