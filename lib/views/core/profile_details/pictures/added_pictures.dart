import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/image_upload_controller.dart';
import 'package:remind_me/views/core/profile_details/pictures/single_image_widget.dart';

class AddedPictures extends StatelessWidget {
  const AddedPictures({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final ImageUploadController controller;

  @override
  Widget build(BuildContext context) {
    //final List<XFile?> list = controller.selectedImagesFile;
    return AnimatedContainer(
        curve: Curves.easeInCirc,
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
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
              onTap: controller.selectedImagesFile.asMap().containsKey(index) ||
                      index != controller.selectedImagesFile.length
                  ? null
                  : () => controller.pickMultipleImage(ImageSource.gallery),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInSine,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).brightness==Brightness.light? Colors.grey.shade100:darkBackgroundColor,
                    border: Border.all(
                        color: !controller.selectedImagesFile
                                .asMap()
                                .containsKey(index)&& Theme.of(context).brightness==Brightness.light
                            ? Colors.grey.shade50:
                            !controller.selectedImagesFile
                                .asMap()
                                .containsKey(index)&& Theme.of(context).brightness!=Brightness.light?
                                darkBackgroundColor
                            : controller.isSelectedProfileImage(index)
                                ? Colors.blue
                                : primaryColor1,
                        width: 2)),
                child: controller.selectedImagesFile.asMap().containsKey(index)
                    ? ClipRRect(
                        key: UniqueKey(),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: SingleImageWidget(
                          index: index,
                          controller: controller,
                        ),
                      )
                    : Icon(
                        Icons.add,
                        size: 40,
                        color: index == controller.selectedImagesFile.length
                            ? primaryColor1
                            : Colors.grey.shade300,
                      ),
              ),
            ),
          ),
        ));
  }
}
