import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.genderList,
  });
  final S2SingleSelected<dynamic> selectedValue;
  final void Function(S2SingleSelected<dynamic>) onChanged;
  final List<S2Choice> genderList;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SmartSelect.single(
        tileBuilder: (context, value) => S2Tile(padding: EdgeInsets.zero,
          value: Text(selectedValue.choice!.title!, style: Theme.of(context).textTheme.titleLarge?.apply(color: primaryColor1),),
           onTap: value.showModal,
         title: Text("Gender:",style: Theme.of(context).textTheme.bodyLarge,),
         ),
        title: "Your gender:",
        choiceLayout: S2ChoiceLayout.list,
        choiceDelay: const Duration(milliseconds: 100),
        choiceType: S2ChoiceType.radios,
        modalStyle: S2ModalStyle(
         backgroundColor: Theme.of(context).brightness==Brightness.light? Colors.grey.shade300:Colors.black,
        ),
        modalHeader: true,
        modalType: S2ModalType.popupDialog,
        modalConfig: S2ModalConfig(
          barrierColor: Colors.grey.shade900.withOpacity(0.8),
        ),
        selectedValue: selectedValue,
        onChange: onChanged,
        choiceItems: genderList,
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
      ),
    );
  }
}
