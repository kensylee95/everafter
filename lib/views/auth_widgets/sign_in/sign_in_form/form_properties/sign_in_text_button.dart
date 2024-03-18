
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up.dart';

class SignInTextButton extends StatelessWidget {
  const SignInTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ()=>Get.to(()=> const SignUp()),
      child: Text(
        dontHaveAccount,
        style:
            Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.red),
        textAlign: TextAlign.end,
      ),
    );
  }
}
