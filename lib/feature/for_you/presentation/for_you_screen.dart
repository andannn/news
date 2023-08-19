import 'package:flutter/material.dart';
import 'package:news/feature/for_you/presentation/on_boarding.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: OnBoarding())
      ],
    );
  }
}
