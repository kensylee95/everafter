import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/constants/functions/validations.dart';
import 'package:remind_me/controllers/auth_controller/signup_controller.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/form_properties/lastname_field.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/form_properties/password_field.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/form_properties/firstname_field.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/form_properties/phone_number_field.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/form_properties/sign_up_btn.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/form_properties/sign_up_subtext.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/form_properties/sign_up_text.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/form_properties/sign_up_text_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.size,
  });

  final Size size;

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put(SignupController());

    return Container(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: padding, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SignUpText(),
                    const SizedBox(
                      height: padding,
                    ),
                    const SignUpSubText(),
                    const SizedBox(
                      height: padding,
                    ),
                   /* GetBuilder(
                        id: "gender",
                        init: controller,
                        builder: (controller) {
                          return GenderField(
                            onChanged: (selected) =>
                                controller.userSelectedGender(selected),
                            selectedValue: controller.selectedGender,
                            genderList: controller.genderData,
                          );
                        }),
                    const SizedBox(
                      height: padding,
                    ),*/
                    FirstnameField(
                      textField: controller.firstName,
                      validator: firstNameValidator(),
                    ),
                    const SizedBox(
                      height: padding,
                    ),
                    LastnameField(
                      textField: controller.lastName,
                      validator: lastNameValidator(),
                    ),
                    const SizedBox(
                      height: padding,
                    ),
                    GetBuilder(
                        id: "email-exist",
                        init: controller,
                        builder: (controller) {
                          return Focus(
                            onFocusChange: (isFocus) =>
                                controller.emailFieldFocus(isFocus),
                            child: EmailField(
                              textField: controller.email,
                              validator: emailValidator(),
                              errorText: controller.emailExist == true
                                  ? "Email already exists"
                                  : null,
                            ),
                          );
                        }),
                    const SizedBox(
                      height: padding,
                    ),
                    Obx(
                      () => PasswordField(
                        validator: passwordValidator(),
                        textField: controller.password,
                        toggleVisiblePassword: () =>
                            controller.togglePassVisibility(),
                        visiblePassword: controller.showPasswordString.value,
                        errorText: null,
                      ),
                    ),
                    const SizedBox(
                      height: tFormHeight,
                    ),
                    GetBuilder(
                        id: "email-exist",
                        init: controller,
                        builder: (controller) {
                          return SignUpButton(
                              size: size,
                              onTap: () {
                                formKey.currentState!.validate() &&
                                        !controller.emailExist
                                    ? controller.createNewUser()
                                    : null;
                              });
                        }),
                    const SignUpTextButton(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
