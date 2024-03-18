import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/json_files/interests_list.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/repositories/auth_repo.dart';
import 'package:remind_me/repositories/user_repo.dart';

class InterestController extends GetxController {
  InterestController get instance => Get.find();
  AuthRepo authRepo = Get.put(AuthRepo());
  UserRepo userRepo = Get.put(UserRepo());
  late UserModel? userData;
  late User user;
  final int minAllowed = 5;
  int maxAllowed = 15;
  RxString? searchField = "".obs;
  late List<String> interestList;
  List<String?> searchedmatches = [];
  List<String> selectedInterests = [];
  final isLoading = false.obs;
  @override
  void onInit() async{
    interestList = interests;
    maxAllowed = interestList.length;
    user = authRepo.firebaseUser!;
    userData = (await userRepo.getUserDetails(user.email!));
    userData?.interests!=null?authRepo.setInitialScreen(user):null;
    //searchedmatches = interests;
    searchInterest("");
    debounce(
      time: const Duration(milliseconds: 100),
      searchField!,
      (string) => searchInterest(
        string.trim(),
      ),
    );

    super.onInit();
  }

  isSelectedInterest(String interest) {
    return selectedInterests
        .any((element) => element.toLowerCase() == interest.toLowerCase());
  }

  addToSelected(bool selected, String interest) {
    if (selected) {
      selectedInterests = [...selectedInterests, interest];
      update();
      return;
    }
    selectedInterests.removeWhere((item) => interest == item);
    update();
  }

  searchInterest(String string) {
    final String searchedText = string;
    final HashSet<String> matchingSet = HashSet.from(interestList);
    if (string.isNotEmpty) {
      searchedmatches = matchingSet
          .where((element) => element.contains(searchedText))
          .toList();
      update();
      return;
    }
    searchedmatches = interestList;
    update();
  }

  saveSelectedInterest() async {
    if (selectedInterests.isEmpty ||
        selectedInterests.length < minAllowed ||
        selectedInterests.length > maxAllowed) {
      selectedInterests.isEmpty || selectedInterests.length < minAllowed
          ? Get.snackbar(
              backgroundColor: primaryColor1,
              overlayBlur: 0.1,
              colorText: Colors.white,
              isDismissible: true,
              instantInit: true,
              "Select More activities",
              "please, select atleast $minAllowed activities")
          : Get.snackbar(
             backgroundColor: primaryColor1,
              overlayBlur: 0.1,
              colorText: Colors.white,
              isDismissible: true,
              instantInit: true,
            "Maxed out",
              "you have exceed maximum allowed selections. must not exceed selections: $maxAllowed");
      return;
    }
    isLoading.value = true;
   await userRepo.addInterests(selectedInterests, userData!);
    authRepo.setInitialScreen(user);
   isLoading.value = false;
  }
}
