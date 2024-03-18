import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/json_files/profile_values.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/matching/filter_controller.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/views/core/preference_widgets/advanced_filters/filter_parent.dart';
import 'package:remind_me/views/core/preference_widgets/advanced_filters/multi_filter_child.dart';

class AdvancedFilters extends StatelessWidget {
  const AdvancedFilters({
    super.key,
    required this.userData,
  });
  final UserModel userData;
  @override
  Widget build(BuildContext context) {
    final FilterController filterController =
        Get.put(FilterController(userDataModel: userData));

    //<--- Appearance children items --->
    List<Map<String, dynamic>> appearanceFilterChilds = [
      {
        "typeOf": "body style",
        "selectedList":
            filterController.userFilterModel?.filterAppearance?.bodyType,
        "items": bodyType
      },
      {
        "typeOf": "ethnicity",
        "selectedList":
            filterController.userFilterModel?.filterAppearance?.ethnicity,
        "items": ethnicity
      },
      {
        "typeOf": "eye color",
        "selectedList":
            filterController.userFilterModel?.filterAppearance?.eyeColor,
        "items": eyeColor
      },
      {
        "typeOf": "hair color",
        "selectedList":
            filterController.userFilterModel?.filterAppearance?.hairColor,
        "items": hairColor,
      }
    ];
    //<--- Lifestyle children items--->
    List<Map<String, dynamic>> lifeStyleFilterChilds = [
      {
        "items": doYouDrink,
        "selectedList":
            filterController.userFilterModel?.filterLifeStyles?.doYouDrink,
        "typeOf": "drinking habit",
      },
      {
        "items": doYouSmoke,
        "selectedList":
            filterController.userFilterModel?.filterLifeStyles?.doYouSmoke,
        "typeOf": "smoking habit",
      },
      {
        "items": employmentStatus,
        "selectedList": filterController
            .userFilterModel?.filterLifeStyles?.employmentStatus,
        "typeOf": "employment",
      },
    ];
    //<--- Background Values children items--->
    List<Map<String, dynamic>> backgroundValuesFilterChilds = [
      {
        "items": education,
        "selectedList":
            filterController.userFilterModel?.filterCulturalValues?.education,
        "typeOf": "education",
      },
      {
        "items": religion,
        "selectedList":
            filterController.userFilterModel?.filterCulturalValues?.religion,
        "typeOf": "religion",
      },
      {
        "items": starSign,
        "selectedList":
            filterController.userFilterModel?.filterCulturalValues?.starSign,
        "typeOf": "star sign",
      },
    ];

    //<--- List of Filter Parent Widgets items --->
    List<Widget> filterParents = [
      //by appearance
      FilterParent(
        filterChilds: List.generate(
          appearanceFilterChilds.length,
          (index) => GetBuilder(
              init: filterController,
              id: appearanceFilterChilds[index]["typeOf"],
              builder: (filterController) {
                return ReusableChild(
                  filterController: filterController,
                  typeOf: appearanceFilterChilds[index]["typeOf"],
                  items: appearanceFilterChilds[index]["items"],
                  selectedValues: appearanceFilterChilds[index]
                      ["selectedList"]!,
                  changedValueFunction: (typeOf, changedValue) =>
                      filterController.updateUserAppearanceFilter(
                          typeOf, changedValue),
                );
              }),
        ),
        parentName: "By appearance",
      ),

      const SizedBox(
        height: padding,
      ),
      //by lifestyle
      FilterParent(
        filterChilds: List.generate(
          lifeStyleFilterChilds.length,
          (index) => GetBuilder(
              init: filterController,
              id: lifeStyleFilterChilds[index]["typeOf"],
              builder: (filterController) {
                return ReusableChild(
                  filterController: filterController,
                  typeOf: lifeStyleFilterChilds[index]["typeOf"],
                  items: lifeStyleFilterChilds[index]["items"],
                  selectedValues: lifeStyleFilterChilds[index]["selectedList"]!,
                  changedValueFunction: (typeOf, changedValue) =>
                      filterController.updateUserLifeStyleFilter(
                          typeOf, changedValue),
                );
              }),
        ),
        parentName: "By lifeStyle",
      ),
      const SizedBox(
        height: padding,
      ),
      //<--- by background values --->
      FilterParent(
        filterChilds: List.generate(
          backgroundValuesFilterChilds.length,
          (index) => GetBuilder(
              init: filterController,
              id: backgroundValuesFilterChilds[index]["typeOf"],
              builder: (filterController) {
                return ReusableChild(
                  filterController: filterController,
                  typeOf: backgroundValuesFilterChilds[index]["typeOf"],
                  items: backgroundValuesFilterChilds[index]["items"],
                  selectedValues: backgroundValuesFilterChilds[index]
                      ["selectedList"]!,
                  changedValueFunction: (typeOf, changedValue) =>
                      filterController.updateUserBackgroundValuesFilter(
                          typeOf, changedValue),
                );
              }),
        ),
        parentName: "By Background Values",
      ),
    ];

    //Parent column containing List of Filter parents widgets 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: filterParents,
    );
  }
}
//<--- Resusable filter parent child widget class used to generate list of filter parent children --> 
class ReusableChild extends StatelessWidget {
  const ReusableChild({
    super.key,
    required this.filterController,
    required this.typeOf,
    required this.selectedValues,
    required this.items,
    required this.changedValueFunction,
  });
  final FilterController filterController;
  final String typeOf;
  final List<String> selectedValues;
  final List<String> items;
  final void Function(String, S2MultiSelected<String>) changedValueFunction;

  @override
  Widget build(BuildContext context) {
    return MultiFilterChild(
      items: items,
      selectedValues: selectedValues,
      text: typeOf,
      changedValue: (changedValue) =>
          changedValueFunction(typeOf, changedValue),
    );
  }
}
