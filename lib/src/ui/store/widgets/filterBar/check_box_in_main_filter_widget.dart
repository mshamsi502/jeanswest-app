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
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0.015 * _screenSize.height, //10,

        horizontal: 0.027 * _screenSize.width, //10,
      ),
      child: Row(
        children: [
          Text(
            "${widget.title} :",
            style: widget.titleTextStyle,
          ),
          SizedBox(
            width: 0.0138 * _screenSize.width, //5,
          ),
          Expanded(
            child: Container(
              height: 0.0656 * _screenSize.height, //42,
              // color: Colors.red,
              child: ListView.builder(
                itemCount: widget.checkBoxTitles.length,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext contex, int index) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(
                        0.011 * _screenSize.width, //4,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.0138 * _screenSize.width, //5,
                        vertical: 0.0046 * _screenSize.height, //3,
                      ),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          0.0083 * _screenSize.width, //3,
                        ),
                        border: Border.all(
                            color: widget.checkBoxValue[index]
                                ? FADE_BLUE_00_COLOR
                                : Colors.grey[200]),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 0.069 * _screenSize.width, //25,

                            height: 0.069 * _screenSize.width, //25,

                            decoration: BoxDecoration(
                              boxShadow: widget.checkBoxValue[index]
                                  ? []
                                  : [
                                      BoxShadow(
                                          color: Colors.grey[100],
                                          blurRadius:
                                              0.0083 * _screenSize.width, //3,

                                          // spreadRadius: 0.05,
                                          offset: Offset(
                                            0.00555 * _screenSize.width, //2,

                                            0.00277 * _screenSize.width, //1,
                                          ))
                                    ],
                            ),
                            child: Stack(
                              children: [
                                Container(
                                    color: widget.checkBoxValue[index]
                                        ? Colors.white
                                        : Colors.grey,
                                    margin: EdgeInsets.all(
                                      0.0138 * _screenSize.width, //5,
                                    )),
                                Icon(
                                  Icons.check_box,
                                  size: 0.069 * _screenSize.width, //25,

                                  color: widget.checkBoxValue[index]
                                      ? GREEN_TEXT_COLOR
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 0.0194 * _screenSize.width, //7,
                          ),
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
