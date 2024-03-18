
import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.controller,
    required this.tabs, required this.onTap,
  });

  final TabController controller;
  final List<Tab> tabs;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: primaryColor1,
      dividerColor: Colors.grey.shade300,
      onTap: onTap,
      controller: controller,
      tabs: tabs,
    );
  }
}