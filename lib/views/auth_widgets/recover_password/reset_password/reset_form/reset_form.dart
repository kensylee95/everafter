import 'package:flutter/material.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/views/auth_widgets/recover_password/reset_password/reset_form/form_properties/reset_btn.dart';
import 'package:remind_me/views/auth_widgets/recover_password/reset_password/reset_form/form_properties/reset_subtext.dart';
import 'package:remind_me/views/auth_widgets/recover_password/reset_password/reset_form/form_properties/reset_text.dart';
import 'package:remind_me/views/auth_widgets/recover_password/reset_password/reset_form/form_properties/reset_text_button.dart';
import 'package:remind_me/views/auth_widgets/recover_password/reset_password/reset_form/form_properties/user_number_field.dart';

class ResetForm extends StatelessWidget {
  const ResetForm({
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
                      : Colors.black,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30))),
              padding:
                  const EdgeInsets.symmetric(horizontal: padding, vertical: 30),
              child: Column(
                children: [
                  const ResetText(),
                  const ResetSubText(),
                  const SizedBox(
                    height: tFormHeight,
                  ),
                  const UserNumberField(),
                  const SizedBox(
                    height: tFormHeight,
                  ),
                  ResetButton(size: size),
                  const ResetTextButton(),
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
