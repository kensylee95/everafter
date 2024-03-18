import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/auth_controller/signin_controller.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/form_properties/password_field.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/form_properties/sign_in_btn.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/form_properties/sign_in_subtext.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/form_properties/sign_in_text.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/form_properties/sign_in_text_button.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/form_properties/phone_number_field.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';

import 'form_properties/forgot_password_btn.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final SigninController controller = Get.put(SigninController());
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: padding, vertical: 30),
                  child: Column(
                    children: [
                      const SignInText(),
                      const SignInSubText(),
                      const SizedBox(
                        height: tFormHeight,
                      ),
                      EmailField(
                        textField: controller.email,
                      ),
                      const SizedBox(
                        height: padding,
                      ),
                      Obx(
                        () => PasswordField(
                          textField: controller.password,
                          toggleVisiblePassword: () =>
                              controller.togglePassVisibility(),
                          visiblePassword: controller.showPasswordString.value,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ForgotPassBtn(),
                        ],
                      ),
                      SignInButton(
                        size: size,
                        onTap: () => controller.login(),
                      ),
                      const SignInTextButton(),
                      const SizedBox(
                        height: padding,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
         Positioned(
                child: 
        Obx(() => controller.isGoogleLoading.value
            ?LoadingAnimation(
                  child: LoadingAnimationWidget.inkDrop(
                      color: primaryColor1, size: size.width * 0.1),
                )
            : const SizedBox.shrink()),
              ),
      ],
    );
  }
}
