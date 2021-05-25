// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:jeanswest/src/models/filterWidget/filter_widget_model.dart';

List<FilterWidgetModel> createFilters() {
  return [
    FilterWidgetModel(
      title: "فیلتر ها",
      icon: Icons.filter_alt_outlined,
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
    FilterWidgetModel(
      title: "لباس",
      icon: Icons.directions_walk_sharp,
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
    FilterWidgetModel(
      title: "کیف وکفش",
      icon: Icons.shopping_bag_outlined,
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
    FilterWidgetModel(
      title: "اکسسوری",
      icon: Icons.watch,
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
    FilterWidgetModel(
      title: "جنسیت",
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
    FilterWidgetModel(
      title: "رده سنی",
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
    FilterWidgetModel(
      title: "گروه رنگی",
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
    FilterWidgetModel(
      title: "سایز",
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
  ];
}
