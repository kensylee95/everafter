import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';
import 'package:remind_me/views/common_widgets/setup_wrapper.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/sliders/range_slider_widget.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/toggle_switch.dart';

class ShowMe extends StatelessWidget {
  const ShowMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PreferenceController controller = Get.put(PreferenceController());
    
    print(controller.ageRange.value.end);
    Color textColor = Theme.of(context).brightness == Brightness.light
        ? Colors.grey.shade900
        : Colors.grey.shade300;
    return SetupWrapper(
      onTap: () => controller.updateUser(),
      child: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Preferred people",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: padding,
                ),
                Text(
                  "Select the gender & age of people you are interested in.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(color: Colors.grey.shade500),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "interested in:",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.apply(color: textColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  ()=> Align(
                    alignment: Alignment.centerLeft,
                    child: ToggleSwitchButton(
                      size: size,
                      initialIndex: controller.selectedGenderInterestedIn.value,
                      onTap: (index) => controller.selectedGenderInterest(index),
                      totalSwitch: 3,
                      listOflabels: controller.genderInterestedIn,
                      //listOfIcons: [ Icon(Icons.female, size: 11,),Icon(Icons.male), Icon(Icons.face)]
                    ),
                  ),
                ),
                const SizedBox(
                  height: tFormHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Age range:",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.apply(color: textColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            controller.ageRange.value.start
                                .toString()
                                .split(".")[0],
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.apply(color: textColor),
                          ),
                        ),
                        Text(
                          " - ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.apply(color: textColor),
                        ),
                        Obx(
                          ()=> Text(
                            controller.ageRange.value.end
                                .toString()
                                .split(".")[0],
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.apply(color: textColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Show me people in this age range",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(color: Colors.grey.shade500),
                  ),
                ),
                const SizedBox(
                  height: padding,
                ),
                  Obx(
                    ()=> RangeSliderWidget(
                          onChange: (onChange) =>
                              controller.selectedAgeRange(onChange),
                          ageRange: controller.ageRange.value,
                          max: 100.0,
                          min: 18.0,
                          intervalValue: 1.0,
                        ),
                  ),
              ],
            ),
            Obx(() => controller.isLoading.value
                ? Positioned(
                    child: LoadingAnimation(
                        child: LoadingAnimationWidget.inkDrop(
                            color: primaryColor1, size: size.width * 0.1)))
                : const SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
