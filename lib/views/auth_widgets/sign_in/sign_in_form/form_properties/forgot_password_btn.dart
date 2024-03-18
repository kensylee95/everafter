
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/auth_widgets/recover_password/reset_password/reset_password.dart';

class ForgotPassBtn extends StatelessWidget {
  const ForgotPassBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ()=>Get.to(()=>const ResetPassword()),
      child: Text(
        forgotText,
        style:
            Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.blue),
        textAlign: TextAlign.end,
      ),
    );
  }
}
