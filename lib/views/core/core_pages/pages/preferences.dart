import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/match_controller.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/general_appBar/app_bar.dart';
import 'package:remind_me/views/core/preference_widgets/advanced_filters/advanced_filters.dart';
import 'package:remind_me/views/core/preference_widgets/age_range/age_range_widget.dart';
import 'package:remind_me/views/core/preference_widgets/distance_preference.dart/distance_preference_widget.dart';
import 'package:remind_me/views/core/preference_widgets/gender_preference.dart';
import 'package:remind_me/views/core/preference_widgets/prefer_photos.dart';
import 'package:remind_me/views/core/preference_widgets/preference_text.dart';
import 'package:remind_me/views/core/preference_widgets/premium_title/premium_title.dart';

class Preferences extends StatelessWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PreferenceController controller = Get.put(PreferenceController());
    final size = MediaQuery.of(context).size;
    const List<Icon> listOfIcons = [
      Icon(
        Icons.dangerous,
        color: Colors.white,
        size: 13,
      ),
      Icon(
        Icons.verified,
        color: Colors.white,
        size: 13,
      )
    ];
    return Scaffold(
      appBar: const GeneralAppBar(title: "Preferrence Settings"),
      body: PopScope(
        canPop: true,
        onPopInvoked:(didPop) {
          MatchController.instance.filterScreenPopAttempt(didPop, controller.userData!);
        },
        child: Obx(
          ()=> controller.isLoading.value==false? SingleChildScrollView(
            child: CustomContainer(
              width: size.width,
              //height: size.height,
              containerPadding: const EdgeInsets.only(
                left: padding,
                right: padding,
                top: tFormHeight,
              ),
              child: Column(
                children: [
                  DistancePreference(
                      size: size, controller: controller, listOfIcons: listOfIcons),
                  const SizedBox(
                    height: 2 * padding,
                  ),
                  GenderPreference(
                      size: size,
                      controller: controller,
                      onTap: () {},
                      gender: "Women"),
                  const SizedBox(
                    height: 2 * padding,
                  ),
                  AgeRangeWidget(
                      size: size, controller: controller, listOfIcons: listOfIcons),
                  const SizedBox(
                    height: padding,
                  ),
                  const PreferenceText(),
                  const SizedBox(
                    height: 2 * padding,
                  ),
                  const PremiumTitle(),
                  const SizedBox(
                    height: 2 * padding,
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.black87
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PreferPhotos(userData: controller.userData!),
                          //HasBio(size: size, controller: controller),
                          const SizedBox(
                            height: tFormHeight,
                          ),
                          AdvancedFilters(
                                  userData: controller.userData!,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: tFormHeight,
                  )
                ],
              ),
            ),
          ):LoadingAnimation(child: Center(child: LoadingAnimationWidget.bouncingBall(color: primaryColor1, size: size.width*0.1),)),
        ),
      ),
    );
  }
}
