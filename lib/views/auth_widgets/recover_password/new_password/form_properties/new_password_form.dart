import 'package:flutter/material.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/views/auth_widgets/recover_password/new_password/form_properties/confirm_new_password_field.dart';
import 'package:remind_me/views/auth_widgets/recover_password/new_password/form_properties/new_password_btn.dart';
import 'package:remind_me/views/auth_widgets/recover_password/new_password/form_properties/new_password_subtext.dart';
import 'package:remind_me/views/auth_widgets/recover_password/new_password/form_properties/new_password_text.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/form_properties/password_field.dart';


class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                      : Colors.grey.shade800,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30))),
              padding:
                  const EdgeInsets.symmetric(horizontal: padding, vertical: 30),
              child: Column(
                children: [
                  const NewPassWordText(),
                  const NewPasswordSubText(),
                  const SizedBox(
                    height: tFormHeight,
                  ),
                    PasswordField(
                      textField:null,
                      toggleVisiblePassword: (){},
                      visiblePassword: false,
                      errorText: null,
                    ),
                
                  const SizedBox(
                    height: padding,
                  ),
                  const ConfirmNewPasswordField(),
                  const SizedBox(
                    height: tFormHeight,
                  ),
                  NewPasswordButton(size: size),
                  const SizedBox(
                    height: padding,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
