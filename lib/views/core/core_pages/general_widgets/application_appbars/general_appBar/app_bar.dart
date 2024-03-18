import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar({
    super.key,
    required this.title,
    this.centerTitle,
    this.listWidgets,
  });
  final String title;
  final bool? centerTitle;
  final List<Widget>? listWidgets;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: listWidgets,
      //elevation: 1,
      backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade300
              : Colors.grey.shade800,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 25,
          color: primaryColor1,
        ),
      ),
      centerTitle: centerTitle,
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
