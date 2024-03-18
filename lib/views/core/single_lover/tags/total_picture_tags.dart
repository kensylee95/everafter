import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/match_controller.dart';
import 'package:remind_me/models/user_photo_model.dart';

class TotalPictureTags extends StatelessWidget {
  const TotalPictureTags({
    super.key,
    required this.photos,
    required this.activePhotoIndex,
  });
  final List<UserPhotoModel> photos;
  final int activePhotoIndex;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final MatchController controller = Get.put(MatchController());
    //current active index
    int activeIndex = activePhotoIndex;
    int numberOfPictures = photos.length;
    //for listview seperated builder
    final seperatorValue = size.width * 0.02;
    const double listViewPadding = 5;
    return SizedBox(
      height: 10,
      child: Center(
        child: ListView.separated(
            //itemExtent: thisWidgetWidth/p5ictures,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: listViewPadding),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: numberOfPictures,
            separatorBuilder: (context, index) => SizedBox(
                  width: seperatorValue,
                ),
            itemBuilder: (context, index) {
              
                //<--- Active tag --->
              if (index == activeIndex) {
                return FadeTransition(
                  key: Key(index.toString()),
                  opacity: controller.animation,
                  child: SingleTag(
                      size: size,
                      bgColor: primaryColor1.withOpacity(0.8),
                      borderColor: Colors.transparent,
                      listViewPadding: listViewPadding,
                      numberOfPictures: numberOfPictures),
                );
              }
              //<--- Not active tags --->
              else {
                return SingleTag(
                    size: size,
                    bgColor: Colors.grey.shade100.withOpacity(0.1),
                    borderColor: Colors.grey.shade50,
                    listViewPadding: listViewPadding,
                    numberOfPictures: numberOfPictures);
              }
            }),
      ),
    );
  }
}

class SingleTag extends StatelessWidget {
  const SingleTag({
    super.key,
    required this.size,
    required this.listViewPadding,
    required this.numberOfPictures,
    required this.bgColor, 
    required this.borderColor,
  });

  final Size size;
  final double listViewPadding;
  final int numberOfPictures;
  final Color bgColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          (size.width - 2 * padding - 2 * listViewPadding) / numberOfPictures,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: borderColor,
          )),
    );
  }
}
