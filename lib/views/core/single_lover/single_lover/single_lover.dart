import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/match_controller.dart';
import 'package:remind_me/controllers/matching/filter_controller.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/views/core/single_lover/single_lover/image_widget_profile.dart';
import 'package:remind_me/views/core/single_lover/single_lover/profile_page.dart';
import 'package:remind_me/views/core/single_lover/tags/total_picture_tags.dart';

class SingleLover extends StatelessWidget {
  const SingleLover({
    super.key,
    required this.userModel,
    required this.tag,
    required this.controller,
    required this.swipeDirection,
  });

  final UserModel userModel;
  final Widget tag;
  final MatchController controller;
  final String swipeDirection;

  @override
  Widget build(BuildContext context) {
    final FilterController filterController =
        Get.put(FilterController(userDataModel: userModel));
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: GestureDetector(
              onTapUp: (tapDetails) {
                controller.gotoNextPhoto(tapDetails, userModel.photos!);
              },
              child: Stack(
                children: [
                  Container(
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 0.35]),
                    ),
                    child: GetBuilder(
                        id: "active-index-changed",
                        /*initState: (state)async{
                               await controller.preloadUserImages(userModel.photos!, context);
                            },*/
                        init: controller,
                        builder: (context) {
                          return ImageWidgetProfile(
                            userModel: userModel,
                            activePhotoIndex: controller.activePhotoIndex,
                          );
                        }),
                  ),
                  Positioned(
                    left: padding,
                    right: padding,
                    bottom: 5,
                    child: GestureDetector(
                      onTap: () => Get.to(() => ProfilePage(
                            userModel: userModel,
                          )),
                      child: SizedBox(
                        // color: Colors.red,
                        height: size.height * 0.15,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${userModel.firstName.capitalizeFirst}, ${userModel.age}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.apply(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.verified,
                                  size: 25,
                                  color: Colors.lightBlueAccent,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.run_circle_outlined,
                                  size: 20,
                                  color: Colors.tealAccent.shade100,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${filterController.findDistanceFromUser(userModel.id!)}, Metres away",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.apply(color: Colors.yellow.shade100),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                userModel.bio ??
                                    "I like to have fun and relax when i have time, although, i dont really have time.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.apply(color: Colors.grey.shade100),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //<--- Positioned ontop the image to help loggedInUser know how many images a user has --->
          Positioned(
            top: padding,
            child: GetBuilder(
                init: controller,
                id: "active-index-changed",
                builder: (controller) {
                  return TotalPictureTags(
                      photos: userModel.photos!,
                      activePhotoIndex: controller.activePhotoIndex);
                }),
          ),
          //<--- Image to show ontop of image when user swipes right to like or left to dislike --->
          Positioned(
            top: size.height * 0.05,
            left: swipeDirection == "left" ? size.width * 0.5 : null,
            right: swipeDirection == "right" ? size.width * 0.5 : null,
            child: tag,
          ),
        ],
      ),
    );
  }
}
