// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

class CheckBoxInMainFilterWidget extends StatefulWidget {
  final String title;
  final TextStyle titleTextStyle;
  final List<String> checkBoxTitles;
  final TextStyle checkBoxTitlesTextStyle;
  final List<bool> checkBoxValue;
  final Function(int, bool) updateCheckBoxValue;

  const CheckBoxInMainFilterWidget({
    Key key,
    @required this.checkBoxTitles,
    @required this.title,
    @required this.updateCheckBoxValue,
    @required this.checkBoxValue,
    this.titleTextStyle,
    this.checkBoxTitlesTextStyle,
  }) : super(key: key);
  @override
  _CheckBoxInMainFilterWidgetState createState() =>
      _CheckBoxInMainFilterWidgetState();
}

class _CheckBoxInMainFilterWidgetState
    extends State<CheckBoxInMainFilterWidget> {
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Text(
            "${widget.title} :",
            style: widget.titleTextStyle,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Container(
              height: 42,
              // color: Colors.red,
              child: ListView.builder(
                itemCount: widget.checkBoxTitles.length,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext contex, int index) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(4),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                            color: widget.checkBoxValue[index]
                                ? FADE_BLUE_00_COLOR
                                : Colors.grey[200]),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              boxShadow: widget.checkBoxValue[index]
                                  ? []
                                  : [
                                      BoxShadow(
                                          color: Colors.grey[100],
                                          blurRadius: 3,
                                          // spreadRadius: 0.05,
                                          offset: Offset(2, 1))
                                    ],
                            ),
                            child: Stack(
                              children: [
                                Container(
                                    color: widget.checkBoxValue[index]
                                        ? Colors.white
                                        : Colors.grey,
                                    margin: EdgeInsets.all(5)),
                                Icon(
                                  Icons.check_box,
                                  size: 25,
                                  color: widget.checkBoxValue[index]
                                      ? GREEN_TEXT_COLOR
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            widget.checkBoxTitles[index],
                            style: widget.checkBoxTitlesTextStyle,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      widget.updateCheckBoxValue(
                        index,
                        !widget.checkBoxValue[index],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
