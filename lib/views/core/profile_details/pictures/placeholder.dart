
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/image_upload_controller.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({
    super.key,
    required this.size, required this.controller,
  });

  final Size size;
  final ImageUploadController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade900
            : Colors.grey.shade50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.cameraRetro,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: tFormHeight,),
          Text("No image selected", style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.grey.shade500),),
         const SizedBox(height: padding,),
         SizedBox(
              width: size.width*0.6,
              height: 50,
              child: ElevatedButton(onPressed:()async=> await controller.pickMultipleImage(ImageSource.gallery), child: Text("Select images", style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.white),)),
            )
        ],
      ),
    );
  }
}



