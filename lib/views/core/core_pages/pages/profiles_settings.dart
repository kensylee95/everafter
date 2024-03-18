import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/json_files/profile_values.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/profile_controller.dart';
import 'package:remind_me/models/profile/user_props/user_props.dart';
import 'package:remind_me/views/common_widgets/custom_container.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/application_appbars/general_appBar/app_bar.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/custom_scaffold.dart';
import 'package:remind_me/views/core/preference_widgets/advanced_filters/filter_parent.dart';
import 'package:remind_me/views/core/preference_widgets/advanced_filters/single_filter_child.dart';
import 'package:remind_me/views/core/profile_details/pictures/update_photos/update_photos.dart';

class ProfilesSettings extends StatelessWidget {
  const ProfilesSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    final Size size = MediaQuery.of(context).size;
    final UserProps? userProps = controller.userModel.value?.userProperties;
    final List<Map<String, dynamic>> appearance = [
      {
        "list": hairColor,
        "name": "Hair Color",
        "selected": userProps?.appearance?.hairColor
      },
      {
        "list": height,
        "name": "Height",
        "selected": userProps?.appearance?.height
      },
      {
        "list": bodyType,
        "name": "Body Type",
        "selected": userProps?.appearance?.bodyType
      },
      {
        "list": eyeColor,
        "name": "Eye Color",
        "selected": userProps?.appearance?.eyeColor
      },
      {
        "list": ethnicity,
        "name": "Ethnicity",
        "selected": userProps?.appearance?.ethnicity
      },
    ];
    final List<Map<String, dynamic>> lifeStyle = [
      {
        "list": doYouDrink,
        "name": "Drinking Habit",
        "selected": userProps?.lifeStyle?.doYouDrink
      },
      {
        "list": doYouSmoke,
        "name": "Smoking Habit",
        "selected": userProps?.lifeStyle?.doYouSmoke
      },
      {
        "list": livingSituation,
        "name": "Home Situation",
        "selected": userProps?.lifeStyle?.livingSituation
      },
      {
        "list": havePets,
        "name": "Have Pets?",
        "selected": userProps?.lifeStyle?.havePets
      },
      {
        "list": employmentStatus,
        "name": "Employment Status",
        "selected": userProps?.lifeStyle?.employmentStatus
      },
    ];
    final List<Map<String, dynamic>> backgroundValues = [
      {
        "list": education,
        "name": "education",
        "selected": userProps?.culturalValues?.education
      },
      {
        "list": religion,
        "name": "Religion",
        "selected": userProps?.culturalValues?.religion
      },
      {
        "list": starSign,
        "name": "Star Sign",
        "selected": userProps?.culturalValues?.starSign
      },
    ];
    return Scaffold(
      appBar: const GeneralAppBar(
        title: "Profile Settings",
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: CustomContainer(
          containerPadding: const EdgeInsets.all(padding),
         // height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade50,
                ),
                child: Column(
                  children: [
                    ChildTile(
                      text: "Update Photos",
                      icon: FontAwesomeIcons.photoFilm,
                      onTap: () => Get.to(() => const UpdatePhotos()),
                      iconColor: primaryColor1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 25,
                          color: Colors.yellow.shade600,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Photos others would see when\nyour profile comes up on there screen",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.apply(color: Colors.grey.shade600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: padding,
              ),
              Container(
                padding: const EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade50,
                ),
                child: Column(
                  children: [
                    FilterParent(
                      isInitialExpanded: true,
                        filterChilds: List.generate(
                          appearance.length,
                          (index) => SingleFilterChild(
                              selectedValue:
                                    appearance[index]["selected"] != null
                                        ?controller.getSelectedItem(appearance[index]["list"],  appearance[index]["selected"])
                                        : "Not Set",
                              onChildTap: (selectedValue) {
                                  controller.updateUserAppearance(
                                      selectedValue,
                                      controller.userModel.value!,
                                      appearance[index]["name"].toLowerCase());
                                },
                              text: appearance[index]["name"],
                              items: appearance[index]["list"]),
                        ),
                        parentName: "Update Appearance Details"),
                    const SizedBox(
                      height: padding,
                    ),
                    FilterParent(
                        filterChilds: List.generate(
                            lifeStyle.length,
                            (index) => SingleFilterChild(
                                selectedValue:
                                    lifeStyle[index]["selected"] != null
                                        ?controller.getSelectedItem(lifeStyle[index]["list"],  lifeStyle[index]["selected"])
                                        : "Not Set",
                                onChildTap: (selectedValue) {
                                  controller.updateUserLifeStyle(
                                      selectedValue,
                                      controller.userModel.value!,
                                      lifeStyle[index]["name"].toLowerCase());
                                },
                                text: lifeStyle[index]["name"],
                                items: lifeStyle[index]["list"])),
                        parentName: "Update Lifestyle Details"),
                    const SizedBox(
                      height: padding,
                    ),
                    FilterParent(
                        filterChilds: List.generate(
                            backgroundValues.length,
                            (index) => SingleFilterChild(
                                 selectedValue:
                                    backgroundValues[index]["selected"] != null
                                        ?controller.getSelectedItem(backgroundValues[index]["list"],  backgroundValues[index]["selected"])
                                        : "Not Set",
                                onChildTap: (selectedValue) {
                                  controller.updateUserCulturalValues(
                                      selectedValue,
                                      controller.userModel.value!,
                                      backgroundValues[index]["name"].toLowerCase());
                                },
                                text: backgroundValues[index]["name"],
                                items: backgroundValues[index]["list"])),
                        parentName: "Backround Values Details")
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Delete Account",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.apply(color: primaryColor),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
