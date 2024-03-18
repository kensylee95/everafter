import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/interests_controller.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';
import 'package:remind_me/views/common_widgets/setup_wrapper.dart';

class NewInterests extends StatelessWidget {
  const NewInterests({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final InterestController controller = Get.put(InterestController());

    final Size size = MediaQuery.of(context).size;
    return SetupWrapper(
      onTap: () => controller.saveSelectedInterest(),
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "What interests you ?",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: padding,
                ),
                Text(
                  "Select atleast ${controller.minAllowed} activities you Enjoy doing or find fascinating.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(color: Colors.grey.shade500),
                ),
                const SizedBox(
                  height: tFormHeight,
                ),
                TextFormField(
                  onChanged: (searchData) =>
                      controller.searchField!.value = searchData,
                  cursorColor: primaryColor1,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: primaryColor1,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Search interests ....",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.apply(color: Colors.grey.shade500)),
                ),
                const SizedBox(
                  height: tFormHeight,
                ),
                GetBuilder(
                    init: controller,
                    builder: (controller) {
                      return controller.searchedmatches.isNotEmpty
                          ? Wrap(
                              spacing: padding,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              alignment: WrapAlignment.start,
                              children: controller.searchedmatches
                                  .map(
                                    (interest) => FilterChip(
                                      elevation: 10,
                                      selected: controller
                                          .isSelectedInterest(interest!),
                                      selectedColor: primaryColor1,
                                      showCheckmark: true,
                                      side: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 2,
                                      ),
                                      label: Text(
                                        interest.capitalize!,
                                        style: controller
                                                .isSelectedInterest(interest)
                                            ? Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.apply(color: Colors.white)
                                            : Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                      ),
                                      checkmarkColor: Colors.white,
                                      onSelected: (selected) => controller
                                          .addToSelected(selected, interest),
                                    ),
                                  )
                                  .toList(),
                            )
                          : SizedBox(
                              height: size.height * 0.2,
                              width: size.width,
                              child: Center(
                                  child: Text(
                                      "Oops! We have nothing of such.\nThank you for letting us know.",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.apply(color: Colors.grey.shade500))));
                    }),
              ],
            ),
              SizedBox(
                height: size.height,
                child: Positioned(
                child: Obx(
                  () => controller.isLoading.value?LoadingAnimation(
                    child: LoadingAnimationWidget.staggeredDotsWave (
                        color: primaryColor1, size: size.width * 0.1),
                  ):const SizedBox.shrink(),
                ),
                            ),
              ),
          ],
        ),
      ),
    );
  }
}
