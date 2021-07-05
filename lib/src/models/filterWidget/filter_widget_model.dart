import 'package:flutter/material.dart';

class FilterWidgetModel {
  @required
  final String title;
  final IconData icon;
  final IconData closedArrow;
  final IconData openedArrow;

  FilterWidgetModel({
    this.title,
    this.icon,
    this.closedArrow,
    this.openedArrow,
  });
}
