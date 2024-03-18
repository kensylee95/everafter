import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/auth_controller/signin_controller.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';
import 'package:remind_me/views/common_widgets/custom_textfield.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/general_appBar/app_bar.dart';

class MissingUsername extends StatelessWidget {
  const MissingUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SigninController controller = Get.put(SigninController());
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const GeneralAppBar(
        title: "",
      ),
      body: SingleChildScrollView(
        child: CustomContainer(
          containerPadding: const EdgeInsets.all(padding),
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Whats your name ?",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: padding,
                  ),
                  Text(
                    "Enter your first and last name to continue",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(color: Colors.grey.shade600),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: tFormHeight,
                  ),
                  CustomTextfield(
                    obscureText: false,
                    controller: controller.firstName,
                    hintText: "Enter your first name",
                  ),
                  const SizedBox(
                    height: tFormHeight,
                  ),
                  CustomTextfield(
                    obscureText: false,
                    controller: controller.lastName,
                    hintText: "Enter your last name",
                  ),
                  const SizedBox(height: padding,),
                  TextButton(
                    onPressed: () => controller.updateAndCreateUser(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Continue",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(color: primaryColor1),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.arrow_forward_outlined,
                          color: primaryColor1,
                          size: 25,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Obx(
                () => controller.isGoogleLoading.value
                    ? Positioned(
                        child: LoadingAnimation(
                          child: Center(
                            child: LoadingAnimationWidget.inkDrop(
                                color: primaryColor1, size: size.width * 0.1),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
