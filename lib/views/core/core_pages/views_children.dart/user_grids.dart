import 'package:flutter/material.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/views/core/core_pages/views_children.dart/btn_group.dart';

class UsersGrids extends StatelessWidget {
  const UsersGrids({
    super.key,
    required this.size,
    required this.userList,
  });

  final Size size;
  final List<UserModel?> userList;

  @override
  Widget build(BuildContext context) {
    return userList.isNotEmpty
        ? GridView.builder(
            itemCount: userList.length,
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
                    BtnGroup(size: size)
                  ],
                ),
              );
            },
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.opacity_outlined,
                  color: Colors.red,
                  size: 60,
                ),
                const SizedBox(height: 25,),
                Text(
                  "Ooops! its so quiet down here\nNo data to show",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(color: Colors.grey.shade400),
                ),
              ],
            ),
          );
  }
}
