import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TagController get instance => Get.find();
  late AnimationController animationController;
  final Duration duration = const Duration(milliseconds: 1000);
  late Animation tagAnimation;
  @override
  void onInit() {
    animationController = AnimationController(vsync: this, duration: duration);
    animationController.repeat(reverse: true);
    tagAnimation = Tween(begin: 0.0, end: 15.0).animate(animationController)
      ..addListener(() {
        updateWidget();
      });
    super.onInit();
  }

  updateWidget() {
    update(["tags"]);
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
