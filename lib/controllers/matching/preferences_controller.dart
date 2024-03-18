import 'package:awesome_select/awesome_select.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/json_files/gender_interest.dart';
import 'package:remind_me/models/gender.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/repositories/auth_repo.dart';
import 'package:remind_me/repositories/user_repo.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PreferenceController extends GetxController {
  static PreferenceController get instance => Get.find();
  final AuthRepo authRepo = Get.put(AuthRepo());
  final UserRepo userRepo = Get.put(UserRepo());
  late final User user;
  late final UserModel? userData;
  final RxInt initialDistanceIndex = 0.obs;
  final RxInt initialAgeRangeIndex = 0.obs;
  final Rx<SfRangeValues> ageRange = Rx<SfRangeValues>(const SfRangeValues(18, 100));
  final RxBool onlyAgeRange = false.obs;
  final String distanceUnit = "Mi";
  final List<String> genderInterestedIn = genderInterest;
  final RxInt selectedGenderInterestedIn = 0.obs;
  final DateTime maxDobAllowed = DateTime.now().subtract(const Duration(days: 365 * 18));
  late final DateRangePickerController dateRangePickerController;
  final List<Gender> supportedGenderList = [];
  late final S2SingleSelected selectedGender;
  late final List<S2Choice> genderData;
  final RxInt distanceFilter = 1.obs; // Define distanceFilter here
  final isLoading = false.obs;
  bool hasBio = false;
  DateTime? dateOfBirth;
  int hasBioInitialIndex=0;

  @override
  void onInit() {
    super.onInit();
    dateRangePickerController = DateRangePickerController();
    loadGenderData();
    fetchData();
  }

  void fetchData() async {
    isLoading.value = true;
    user = authRepo.firebaseUser!;
    userData = await userRepo.getUserDetails(user.email!);
    updateInitialValues();
    isLoading.value = false;
  }

  void updateInitialValues() {
    initialDistanceIndex.value = userData!.onlyUsesFromDistance ? 1 : 0;
    selectedGenderInterestedIn.value = userData?.genderInterestIndex ?? 0;
    if (userData?.minAge != null || userData?.maxAge != null) {
      ageRange.value = SfRangeValues(userData!.minAge, userData!.maxAge);
    }
    initialAgeRangeIndex.value = userData!.onlyUsersFromAgeRange ? 1 : 0;
    debounce(distanceFilter, (_) => updateUser(), time: const Duration(seconds: 1));
    debounce(ageRange, (_) => updateUser(), time: const Duration(seconds: 1));
  }

void loadGenderData() {
  supportedGenderList.addAll(genderInterest.asMap().entries.map((entry) => Gender(id: entry.key, name: entry.value)));
  genderData.addAll(supportedGenderList.map((gender) => S2Choice(value: gender.id, title: gender.name)));
  selectedGender = S2SingleSelected(value: genderData[0].title, choice: genderData[0]);
}


  void onDobChanged(DateRangePickerSelectionChangedArgs dateTime) {
    final dateOfBirth = DateUtils.dateOnly(dateTime.value);
    this.dateOfBirth = dateOfBirth;
    update(["dob"]);
  }

  void selectedGenderInterest(int? index) async {
    if (index != null) {
      userData!.genderInterestIndex = index;
      selectedGenderInterestedIn.value = userData!.genderInterestIndex!;
      await updateUser();
    }
  }

  void userSelectedGender(S2SingleSelected selected) {
    selectedGender = selected;
    update(["gender"]);
  }

  void toggledMaximumDistance(int index) async {
    userData!.onlyUsesFromDistance = index == 1;
    initialDistanceIndex.value = userData!.onlyUsesFromDistance ? 1 : 0;
    await updateUser();
  }

  void selectedMiles(double value) async {
    userData?.distanceToFilter = value.toInt();
    distanceFilter.value = userData!.distanceToFilter!;
  }

  void toggledAgeRange(int index) async {
    userData!.onlyUsersFromAgeRange = index == 1;
    initialAgeRangeIndex.value = userData!.onlyUsersFromAgeRange ? 1 : 0;
    await updateUser();
  }

  void selectedAgeRange(SfRangeValues value) async {
    final String minAge = value.start.toString().split(".")[0];
    final String maxAge = value.end.toString().split(".")[0];
    userData!.minAge = int.parse(minAge);
    userData!.maxAge = int.parse(maxAge);
    ageRange.value = value;
  }

  void userMustHaveBio(int value) {
    hasBio = value == 1;
    hasBioInitialIndex = value;
    update(["hasBio"]);
  }

  Future<void> updateUser() async {
    isLoading.value = true;
    await userRepo.updateUserdata(userData!);
    await authRepo.setInitialScreen(user);
    isLoading.value = false;
  }

  @override
  void dispose() {
    dateRangePickerController.dispose();
    super.dispose();
  }
}
