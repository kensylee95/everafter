import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/models/user_model.dart';

class ImageWidgetProfile extends StatelessWidget {
  const ImageWidgetProfile({
    super.key,
    required this.userModel,
    required this.activePhotoIndex,
    this.height,
    this.width,
    this.alignment,
    this.boxFit,
  });
  final UserModel userModel;
  final int activePhotoIndex;
  final double? height;
  final double? width;
  final Alignment? alignment;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      filterQuality: FilterQuality.high,
      fit: boxFit??BoxFit.fitWidth,
      
      height: height??size.height * 0.65,
      width: width??size.width,
      alignment: alignment??Alignment.topCenter,
      imageUrl: userModel.photos![activePhotoIndex].link,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            color: primaryColor1,
            value: downloadProgress.progress,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
