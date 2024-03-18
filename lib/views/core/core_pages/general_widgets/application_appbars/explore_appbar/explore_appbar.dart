import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';

class ExploreAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ExploreAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? primaryColor
          : darkBackgroundColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left:padding),
        child: Align( alignment:Alignment.centerLeft, child: Center(
            child: IconButton(
              onPressed: () =>Get.back(),
              padding: EdgeInsets.zero,
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 30,
                color: Colors.grey.shade500,
              ),
            ),
          ),),
      ),
      centerTitle: true,
      title:  Text("Explore", style: Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center,),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 10);
}
