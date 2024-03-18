import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/core_images/match_images/tag_images.dart';
import 'package:remind_me/controllers/match_controller.dart';
import 'package:remind_me/views/core/single_lover/single_lover/single_lover.dart';
import 'package:remind_me/views/core/single_lover/tags/tag_widget.dart';

class SwipableLovers extends StatelessWidget {
  const SwipableLovers({
    super.key,
    required this.controller,
  });

  final MatchController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: SizedBox(
        width: size.width,
        height: size.height * 0.65,
        child: GetBuilder(
            id: "swiped",
            init: controller,
            builder: (controller) {
              return 
              AppinioSwiper(invertAngleOnBottomDrag: false,
                cardCount: controller.matchedUsers.length,
                backgroundCardScale: 0.9,
                backgroundCardCount: 2,
                swipeOptions: const SwipeOptions.only(left: true, right: true, up:true, down: false),
                controller: controller.swiperController,
                onCardPositionChanged: (SwiperPosition position) {
                  controller.itemPositionChanged(
                    position,
                    swipeButtonSize:size.width * 0.15
                  );
                },
                duration: const Duration(milliseconds: 100),
                allowUnSwipe: false,
               backgroundCardOffset: Offset((size.width * 0), size.height * 0),
               // maxAngle: 15,
                threshold: size.width * 0.2,
                loop: true,
                onEnd: ()=>controller.isOutOfSwipesCard,
                onSwipeBegin: (int dismissedIndex, int activeIndex,
                    SwiperActivity activity) {
                  controller.onSwipeBegin(
                      dismissedIndex, activeIndex, activity);
                },
                onSwipeEnd: (int dismissedIndex, int activeIndex,
                    SwiperActivity activity) {
                  controller.onSwipeEnd(dismissedIndex, activeIndex, activity);
                },
                cardBuilder: (BuildContext context, int index) {
                  //<--- Card builder loop --->
                  return SingleLover(
                    swipeDirection:controller.swipingDirection == "right"?"right":"left",
                    controller: controller,
                    userModel: controller.matchedUsers[index]!,
                    tag: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: controller.tagOpacity,
                        child: controller.isSwiping == true &&
                                index == controller.indexActive &&
                                controller.swipingDirection == "right"
                            ? LikeTagWidget(size: size)
                            : controller.isSwiping == true &&
                                    index == controller.indexActive &&
                                    controller.swipingDirection == "left"
                                ? DislikeTagWidget(size: size)
                                : const SizedBox.shrink()),
                  );
                  //<--- Card loop end --->
                },
              );
            }),
      ),
    );
  }
}

class DislikeTagWidget extends StatelessWidget {
  const DislikeTagWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TagWidget(
      color: Colors.red,
      angle: -12,
      child: Image(
        image: const AssetImage(dislikeImage),
        height: size.width * 0.5,
      ),
    );
  }
}

class LikeTagWidget extends StatelessWidget {
  const LikeTagWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TagWidget(
      color: Colors.green,
      angle: 12,
      child: Image(
        image: const AssetImage(likeImage),
        height: size.width * 0.5,
      ),
    );
  }
}
