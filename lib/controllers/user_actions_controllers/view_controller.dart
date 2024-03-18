import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewsController extends GetxController with GetSingleTickerProviderStateMixin{
   ViewsController get instance => Get.find();
   final activeFilterIndex = 0.obs;
   late TabController tabController;

 initTabBar(int tabBarLength){
    tabController=TabController(length: tabBarLength, vsync: this);
 }
}