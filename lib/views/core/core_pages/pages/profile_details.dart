import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/image_upload_controller.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';
import 'package:remind_me/views/common_widgets/setup_wrapper.dart';
import 'package:remind_me/views/core/profile_details/pictures/added_pictures.dart';
import 'package:remind_me/views/core/profile_details/pictures/placeholder.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageUploadController controller = Get.put(ImageUploadController());
    final Size size = MediaQuery.of(context).size;
    return SetupWrapper(
      onTap: ()=>controller.uploadImages(),
      child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Upload Photos",
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: padding,
                          ),
                          Text(
                            "Select a minimum of 2 pictures or more than 4 to make your profile stand out more.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.grey.shade500),
                          ),
                          const SizedBox(
                            height: padding,
                          ),
                         GetBuilder(
                          init: controller,
                           builder: (controller) {
                             return controller.selectedImagesFile.isNotEmpty? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Tap on the",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.apply(color: Colors.grey.shade500),
                                      children: [
                                        TextSpan(
                                            text: " + ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.apply(color: primaryColor1)),
                                        TextSpan(
                                            text: "icon to add more images",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.apply(color: Colors.grey.shade500))
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Long press on an image to set it as profile picture.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.apply(color: Colors.grey.shade500),
                                  ),
                                  Text(
                                    "Tap on a picture to delete it.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.apply(color: Colors.grey.shade500),
                                  ),
                                ],
                              ):const SizedBox.shrink();
                           }
                         ),
                        ],
                      ),
                    ),
                    GetBuilder(
                        init: controller,
                        builder: (controller) {
                          return !controller.selectedImagesFile.isNotEmpty
                              ? PlaceholderWidget(
                                  size: size,
                                  controller: controller,
                                )
                              : AddedPictures(size: size, controller: controller);
                        }),
                  ],
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GetBuilder(
                      init: controller,
                      builder: (controller) {
                        return controller.isLoading
                            ? LoadingAnimation(
                              loadingText: controller.loadingText,
                                child: LoadingAnimationWidget.beat(
                                    color: primaryColor1, size: size.width * 0.1))
                            : const SizedBox.shrink();
                      }),
                )
              ],
            ),
    );
  }
}
