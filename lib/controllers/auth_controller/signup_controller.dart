import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/models/gender.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/repositories/auth_repo.dart';
import 'package:remind_me/repositories/user_repo.dart';
import 'package:remind_me/views/auth_widgets/otp/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  late SharedPreferences prefs;
  final AuthRepo authRepo = Get.put(AuthRepo());
  final UserRepo userRepo = Get.put(UserRepo());
  final showPasswordString = false.obs;
  final TextEditingController lastName = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  //supported gender models loaded from database
  late List<Gender> supportedGenderList;
  //selected S2SingleSelected gender
  late S2SingleSelected selectedGender;
  //tranformed  "S2Choice libary" format usable in Ui
  late List<S2Choice> genderData;
  //awaiting response from signup request
  bool isLoading = false;
  //check if email exist
  bool emailExist = false;

  @override
  onInit() async {
    super.onInit();
    
    loadGenderIdentity();
    prefs = await SharedPreferences.getInstance();
  }

  //validate username if username field losses focus
  emailFieldFocus(bool hasFocus) async {
    //once email field loses focus, send request to
    //database to check emailalready exist
    if (hasFocus == false && email.text.trim().isNotEmpty) {
      await isEmailExists(email.text.trim());
    }
  }

  //call function to show loading icon
  isRequesting(boolean) {
    isLoading = boolean;
    update(['isLoading']);
  }

  Future<void> isEmailExists(String email) async {
    isRequesting(true);
    try {
      emailExist = await userRepo.checkIfEmailExists(email);
    } finally {
      isRequesting(false);
      update(["email-exist"]);
    }
  }

  //load identity before app loads
  loadGenderIdentity() {
    //list of supported gender data from db
    supportedGenderList = [
      Gender(id: 1, name: "male"),
      Gender(id: 2, name: "Female"),
      Gender(id: 3, name: "others"),
    ];
    //tranform list to "S2Choice libary" format usable in Ui
    genderData = supportedGenderList
        .map((gender) => S2Choice(value: gender.id, title: gender.name))
        .toList();
    //default selected when UI loads
    selectedGender =
        S2SingleSelected(value: genderData[0].title, choice: genderData[0]);
  }

  togglePassVisibility() {
    showPasswordString.value = !showPasswordString.value;
  }

  userSelectedGender(selected) {
    selectedGender = selected;
    update(["gender"]);
  }

  createNewUser() async {
   isRequesting(true); 
    final user = UserModel(
      email: email.text.trim(),
      lastName: lastName.text.trim(),
      firstName: firstName.text.trim(),
    );
    final bool isDuplicateRegistration =
        await userRepo.checkIfEmailExists(email.text.trim());
    if (isDuplicateRegistration) {
      const GetSnackBar(
        title: "Duplicate registration",
        message: "This account has already been registered",
      );
      return;
    }
   try{ await authRepo.createUserWithEmailAndPassword(
      email.text.trim(),
      password.text.trim(),
      );
      await UserRepo.instance.createUser(user); 
    isRequesting(false);
    }catch(e){
      isRequesting(false);
      print(e);
    }
    
    await Get.to(const OtpScreen());
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    password.dispose();
    email.dispose();
    super.dispose();
  }
}
