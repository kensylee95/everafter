import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';

class ViewsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ViewsAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? primaryColor
          : darkBackgroundColor,
      elevation: 0,
      /*leading: Padding(
        padding: const EdgeInsets.only(left:padding),
        child: Align( alignment:Alignment.centerLeft, child: Center(
            child: IconButton(
              onPressed: () => Get.back(),
              padding: EdgeInsets.zero,
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 30,
                color: Colors.grey.shade500,
              ),
            ),
          ),),
      ),*/
      centerTitle: true,
      title:  Text("Profile Views", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 10);
}
