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
