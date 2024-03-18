import 'package:get/get.dart';

class BottomBarController extends GetxController {
  BottomBarController get instance => Get.find();
  final int maxCount = 5;
  int currentIndex= 0;

  void nextPage(int index) {
    currentIndex = index;
    update(["pageChanged"]);
  }


}
