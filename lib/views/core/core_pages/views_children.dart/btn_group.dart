
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/views/core/core_pages/views_children.dart/btn.dart';

class BtnGroup extends StatelessWidget {
  const BtnGroup({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(padding)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Button(
            onTap: (){},
            icon: FontAwesomeIcons.xmark,
            iconColor: Colors.red,
          ),
          Button(
            onTap: () {},
            icon: FontAwesomeIcons.star,
            iconColor: Colors.blue,
          ),
          Button(
            onTap: () {},
            icon: FontAwesomeIcons.heart,
            iconColor: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}