import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/functions/formatted_time.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/auth_widgets/sign_up/sign_up_form/form_properties/gender_field.dart';
import 'package:remind_me/views/common_widgets/loading_animation.dart';
import 'package:remind_me/views/common_widgets/setup_wrapper.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DobAndGender extends StatelessWidget {
  const DobAndGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PreferenceController controller = Get.put(PreferenceController());
    //Color textColor = Theme.of(context).brightness==Brightness.light?Colors.grey.shade900:Colors.grey.shade300;
    Size size = MediaQuery.of(context).size;
    return SetupWrapper(
      onTap: ()=>controller.updateUser(),
      child: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Almost There....",
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
               
                Text(
                  "what's your gender and when where you born?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(color: Colors.grey.shade500),
                ),
                
                GetBuilder(
                    id: "gender",
                    init: controller,
                    builder: (controller) {
                      return
                          //controller.supportedGenderList.isNotEmpty?
                          Align(
                        alignment: Alignment.bottomLeft,
                        child: GenderField(
                          onChanged: (selected) =>
                              controller.userSelectedGender(selected),
                          selectedValue: controller.selectedGender,
                          genderList: controller.genderData,
                        ),
                      );
                      //:const SizedBox.shrink();
                    }),
               
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Birth Date : ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge?.apply(color: Colors.grey.shade800)
                      ),
                      
                       GetBuilder(
                        id: "dob",
                        init: controller,
                         builder: (controller) {
                           return Text(
                            "${controller.dateOfBirth!.day}, ${monthName(controller.dateOfBirth!.month)}. ${controller.dateOfBirth!.year}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge,
                                                 );
                         }
                       ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Select your date of birth from the calendar below",
                       textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.apply(color: Colors.grey.shade500),
                      ),
                  ),
                const SizedBox(
                  height: padding,
                ),
                Card(
                  shadowColor: Colors.grey.shade900,
                  elevation: 10,
                  surfaceTintColor: Colors.grey.shade50,
                  borderOnForeground: true,
                  child: SfDateRangePicker(
                    controller: controller.dateRangePickerController,
                   onSelectionChanged: ( changedValue)=>controller.onDobChanged(changedValue),
                    selectionMode: DateRangePickerSelectionMode.single,
                    //backgroundColor: primaryColor1,

                    showNavigationArrow: true,
                    maxDate: controller.maxDobAllowed,
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      enableSwipeSelection: true,
                    ),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: Colors.grey.shade600),
                    ),
                    selectionTextStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.apply(color: Colors.white),
                    selectionColor: primaryColor1,
                    endRangeSelectionColor: primaryColor1,
                    headerStyle: DateRangePickerHeaderStyle(
                      textAlign: TextAlign.center,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.apply(color: primaryColor1),
                    ),
                    initialSelectedDate: DateTime(1994, 10, 14),
                    initialDisplayDate: DateTime(1994, 10, 14),
                  ),
                )
              ],
            ),
            Obx(() => controller.isLoading.value
                ? Positioned(
                    child: LoadingAnimation(
                        child: LoadingAnimationWidget.inkDrop(
                            color: primaryColor1, size: size.width * 0.1)))
                : const SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
