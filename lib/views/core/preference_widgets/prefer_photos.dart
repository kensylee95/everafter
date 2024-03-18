import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/controllers/matching/filter_controller.dart';
import 'package:remind_me/models/user_model.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/preference_text_widget.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/sliders/slider_widget.dart';

class PreferPhotos extends StatelessWidget {
  const PreferPhotos({
    super.key,
    required this.userData,
  });
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    final FilterController controller =
        Get.put(FilterController(userDataModel: userData));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PreferenceTextWidget(text: "Minimum number of photos:"),
            GetBuilder(
              id: "photo-number",
              init: controller,
              builder: (controller) {
                return controller.userDataModel!.filterModel?.filterNumberOfPhotos != null
                    ? Obx(() => Text(
                          "${controller.preferedNoOfPhotos.value}",
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ))
                    : Text(
                        "Any",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.apply(color: primaryColor1),
                      );
              }
            ),
          ],
        ),
        Obx(
          () => SliderWidget(
            min: 1,
            max: 9,
            value: controller.preferedNoOfPhotos.value,
            intervalValue: 1,
            onChange: (value) => controller.updatePreferredNoPhotos(value),
          ),
        ),
      ],
    );
  }
}
