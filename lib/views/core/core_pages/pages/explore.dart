import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/explore_page_controller.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';
import 'package:remind_me/views/core/core_pages/explore_page_widgets/match_filter.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/explore_appbar/explore_appbar.dart';
import 'package:remind_me/views/core/core_pages/match_widgets/swipe_button.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ExplorePageController controller = Get.put(ExplorePageController());
    return SafeArea(
      child: Scaffold(
        appBar: const ExploreAppbar(),
       body: CustomContainer(
          height: size.height,
          width: size.width,
          containerPadding:
              const EdgeInsets.only(top: padding, left: padding, right: padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find members by filters:",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              MatchFilters(
                controller: controller,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.5,
                    crossAxisSpacing: padding,
                    mainAxisSpacing: padding,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(padding),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Text(index.toString()),
                            ),
                          ),
                          Container(
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
                                  onTap: () {},
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
                                  iconColor: Colors.green,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SwipeButton(
      width: 40,
      icon: icon,
      iconColor: iconColor,
      onTap: onTap,
      bgColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey.shade100
          : iconColor.withOpacity(0.1),
    );
  }
}

class Clickable extends StatelessWidget {
  const Clickable(
      {super.key,
      required this.size,
      required this.onTap,
      required this.color,
      required this.icon,
      required this.name});

  final Size size;
  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: color.withOpacity(0.4)),
            ),
            child: Center(
              child: Icon(icon, color: color, size: 30),
            ),
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.labelMedium,
          )
        ],
      ),
    );
  }
}
