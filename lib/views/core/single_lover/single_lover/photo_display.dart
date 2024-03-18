import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/profile_controller.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/general_appBar/app_bar.dart';
import 'package:remind_me/views/core/single_lover/single_lover/image_widget_profile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PhotoDisplay extends StatelessWidget {
  const PhotoDisplay(
      {Key? key, required this.controller, required this.userModel})
      : super(key: key);
  final UserModel userModel;
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GeneralAppBar(
        title:
            "${userModel.firstName.capitalizeFirst} Profile images",
        centerTitle: true,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: PageView.builder(
                pageSnapping: true,
                itemCount: userModel.photos!.length,
                controller: controller.pageController,
                onPageChanged: (index) =>
                controller.activePhotoIndex.value = index,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ImageWidgetProfile(
                    height: size.height,
                    width: size.width,
                    boxFit: BoxFit.cover,
                    alignment: Alignment.center,
                    userModel: userModel,
                    activePhotoIndex: index,
                  );
                },
              ),
            ),
            Positioned(
              left: padding,
              top: padding,
              child: Obx(
                () => AnimatedSmoothIndicator(
                  count: userModel.photos!.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: primaryColor1,
                    dotColor: Colors.black.withOpacity(0.4),
                  ),
                  activeIndex: controller.activePhotoIndex.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
