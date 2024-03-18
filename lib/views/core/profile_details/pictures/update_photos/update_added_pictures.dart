import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/image_upload_controller.dart';
import 'package:remind_me/views/core/single_lover/single_lover/image_widget_profile.dart';

class UpdateAddedPictures extends StatelessWidget {
  const UpdateAddedPictures({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final ImageUploadController controller;

  @override
  Widget build(BuildContext context) {
    //final List<XFile?> list = controller.profilePhotos;
    return Obx(
      () => controller.userModel.value?.photos != null
          ? AnimatedContainer(
              curve: Curves.easeInCirc,
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                  horizontal: padding, vertical: padding),
              height: size.height * 0.6,
              width: double.infinity,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1.2,
                crossAxisCount: 3,
                children: List.generate(
                  controller.allowedUpload,
                  (index) => InkWell(
                    onTap: controller.profilePhotos
                                .asMap()
                                .containsKey(index) ||
                            index != controller.profilePhotos.length
                        ? null
                        //select and upload images
                        : () =>
                            controller.updateProfileImages(controller.userModel.value!),
                    child: Obx(
                      () => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInSine,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey.shade100
                                  : darkBackgroundColor,
                          border: Border.all(
                            color: !controller.profilePhotos
                                        .asMap()
                                        .containsKey(index) &&
                                    Theme.of(context).brightness ==
                                        Brightness.light
                                ? Colors.grey.shade50
                                : !controller.profilePhotos
                                            .asMap()
                                            .containsKey(index) &&
                                        Theme.of(context).brightness !=
                                            Brightness.light
                                    ? darkBackgroundColor
                                    : controller.profilePhotos[index]!.isProfile
                                        ? Colors.blue
                                        : primaryColor1,
                            width: 4,
                          ),
                        ),
                        child: controller.profilePhotos
                                .asMap()
                                .containsKey(index)
                            ? GestureDetector(
                                //if user photo length is equal to 1 do not delete it
                                onTap: controller.profilePhotos.length == 1
                                    ? () => {
                                          //show user a ui mot allowed snackbar
                                          Get.snackbar(
                                            "Not Supported!",
                                            "Atleast one image must be present",
                                          ),
                                          //make the picture the profile picture
                                          controller.updateDbUserProfile(
                                              image: controller
                                                  .profilePhotos[index]!,
                                              userData:
                                                  controller.userModel.value!),
                                        }
                                    //else delete it
                                    : () => controller.removeImageFromDB(
                                        image: controller.profilePhotos[index]!,
                                        userData: controller.userModel.value!),
                                onLongPress: () =>
                                    controller.updateDbUserProfile(
                                  image: controller.profilePhotos[index]!,
                                  userData: controller.userModel.value!,
                                ),
                                child: ClipRRect(
                                  key: UniqueKey(),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: ImageWidgetProfile(
                                    height: size.height,
                                    width: size.width,
                                    boxFit: BoxFit.cover,
                                    alignment: Alignment.center,
                                    userModel: controller.userModel.value!,
                                    activePhotoIndex: index,
                                  ),
                                ),
                              )
                            : Icon(
                                Icons.add,
                                size: 40,
                                color: index == controller.profilePhotos.length
                                    ? primaryColor1
                                    : Colors.grey.shade300,
                              ),
                      ),
                    ),
                  ),
                ),
              ))
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
