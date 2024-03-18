import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/controllers/image_upload_controller.dart';

class SingleImageWidget extends StatelessWidget {
  const SingleImageWidget({
    super.key,
    required this.index,
    required this.controller,
  });
  final int index;
  final ImageUploadController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.removeImage(
        image: controller.selectedImagesFile[index],
      ),
      onLongPress: () =>
          controller.setAsProfileImage(controller.selectedImagesFile[index]!),
      child: SizedBox(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.file(
                alignment: Alignment.center,
                File(controller.selectedImagesFile[index]!.path),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text("This image type is not supported"),
                  );
                },
              ),
            ),
            Positioned(
              right: 1,
              bottom: 1,
              child: Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  color: primaryColor1.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.cancel,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
            controller.isSelectedProfileImage(index)
                ? Positioned(
                    left: 2,
                    top: 2,
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        
                        shaderCallback: (bounds) => const RadialGradient(
                          center: Alignment.bottomCenter,
                          colors: [primaryColor1, Colors.white,],
                          stops: [0.5,1]
                        ).createShader(bounds),
                        child: const Icon(
                          Icons.star_border_purple500_rounded,
                          size: 25,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
