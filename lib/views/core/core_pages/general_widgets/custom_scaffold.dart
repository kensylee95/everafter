import 'dart:ui';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/auth_controller/signin_controller.dart';
import 'package:remind_me/controllers/bottom_bar_controller.dart';
import 'package:remind_me/controllers/profile_controller.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/match_appbar.dart/match_appbar.dart';
import 'package:remind_me/views/core/bottom_navigation/bottombar.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/views_appbar/views_appbar.dart';
import 'package:remind_me/views/core/core_pages/pages/match_finder.dart';
import 'package:remind_me/views/core/core_pages/pages/profiles_settings.dart';
import 'package:remind_me/views/core/core_pages/pages/views.dart';
import 'package:remind_me/views/core/single_lover/single_lover/image_widget_profile.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final BottomBarController controller = Get.put(BottomBarController());
    final SigninController signIncontroller = Get.put(SigninController());
    final ProfileController profileController = Get.put(ProfileController());
    // list of appbars
    //if you don't want widget to have app bar put null
    List<PreferredSizeWidget?> appBars = [
      //appbar for match finder page
      MatchAppbar(
        controller: profileController,
      ),
      //appbar explore page
      const ViewsAppbar(),
    ];

    final List<Widget> widgets = [
      const MatchFinder(),
      const Views(),
    ];
    final List<FlashyTabBarItem> bottomBarItems = [
      singleBottomItem(
        context,
        routeName: "Matches",
        icon: FontAwesomeIcons.ring,
      ),
      singleBottomItem(
        context,
        routeName: "Views",
        icon: FontAwesomeIcons.eye,
      ),
      singleBottomItem(
        context,
        routeName: "Favorite",
        icon: FontAwesomeIcons.star,
      ),
      singleBottomItem(
        context,
        routeName: "likes",
        icon: FontAwesomeIcons.heart,
      ),
      singleBottomItem(
        context,
        routeName: "Message",
        icon: FontAwesomeIcons.message,
      ),
    ];
    return GetBuilder(
        id: "pageChanged",
        init: controller,
        builder: (controller) {
          return Scaffold(
            drawer: Drawer(
              width: size.width * 0.8,
              backgroundColor: Colors.grey.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ImageFiltered(
                          imageFilter:
                              ImageFilter.blur(sigmaY: 1, sigmaX: 1),
                          child: Obx(
                            () => profileController.userModel.value != null
                                ? ImageWidgetProfile(
                                    height: size.height*0.5,
                                    width: size.width,
                                    boxFit: BoxFit.fitWidth,
                                    alignment: Alignment.topCenter,
                                    userModel:
                                        profileController.userModel.value!,
                                    activePhotoIndex: profileController
                                        .profileImageIndex(profileController
                                            .userModel.value!),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ChildTile(
                          text: "Notifications",
                          icon: FontAwesomeIcons.bell,
                          onTap: () {},
                          iconColor: Colors.grey.shade600,
                        ),
                       
                        ChildTile(
                          text: "Profile Settings",
                          icon: FontAwesomeIcons.userGear,
                          onTap: ()=>Get.to(()=>const ProfilesSettings()),
                          iconColor: Colors.grey.shade600,
                        ),
                      ChildTile(
                          text: "Sign Out",
                          icon: FontAwesomeIcons.powerOff,
                          onTap: () async {
                            await signIncontroller.signOut();
                          },
                          iconColor: Colors.red,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Text("Terms & Condition",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.apply(
                                      color: Colors.grey.shade600,
                                    ))),
                        GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Privacy Policy",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.apply(color: Colors.grey.shade600),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            //show appbar according to current active widget
            appBar: (appBars.length - 1) < controller.currentIndex
                ? null
                : appBars[controller.currentIndex],
            body: IndexedStack(
              index: controller.currentIndex,
              children: widgets,
            ),
            bottomNavigationBar: BottomBar(
              bottomBarItems: bottomBarItems,
              controller: controller,
            ),
          );
        });
  }

  FlashyTabBarItem singleBottomItem(BuildContext context,
      {required IconData icon, required String routeName}) {
    return FlashyTabBarItem(
        activeColor: Theme.of(context).brightness == Brightness.light
            ? primaryColor1
            : Colors.white,
        inactiveColor: Colors.grey.shade500,
        icon: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade50
                : Colors.black,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 2,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade300
                  : Colors.grey.shade600,
            ),
          ),
          child: Center(
            child: FaIcon(
              icon,
              color: Theme.of(context).brightness == Brightness.light
                  ? primaryColor1
                  : Colors.grey.shade400,
              size: 18,
            ),
          ),
        ),
        title: Text(
          routeName,
          style: Theme.of(context).textTheme.labelMedium?.apply(
              color: Theme.of(context).brightness == Brightness.light
                  ? primaryColor1
                  : Colors.white),
        ));
  }
}

class ChildTile extends StatelessWidget {
  const ChildTile({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    this.iconColor,
  });
  final VoidCallback onTap;
  final String text;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: iconColor ?? Colors.grey.shade600,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onTap: onTap,
      trailing: Icon(
        FontAwesomeIcons.angleRight,
        size: 25,
        color: Colors.grey.shade400,
      ),
    );
  }
}
