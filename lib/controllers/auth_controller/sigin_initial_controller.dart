import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInInitialController extends GetxController {
  SignInInitialController get instance => Get.find();
  late PageController pageController;
  late Timer timer;
  int initialPage = 0;
  final List<String> titles = [
    "Meet & connect",
    "Common goals",
    "Find your spark",
  ];
  final List<String> subTitles = [
    "Link up and connect with people from all over.",
    "Get to meet people that share similar interest as you.",
    "We would us be part of your \"hapilly ever after\" story and you are just buttons away.",
  ];
  @override
  onInit() {
    pageController = PageController();
    super.onInit();
  }
  carouselChanged(int index){
  }

  gotoPage(int index) async{
    await pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),      
      curve: Curves.easeIn,
    );
    update(["carousel"]);
  }


  @override
  void dispose() {
    pageController.dispose();
  
    super.dispose();
  }

}
