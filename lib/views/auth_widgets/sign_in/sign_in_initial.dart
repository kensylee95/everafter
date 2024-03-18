import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/core_images/logo/logo.dart';
import 'package:remind_me/constants/core_images/match_images/auth_images.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/auth_controller/sigin_initial_controller.dart';
import 'package:remind_me/controllers/auth_controller/signin_controller.dart';
import 'package:remind_me/views/auth_widgets/sign_in/sign_in.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignInInitial extends StatelessWidget {
  const SignInInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInInitialController controller =Get.put(SignInInitialController());
    final SigninController signInController =Get.put(SigninController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomContainer(
            child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).brightness==Brightness.light? Colors.white:darkBackgroundColor,
              image: const DecorationImage(
                  image: AssetImage(
                    signInImage,
                  ),
                  fit: BoxFit.fitWidth,
                  opacity: 0.5)),
          child: Stack(
            children: [
              Positioned(
                top: size.height*0.06,
                left: padding,
                //right: size.width*0.1,
                child: SvgPicture.asset(
                  lightLogo1,
                  height: 15,
                ),
              ),
              Positioned(
                top: size.height * 0.1,
                right: padding,
                left: padding,
                bottom: size.height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder(
                      init: controller,
                      id: "carousel",
                      builder: (context) {
                        return SizedBox(
                          height: size.height*0.2,
                          child: PageView.builder(
                            controller: controller.pageController,
                            //itemCount: controller.titles.length,
                            physics: const PageScrollPhysics(),
                            pageSnapping: true,
                            reverse: true,
                            itemCount: controller.titles.length,
                            onPageChanged: (index)=>controller.carouselChanged(index),
                            itemBuilder: (_, index){
                           return Scrollable(
                              title: controller.titles[index],
                              subtitle: controller.subTitles[index],
                            );
                            }
                          ),
                        );
                      }
                    ),
                    
                    GetBuilder(
                      init: controller,
                      id: "carousel",
                      builder: (controller) {
                        return SmoothPageIndicator(
                          effect: WormEffect(dotWidth: 30, dotHeight: 5, dotColor: Theme.of(context).brightness==Brightness.light?Colors.white: Colors.grey.shade50, activeDotColor: primaryColor1,type: WormType.thinUnderground),
                            controller:controller.pageController,
                            onDotClicked: (index) async=> await controller.gotoPage(index),
                            count: controller.titles.length);
                      }
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: size.height * 0.5,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.mirror),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness==Brightness.light?Colors.grey.shade200.withOpacity(0.9):Colors.black.withOpacity(0.7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: tFormHeight,
                          ),
                          const HeaderText(),
                          const SizedBox(
                            height: tFormHeight,
                          ),
                          SizedBox(
                            width: size.width * 0.8,
                            child: OutlinedButton(
                              onPressed: ()async=> await signInController.googleSignIn(),
                              style: ButtonStyle(
                                side: MaterialStatePropertyAll(
                                  BorderSide(
                                    width: 6,
                                    color: Theme.of(context).brightness==Brightness.light?primaryColor1: Colors.grey.shade300,
                                  ),
                                ),
                                shape: const MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Image(
                                    image: AssetImage(google),
                                    height: 30,
                                    width: 30,
                                  ),
                                  Text(
                                    "Continue with Google",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.apply(color: Theme.of(context).brightness==Brightness.light?Colors.black:Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: padding,
                          ),
                          SizedBox(
                            width: size.width * 0.8,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () async =>
                                  await Get.to(() => const SignIn()),
                              style: ButtonStyle(
                                side: MaterialStatePropertyAll(
                                  BorderSide(
                                    width: 6,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                shape: const MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Sign In",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.apply(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: tFormHeight,
                          ),
                          GestureDetector(
                            onTap: () async =>
                                await Get.to(() => const SignUp()),
                            child: Text.rich(
                              TextSpan(
                                text: "Alternatively, ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.apply(
                                      color: Theme.of(context).brightness==Brightness.light?Colors.black:Colors.white,
                                    ),
                                children: [
                                  TextSpan(
                                    text: "Sign up here",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.apply(
                                          color: Theme.of(context).brightness==Brightness.light?primaryColor1:primaryColor1.withGreen(255),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Obx(()=> signInController.isGoogleLoading.value?Positioned(child: LoadingAnimation(child: LoadingAnimationWidget.discreteCircle(color: primaryColor1, size: size.width*0.1))):const SizedBox.shrink()),
            ],
          ),
        )),
      ),
    );
  }
}

class Scrollable extends StatelessWidget {
  const Scrollable({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.apply(color: Theme.of(context).brightness==Brightness.light?Colors.black:Colors.grey.shade400),
        ),
        const SizedBox(
          height: padding,
        ),
        Text(
          subtitle,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: Theme.of(context).brightness==Brightness.light?Colors.grey.shade800:Colors.grey.shade500,
              ),
          textAlign: TextAlign.start,
        )
      ],
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create magic\ntogether.",
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.apply(color: Theme.of(context).brightness==Brightness.light?Colors.black: Colors.white),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5,),
        Text(
          "Let's be part of your fairy tale story.",
          style:
              Theme.of(context).textTheme.bodySmall?.apply(color: Theme.of(context).brightness==Brightness.light?Colors.black:Colors.white),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
