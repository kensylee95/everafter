import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';

class SetupWrapper extends StatelessWidget {
  const SetupWrapper({Key? key, required this.child, this.onTap}) : super(key: key);
  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.keyboard_double_arrow_left_sharp,
            color: Colors.grey.shade500,
            size: 25,
          ),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade200
            : Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : Colors.grey.shade900,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    "Next",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.apply(color: primaryColor1),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: primaryColor1.withOpacity(0.8),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: CustomContainer(
          containerPadding: const EdgeInsets.symmetric(horizontal: padding,),
          // height: size.height,
          width: size.width,
          child: child,
        ),
      ),
    );
  }
}
