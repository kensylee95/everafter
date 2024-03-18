import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';

class MultiFilterChild extends StatelessWidget {
  const MultiFilterChild({
    super.key,
    required this.changedValue,
    required this.text,
    required this.items,
    required this.selectedValues,
  });

  final void Function(S2MultiSelected<String>)? changedValue;
  final String text;
  final List<String> items;
  final List<String>? selectedValues;

  @override
  Widget build(BuildContext context){
    return SmartSelect.multiple(
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
                        color: Colors.grey.shade400,
                      ),
                      Text(
                       selectedValues==null|| selectedValues!.isEmpty
                       ?"Any"
                       :selectedValues!.length == 1
                            ? selectedValues!.take(1).first.capitalizeFirst!
                            : selectedValues!.length > 1
                                ? "${(selectedValues!.take(1)).join(",").capitalizeFirst}, +${selectedValues!.length - 1}"
                                : "Prefer any",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.apply(color: primaryColor1),
                      ),
                    ],
                  ),
                ]),
          ),
        );
      },
      //selectedValue:selectedValues??[""],
      choiceItems: items
          .map((item) => S2Choice(value: item, title: item.capitalizeFirst))
          .toList(),
      modalType: S2ModalType.bottomSheet,
      onChange: changedValue,
      title: text.capitalizeFirst,
      choiceLayout: S2ChoiceLayout.list,
      choiceStyle: S2ChoiceStyle(
        spacing: padding,
        //accentColor: primaryColor1.withOpacity(0.1),
        raised: true,
        titleStyle: Theme.of(context).textTheme.bodyMedium?.apply(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.grey.shade700),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 5,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade300
                  : Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(30)),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade100
            : Colors.grey.shade900,
        highlightColor: primaryColor1,
      ),
      selectedChoice: selectedValues?.map((e) => S2Choice(value: e, title: e.capitalizeFirst)).toList(),
      choiceActiveStyle: S2ChoiceStyle(
        spacing: padding,
        //accentColor: primaryColor1.withOpacity(0.1),
        raised: true,
        titleStyle:
            Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.white),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 5,
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(30)),
        color: primaryColor1,
        highlightColor: primaryColor1,
      ),
      choiceType: S2ChoiceType.chips,
      modalStyle: S2ModalStyle(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
      ),
    );
  }
}
