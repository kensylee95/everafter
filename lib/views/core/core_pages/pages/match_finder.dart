import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/match_controller.dart';
import 'package:remind_me/views/common_widgets/custom_button.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';
import 'package:remind_me/views/core/core_pages/match_widgets/swipe_button.dart';
import 'package:remind_me/views/core/single_lover/single_lover/swipable_lovers.dart';

class MatchFinder extends StatelessWidget {
  const MatchFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MatchController controller = Get.put(MatchController());
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomContainer(
        //containerPadding: const EdgeInsets.symmetric(vertical: ),
        //padding: const EdgeInsets.symmetric(horizontal: padding),
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            GetBuilder(
              id: "is-loading",
              init: controller,
              builder: (controller) {
                return controller.isLoading == false &&
                        controller.matchedUsers.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SwipableLovers(
                            controller: controller,
                          ),
                          TheThreeSwipeButtons(
                            controller: controller,
                          )
                        ],
                      )
                    : controller.isLoading == false &&
                            controller.matchedUsers.isEmpty
                        ? Center(
                            child: LoadingAnimation(
                              loadingText: "Finding Matches...",
                              child: LoadingAnimationWidget.twoRotatingArc(
                                  color: primaryColor1,
                                  size: size.width * 0.1),
                            ),
                          )
                        : NoUsersFoundWidget(size: size);
              },
            ),
            PositionedLoadingWidget(controller: controller, size: size)
          ],
        ),
      ),
    );
  }
}

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          color: const Color.fromRGBO(238, 238, 238, 1),
          padding: const EdgeInsets.all(padding),
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const Icon(
              Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
              size: 60,
              color: primaryColor1,
            ),
            const SizedBox(
              height: padding,
            ),
            Text(
              "No Internet Connection",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: padding,
            ),
            Text(
              "Please, ensure internet is enabled on your device and you have an active internet subscription.",
              style: Theme.of(context).textTheme.bodySmall?.apply(color: Colors.grey.shade500),
              textAlign: TextAlign.center, softWrap: true,
            ),
              const SizedBox(
              height: padding,
            ),
          ]),
        ),
      ),
    );
  }
}

class NoUsersFoundWidget extends StatelessWidget {
  const NoUsersFoundWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: size.width * 0.9,
          //padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade200
                  : Colors.black,
              borderRadius: BorderRadius.circular(30)),
          height: size.height * 0.4,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.solidFaceSadCry,
                  size: 80,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                const SizedBox(
                  height: padding,
                ),
                Text(
                  "Ay!, matches exhausted",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Adjust filter to include more people in your match filter.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.apply(color: Colors.grey.shade500),
                ),
                const SizedBox(
                  height: padding,
                ),
                CustomButton(
                    width: size.width * 0.6,
                    height: 50,
                    onTap: () {},
                    icon: FontAwesomeIcons.globe,
                    text: "Adjust Filter")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//<------------------------------------- Extracted widgets -------------------------------->
class PositionedLoadingWidget extends StatelessWidget {
  const PositionedLoadingWidget({
    super.key,
    required this.controller,
    required this.size,
  });

  final MatchController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: GetBuilder(
            id: "is-loading",
            init: controller,
            builder: (controller) {
              return controller.isLoading
                  ? LoadingAnimation(
                      loadingText: "Getting resources...",
                      child: LoadingAnimationWidget.beat(
                          color: primaryColor1, size: size.width * 0.1),
                    )
                  : const SizedBox.shrink();
            }));
  }
}

class TheThreeSwipeButtons extends StatelessWidget {
  const TheThreeSwipeButtons({
    super.key,
    required this.controller,
  });
  final MatchController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetBuilder(
            init: controller,
            id: "swiped",
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform.scale(
                    scale: controller.swipingDirection == "left"
                        ? controller.dragAlignment.value
                        : 1,
                    child: SwipeButton(
                      blur: controller.swipingDirection == "left"
                          ? controller.dragAlignment.value + 10
                          : null,
                      text: "Pass",
                      icon: FontAwesomeIcons.xmark,
                      iconColor: Colors.red,
                      onTap: () async => await controller.swipedLeft(),
                      bgColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade100
                          : Colors.red.withOpacity(0.1),
                    ),
                  ),
                  Transform.scale(
                    scale: controller.swipingDirection == "up"
                        ? controller.dragAlignment.value
                        : 1,
                    child: SwipeButton(
                      blur: controller.swipingDirection == "up"
                          ? controller.dragAlignment.value + 10
                          : null,
                      text: "Super like",
                      icon: FontAwesomeIcons.star,
                      iconColor: Colors.blue,
                      onTap: () async => await controller.swipedUp(),
                      bgColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade100
                          : Colors.blue.withOpacity(0.1),
                    ),
                  ),
                  Transform.scale(
                    alignment: Alignment.center,
                    scale: controller.swipingDirection == "right"
                        ? controller.dragAlignment.value
                        : 1,
                    child: SwipeButton(
                      blur: controller.swipingDirection == "right"
                          ? controller.dragAlignment.value + 10
                          : null,
                      text: "Like",
                      icon: FontAwesomeIcons.heart,
                      iconColor: Colors.green,
                      onTap: () async => await controller.swipedRight(),
                      bgColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade100
                          : Colors.green.withOpacity(0.1),
                    ),
                  ),
                ],
              );
            })
      ],
    );
  }
}
