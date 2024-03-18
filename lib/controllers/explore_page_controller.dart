
import 'package:get/get.dart';

class ExplorePageController extends GetxController {
   ExplorePageController get instance => Get.find();
   final activeFilterIndex = 0.obs;
   //explor page
   filterClicked(index){
    activeFilterIndex.value =index;
   }
}