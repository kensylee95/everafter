
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:remind_me/views/core/preference_widgets/advanced_filters/filter_widget.dart';

class FilterParent extends StatelessWidget {
  const FilterParent({
    super.key,
    required this.filterChilds,
    required this.parentName,
    this.isInitialExpanded,
  });
  final List<Widget> filterChilds;
  final String parentName;
  final bool? isInitialExpanded;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      initialExpanded: isInitialExpanded??false,
      child: Column(
        children: [
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: true,
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                iconColor: Theme.of(context).brightness==Brightness.dark?Colors.grey.shade300:Colors.blue.shade200,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  sizeCurve: Curves.decelerate),
              header: FilterWidget(text: parentName),
              collapsed: const SizedBox.shrink(),

              expanded: Column(
                children: filterChilds,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
