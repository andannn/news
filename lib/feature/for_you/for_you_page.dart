import 'package:flutter/material.dart';
import 'package:news/feature/for_you/presentation/for_you_screen.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {

  @override
  Widget build(BuildContext context) {
    return const ForYouScreen();
  }
}
