
import 'package:flutter/material.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/user_appbar/appbar_props/leading.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/user_appbar/appbar_props/notification_icon.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/user_appbar/appbar_props/title.dart';

class UserAppbar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      elevation: 0.5,
      //backgroundColor: Theme.of(context).brightness==Brightness.light? primaryColor:darkBackgroundColor,
      leading: const Leading(),
      leadingWidth: 65,
      centerTitle: true,
      title: const AppbarTitle(),
      actions: const [
        NotificationIcon(),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
