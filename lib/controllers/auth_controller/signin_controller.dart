import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/repositories/auth_repo.dart';
import 'package:remind_me/repositories/user_repo.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/missing_username.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_initial.dart';

class SigninController extends GetxController {
 static SigninController get instance => Get.find();
  final UserRepo userRepo = Get.put(UserRepo());
  //final SigninRepo signupRepo = Get.put(SignupRepo());
  final showPasswordString = false.obs;
  final isGoogleLoading = false.obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  late TextEditingController firstName;
  late TextEditingController lastName;
  final auth = AuthRepo.instance;

  @override
  onInit() {
    super.onInit();
    //Split display name to get first name and last name
    final List<String>? name = auth.firebaseUser?.displayName?.split(" ");
    final String? displayFirstName = name?[0];
    final String? displayLastName = name?[1];
    firstName = TextEditingController(text: displayFirstName);
    lastName = TextEditingController(text: displayLastName);
  }

  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;
      UserCredential? credentials = await auth.signInWithGoogle();

      isGoogleLoading.value = false;
      if (credentials != null) {
        final UserModel? userData =
            await userRepo.getUserDetails(credentials.user!.email!);
        if (userData != null) {
          return await AuthRepo.instance.setInitialScreen(credentials.user);
        }
        await Get.offAll(
          () => const MissingUsername(),
        );
      }
    } catch (e) {
      isGoogleLoading.value = false;
      print("signInError: $e");
    }
  }

  updateAndCreateUser() async {
    isGoogleLoading.value = true;
    try {
      final auth = AuthRepo.instance;
      await auth.firebaseUser!.updateDisplayName(
          "${firstName.text.trim()} ${lastName.text.trim()}");
      await UserRepo.instance.createUser(
        UserModel(
          firstName: firstName.text.trim(),
          email: auth.firebaseUser!.email!,
          lastName: lastName.text.trim(),
        ),
      );
      await AuthRepo.instance.setInitialScreen(auth.firebaseUser);
      isGoogleLoading.value = false;
    } catch (e) {
      isGoogleLoading.value = false;
      print(e);
    }
  }

  signOut() async {
    final auth = AuthRepo.instance;
    await auth.signOut();
    await auth.googleSignOut();
    Get.offAll(() => const SignInInitial());
  }

  login() async {
    isGoogleLoading.value = true;
    final auth = AuthRepo.instance;
    try {
      await auth.loginWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      auth.firebaseUser == null
          ? null
          : auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      print(e);
      isGoogleLoading.value = false;
    }
    isGoogleLoading.value = false;
  }

  togglePassVisibility() {
    showPasswordString.value == !showPasswordString.value;
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
