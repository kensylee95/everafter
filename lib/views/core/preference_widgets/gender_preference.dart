
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/toggle_switch.dart';
import 'package:remind_me/views/core/preference_widgets/preference_container.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/preference_text_widget.dart';

class GenderPreference extends StatelessWidget {
  const GenderPreference({
    super.key,
    required this.size,
    required this.gender,
    required this.controller,
    required this.onTap,
  });

  final Size size;
  final String gender;
  final VoidCallback onTap;
  final PreferenceController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PreferenceContainer(
        size: Size(size.width, size.height * 0.15),
        children: [
          const PreferenceTextWidget(text: "I'm seaking:"),
          Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(
                    ()=>ToggleSwitchButton(
                      size: size,
                      initialIndex: controller.selectedGenderInterestedIn.value,
                      onTap: (index)=>controller.selectedGenderInterest(index),
                      totalSwitch: 3,
                      listOflabels: controller.genderInterestedIn,
                    //listOfIcons: [ Icon(Icons.female, size: 11,),Icon(Icons.male), Icon(Icons.face)]
                    ),
                  ),),
        ],
      ),
    );
  }
}