import 'package:flutter/material.dart';
import 'package:remind_me/views/auth_widgets/sign_in/image_widget.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in_form/sign_in_form.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

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
                              top: size.height * 0.35,
                              bottom: size.height * 0,
                              left: 0,
                              right: 0,
                              child: SignInForm(size: size),
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

