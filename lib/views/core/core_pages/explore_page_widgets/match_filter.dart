import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/controllers/explore_page_controller.dart';

class MatchFilters extends StatelessWidget {
  const MatchFilters({Key? key, required this.controller}) : super(key: key);
  final ExplorePageController controller;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Widget> widgetsList = [
      Clickable(
        controller: controller,
        index: 0,
        size: size,
        name: "In My Area",
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade300
            : Colors.black,
        icon: Icons.location_on_outlined,
        onTap: (index)=>controller.filterClicked(index),
      ),
      Clickable(
         controller: controller,
        index: 1,
        size: size,
        name: "Mutuals",
        color: Theme.of(context).brightness == Brightness.dark
            ? primaryColor1.withRed(250)
            : primaryColor1,
        icon: FontAwesomeIcons.faceGrinHearts,
        onTap: (index)=>controller.filterClicked(index),
      ),
      Clickable(
         controller: controller,
        index: 2,
        size: size,
        name: "Popular",
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.red.shade400
            : Colors.red.shade700,
        icon: FontAwesomeIcons.fire,
        onTap: (index)=>controller.filterClicked(index),
      ),
     
      Clickable(
         controller: controller,
        index: 4,
        size: size,
        name: "Newest",
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.orange.shade400
            : Colors.orange.shade700,
        icon: Icons.supervised_user_circle_outlined,
        onTap: (index)=>controller.filterClicked(index),
      ),
    ];
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: size.width,
          child: ListView.separated(
            itemCount: widgetsList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            //itemExtent: size.width/4,

            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return widgetsList[index];
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class Clickable extends StatelessWidget {
  const Clickable({
    super.key,
    required this.size,
    required this.onTap,
    required this.color,
    required this.icon,
    required this.name,
    required this.index, required this.controller,
  });

  final Size size;
  final Function(int) onTap;
  final Color color;
  final IconData icon;
  final String name;
  final int index;
  final ExplorePageController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: color.withOpacity(0.4)),
            ),
            child: Center(
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          Obx(
            ()=>controller.activeFilterIndex.value==index? AnimatedContainer(duration: Duration(milliseconds: 200),
            width: size.width*0.2,
            height: 2,
            decoration: BoxDecoration(color: primaryColor1, borderRadius: BorderRadius.circular(50)),
            ):const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
