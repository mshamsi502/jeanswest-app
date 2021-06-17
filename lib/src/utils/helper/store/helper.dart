// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:jeanswest/src/models/filterWidget/filter_widget_model.dart';

List<FilterWidgetModel> createFilters({@required List<String> mainGroup}) {
  List<FilterWidgetModel> filters = [];
  filters.add(
    FilterWidgetModel(
      title: "فیلتر ها",
      icon: Icons.filter_alt_outlined,
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
  );
  //
  for (int i = 0; i < mainGroup.length; i++) {
    filters.add(
      FilterWidgetModel(
        title: mainGroup[i],
        icon: Icons.filter_alt_outlined,
        closedArrow: Icons.arrow_drop_down,
        openedArrow: Icons.arrow_drop_up,
      ),
    );
  }
  //
  filters.add(
    FilterWidgetModel(
      title: "جنسیت",
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
  );
  filters.add(
    FilterWidgetModel(
      title: "رده سنی",
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
  );
  filters.add(
    FilterWidgetModel(
      title: "گروه رنگی",
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
  );
  filters.add(
    FilterWidgetModel(
      title: "سایز",
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
  );
  //
  return filters;
}

List<String> deleteFromSeletion(
    {@required int index, @required List<String> activeSubGroupsTitle}) {
  List<String> tempActiveSubGroupsTitle = [];

  print("index : $index");

  tempActiveSubGroupsTitle.addAll(activeSubGroupsTitle.sublist(0, index));
  tempActiveSubGroupsTitle.addAll(activeSubGroupsTitle.sublist(index + 1));
  return tempActiveSubGroupsTitle;
}

int checkValueListStatus(List<bool> tempSubGroupsValue) {
  // print(tempSubGroupsValue);
  // !check all is true, return 1
  bool allIsTrue = true;
  bool allIsFalse = true;

  for (int t = 0; t < tempSubGroupsValue.length; t++) {
    if (tempSubGroupsValue[t]) {
      allIsTrue = true;
    } else {
      allIsTrue = false;
      break;
    }
  }
  // print("allIsTrue : $allIsTrue");
  // !check all is false, return -1
  for (int f = 0; f < tempSubGroupsValue.length; f++) {
    if (!tempSubGroupsValue[f]) {
      allIsFalse = true;
    } else {
      allIsFalse = false;
      break;
    }
  }
  // print("allIsFalse : $allIsFalse");
  if (allIsTrue)
    return 1;
  else if (allIsFalse)
    return -1;
  else {
    // print("true and false together");
    return 0;
  }
}
