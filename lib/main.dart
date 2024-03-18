import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/firebase_options.dart';
import 'package:remind_me/repositories/auth_repo.dart';
import 'package:remind_me/utils/theme.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthRepo());
    FirebaseModelDownloader.instance
        .getModel(
            "NSFW_DETECTOR",
            FirebaseModelDownloadType.localModel,
            FirebaseModelDownloadConditions(
              iosAllowsCellularAccess: true,
              iosAllowsBackgroundDownloading: false,
              androidChargingRequired: false,
              androidWifiRequired: false,
              androidDeviceIdleRequired: false,
            ))
        .then((customModel) async {
      // Download complete. Depending on your app, you could enable the ML
      // feature, or switch from the local model to the remote model, etc.

      // The CustomModel object contains the local path of the model file,
      // which you can use to instantiate a TensorFlow Lite interpreter.
      final localModelPath = customModel.file;
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("pathToNSFWMODEL", localModelPath.path);
      // ...
    });
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        darkTheme: TAppTheme.darkTheme,
        theme: TAppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        //popGesture: false,
        home: LoadingAnimation(
            child: LoadingAnimationWidget.inkDrop(
                color: primaryColor1, size: size.width * 0.1)));
  }
}
