import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/controllers/auth_controller/mail_verification_controller.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    Key? key,
    this.userId,
  }) : super(key: key);
  final int? userId;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final MailVericationController controller = Get.put(MailVericationController());
    return SafeArea(
      child: Scaffold(
        body: CustomContainer(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.5,
                padding: const EdgeInsets.symmetric(horizontal: padding),
                decoration: const BoxDecoration(
                    color: primaryColor1,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                        const Icon(
                            FontAwesomeIcons.userShield,
                            color: Colors.white,
                            size: 80,
                          ),
                           const SizedBox(
                           height: tFormHeight,
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: padding,
                          ),
                          Text(
                            verificationTitle,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.apply(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: padding,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          verificationSubTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.apply(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: tFormHeight,
                      ),
                    ]),
              ),
              SizedBox(height: size.height*0.1,),
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: SizedBox(
                      height: 60,
                      width: size.width,
                      child: ElevatedButton(
                        onPressed: ()=>controller.manuallyCheckEmailVerificationStatus(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Continue",
                              style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.white),
                            ),
                            SizedBox(width: size.width*0.02,),
                            const Icon(Icons.arrow_forward_sharp, size: 30,)
                          ],
                        ),
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
