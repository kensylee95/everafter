import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/controllers/auth_controller/signup_controller.dart';
import 'package:remind_me/views/auth_widgets/sign_up/image_widget.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/sign_up_form.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put(SignupController());
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
                          top: size.height*0.06,
                          bottom: size.height * 0,
                          left: 0,
                          right: 0,
                          child: SignUpForm(size: size),
                        ),
                        //loading animation
                        GetBuilder(
                            init: controller,
                            id: "isLoading",
                            builder: (controller) {
                              return controller.isLoading
                                  ? Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      top: 0,
                                      child: LoadingAnimation(
                                        child: LoadingAnimationWidget.inkDrop(
                                          color: primaryColor1,
                                          size: size.width * 0.1,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            }),
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
