
import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';

class SingleFilterChild extends StatelessWidget {
  const SingleFilterChild({
    super.key,
    required this.onChildTap,
    required this.text,
    required this.items,
    required this.selectedValue,
  });

  final void Function(S2SingleSelected<String>)? onChildTap;
  final String text;
  final List<String> items;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SmartSelect.single(
      tileBuilder: (context, value) {
        return GestureDetector(
          onTap: value.showModal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${text.capitalizeFirst!}:",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        size: 15,
                        color: Colors.grey.shade300,
                      ),
                      Text(
                        value.selected.value.capitalizeFirst!,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.apply(color: primaryColor1),
                      ),
                    ],
                  ),
                ]),
          ),
        );
      },
      selectedValue: selectedValue??"Not set",
      choiceItems: items
          .map((item) => S2Choice(value: item, title: item.capitalizeFirst))
          .toList(),
      modalType: S2ModalType.bottomSheet,
      onChange: onChildTap,
      title: text.capitalizeFirst,
      choiceLayout: S2ChoiceLayout.list,
      choiceActiveStyle: S2ChoiceStyle(
          spacing: padding,
          accentColor: primaryColor1.withOpacity(0.1),
          raised: true,
          titleStyle: Theme.of(context).textTheme.bodyMedium,
          elevation: 0,
          subtitleStyle: Theme.of(context).textTheme.bodyMedium,
          color: primaryColor1,
          highlightColor: primaryColor1,
          padding: const EdgeInsets.all(padding)),
      choiceType: S2ChoiceType.radios,
      modalStyle: S2ModalStyle(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade300
            : Colors.black,
      ),
    );
  }
}
