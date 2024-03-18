

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:remind_me/constants/sizes.dart';

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          color: Colors.grey.shade200,
          height: size.height,
          width: size.width,
          child: Center(
            child: Column(children: [
              Icon(
                Icons.signal_wifi_connected_no_internet_4,
                size: 25,
                color: Colors.grey.shade500,
              ),
              const SizedBox(
                height: padding,
              ),
              Text(
                "No Internet Connection",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: padding,
              ),
              Text(
                "Ensure internet is enabled and you have internet connection",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
