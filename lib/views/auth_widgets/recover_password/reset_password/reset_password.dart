import 'package:flutter/material.dart';
import 'package:remind_me/views/auth_widgets/recover_password/reset_password/reset_form/reset_form.dart';
import 'package:remind_me/views/auth_widgets/recover_password/reset_password/image_widget.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: CustomContainer(
            child: Container(
              color: Colors.transparent,
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ImageWidget(size: size),
                        Positioned(
                          top: size.height * 0.4,
                          bottom: size.height * 0,
                          left: 0,
                          right: 0,
                          child: ResetForm(size: size),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
