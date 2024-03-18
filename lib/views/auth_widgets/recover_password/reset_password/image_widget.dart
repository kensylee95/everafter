
import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/auth_images/images.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/constants/texts/auth.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(
            registerTopImage,
          ),
          color: Colors.black.withAlpha(180),
          colorBlendMode: BlendMode.darken,
          width: size.width,
          height: size.height * 0.46,
          isAntiAlias: true,
          filterQuality: FilterQuality.low,
          repeat: ImageRepeat.noRepeat,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          top: size.height*0.28,
          left: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(resetWelcome1, style: Theme.of(context).textTheme.displaySmall?.apply(color: primaryColor1),),
              Text(resetWelcome2, style: Theme.of(context).textTheme.displayMedium?.apply(color: Colors.white),),
            ],
          ),
        )
      ],
    );
  }
}