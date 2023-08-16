import 'package:flutter/material.dart';

enum TopLevelNavigation {
  forYou(
      selectedIcon: Icons.home_filled,
      unSelectedIcon: Icons.home_outlined,
      iconTextId: 'For you',
      titleTextId: 'Now in android'),
  bookMark(
      selectedIcon: Icons.bookmark,
      unSelectedIcon: Icons.bookmark_add_outlined,
      iconTextId: 'Saved',
      titleTextId: 'Saved'),
  interests(
      selectedIcon: Icons.interests_outlined,
      unSelectedIcon: Icons.interests,
      iconTextId: 'interests',
      titleTextId: 'interests');

  const TopLevelNavigation({
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.iconTextId,
    required this.titleTextId,
  });

  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final String iconTextId;
  final String titleTextId;
}

extension TopLevelNavigationEx on TopLevelNavigation {
  BottomNavigationBarItem toBottomNavigationBarItem({required bool isSelected}) {
    final icon = isSelected ? selectedIcon : unSelectedIcon;
    return BottomNavigationBarItem(
        label: iconTextId,
        icon: Icon(icon),
    );
  }
}
