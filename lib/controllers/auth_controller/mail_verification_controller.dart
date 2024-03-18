import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:remind_me/repositories/auth_repo.dart';

class MailVericationController extends GetxController{
  // ignore: unused_field
  late Timer _timer;
  final isLoading = false.obs;

@override
  void onInit(){
  super.onInit();
  sendEmailVerification();
  setTimerForAutoRedirect();
}
void sendEmailVerification()async{
  await AuthRepo.instance.sendEmailVerification();
}
void setTimerForAutoRedirect(){
  _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user!.emailVerified){
      timer.cancel();
      AuthRepo.instance.setInitialScreen(user);
    }
  });
}
void manuallyCheckEmailVerificationStatus(){
  FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user!.emailVerified){
      AuthRepo.instance.setInitialScreen(user);
    }
}
}