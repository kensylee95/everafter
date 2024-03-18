import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/core_images/logo/logo.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/profile_controller.dart';
import 'package:remind_me/views/core/core_pages/pages/explore.dart';
import 'package:remind_me/views/core/core_pages/pages/preferences.dart';
import 'package:remind_me/views/core/single_lover/single_lover/image_widget_profile.dart';

class MatchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MatchAppbar({Key? key, required this.controller}) : super(key: key);
   final ProfileController controller; 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? primaryColor
          : darkBackgroundColor,
      elevation: 0,
      leadingWidth: size.width * 0.3,
      leading: Padding(
        padding: const EdgeInsets.only(left: padding),
        child: SvgPicture.asset(
          lightLogo1,
          allowDrawingOutsideViewBox: false,
          height: 5,
          width: size.width * 0.3,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Center(
            child: IconButton(
              onPressed: () => Get.to(() => const Explore()),
              padding: EdgeInsets.zero,
              icon: FaIcon(
                FontAwesomeIcons.searchengin,
                size: 25,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Center(
            child: IconButton(
              onPressed: () => Get.to(() => const Preferences()),
              padding: EdgeInsets.zero,
              icon: FaIcon(
                FontAwesomeIcons.globe,
                size: 25,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ),
        /*  const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: NotificationIcon(),
        ),*/
        GestureDetector(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey.shade50),
                  borderRadius: BorderRadius.circular(100)),
              child: Obx(
                () => controller.userModel.value != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ImageWidgetProfile(
                          height: size.height,
                          width: size.width,
                          boxFit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          userModel: controller.userModel.value!,
                          activePhotoIndex: controller.profileImageIndex(
                              controller.userModel.value!),
                        ),
                      )
                    : const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 10);
}
