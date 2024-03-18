
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:remind_me/controllers/bottom_bar_controller.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.bottomBarItems,
    required this.controller,
  });

  final List<FlashyTabBarItem> bottomBarItems;
  final BottomBarController controller;

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      animationDuration: const Duration(milliseconds: 300),
      items: bottomBarItems,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      height: 55,
      onItemSelected: (index) => controller.nextPage(index),
      animationCurve: Curves.easeInOutCubicEmphasized,
      selectedIndex: controller.currentIndex,
      iconSize: 30,
      showElevation: true,
    );
  }
}
