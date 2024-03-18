import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/user_actions_controllers/view_controller.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';
import 'package:remind_me/views/core/core_pages/views_children.dart/tabbar_widget.dart';
import 'package:remind_me/views/core/core_pages/views_children.dart/user_grids.dart';

class Views extends StatelessWidget {
  const Views({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Tab> tabs = [
      Tab(
        child: Text(
          "Profiles Seen",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      Tab(
        child: Text(
          "Viewed Me",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    ];
    final ViewsController controller = Get.put(ViewsController());
    return CustomContainer(
      height: size.height,
      width: size.width,
      containerPadding:
          const EdgeInsets.only(top: padding, left: padding, right: padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder(
              init: controller,
              id: "tabs",
              initState: (state) {
                controller.initTabBar(tabs.length);
              },
              builder: (context) {
                return TabBarWidget(controller: controller.tabController, tabs: tabs, onTap: (index){},);
              }),
              const SizedBox(height: padding,),
          Expanded(
            child: UsersGrids(size: size, userList: [],),
          )
        ],
      ),
    );
  }
}
