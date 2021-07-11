// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

class LabelFiltersPanel extends StatefulWidget {
  final String text;
  final int index;
  final Function(int) deleteLabel;

  const LabelFiltersPanel({
    Key key,
    @required this.text,
    @required this.deleteLabel,
    @required this.index,
  }) : super(key: key);
  @override
  _LabelFiltersPanelState createState() => _LabelFiltersPanelState();
}

class _LabelFiltersPanelState extends State<LabelFiltersPanel> {
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.0138 * _screenSize.width, //5,
      ),
      decoration: BoxDecoration(
          color: BLUE_SKY_FADE_COLOR,
          borderRadius: BorderRadius.circular(
            0.138 * _screenSize.width, //50,
          ),
          border: Border.all(color: MAIN_BLUE_COLOR)),
      child: Row(
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 0.038 * _screenSize.width, //14,

              color: MAIN_BLUE_COLOR,
            ),
          ),
          SizedBox(
            width: 0.0194 * _screenSize.width, //7,
          ),
          GestureDetector(
            onTap: () => widget.deleteLabel(widget.index),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  0.138 * _screenSize.width, //50,
                ),
                border: Border.all(
                  color: MAIN_BLUE_COLOR,
                  width: 0.001944 * _screenSize.width, //0.7,
                ),
              ),
              child: Icon(
                Icons.close,
                size: 0.05 * _screenSize.width, //18,
                color: MAIN_BLUE_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
