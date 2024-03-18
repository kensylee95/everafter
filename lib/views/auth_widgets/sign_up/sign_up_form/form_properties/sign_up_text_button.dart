
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in.dart';

class SignUpTextButton extends StatelessWidget {
  const SignUpTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ()=>Get.off(()=> const SignIn()),
      child: Text(
        haveAccount,
        style:
            Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.red),
        textAlign: TextAlign.end,
      ),
    );
  }
}
