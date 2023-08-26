import 'package:flutter/material.dart';
import 'package:news/feature/interests/presentation/interest_screen.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: InterestScreen());
  }
}
