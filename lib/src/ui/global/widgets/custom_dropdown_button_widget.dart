// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_more.dart';

class CustomDropdownButtonWidget extends StatefulWidget {
  final String title;
  final String hintTitle;
  final MediaQueryData mediaQuery;
  final List<String> options;
  final Function(String) selected;

  const CustomDropdownButtonWidget({
    Key key,
    this.title,
    this.options,
    this.mediaQuery,
    this.selected,
    this.hintTitle,
  }) : super(key: key);
  State<StatefulWidget> createState() => _CustomDropdownButtonWidgetState();
}

class _CustomDropdownButtonWidgetState
    extends State<CustomDropdownButtonWidget> {
  double heightTextField;
  double heightTitle;
  String dropdownValue;
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  //
  double widthDropdown;
  // Orientation myOrientation;
  //
  @override
  void initState() {
    heightTextField = 0.03125 * widget.mediaQuery.size.height; // 20;
    heightTitle = 0.0937 * widget.mediaQuery.size.height; // 60;
    widthDropdown = widget.mediaQuery.size.width;
    _dropdownMenuItems = buildDropdownMenuItems(
      widget.options,
      widthDropdown,
      widget.mediaQuery.size,
    );
    // myOrientation = widget.mediaQuery.orientation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // orientationDeviceListener();
    return Container(
      width: widthDropdown,
      height: heightTextField + heightTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: heightTitle - 0.054 * widget.mediaQuery.size.height, //30
            width: widget.mediaQuery.size.width -
                (0.19 * widget.mediaQuery.size.width), //70,
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 0.038 * widget.mediaQuery.size.width, // 14,
                color: MAIN_BLUE_COLOR,
              ),
            ),
          ),
          SizedBox(
            height: 0.0078 * widget.mediaQuery.size.height, //5
          ),
          Expanded(
            child: Container(
              // width: widthDropdown,
              margin: EdgeInsets.symmetric(
                horizontal: 0.0275 * widget.mediaQuery.size.width, // 10,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 0.055 * widget.mediaQuery.size.width, // 20,
              ),
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                // color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(
                  0.0078 * widget.mediaQuery.size.height, //5
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: DropdownButton(
                        value: dropdownValue,
                        hint: Text(
                          widget.hintTitle,
                          style: TextStyle(
                            fontFamily: 'IRANSans',
                            fontSize:
                                0.033 * widget.mediaQuery.size.width, // 12,
                          ),
                        ),
                        underline: Container(),
                        icon: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height:
                                      0.042 * widget.mediaQuery.size.width, //15
                                  width:
                                      0.042 * widget.mediaQuery.size.width, //15
                                  child: GlobalSvgImages.svgArrowBottom),
                            ],
                          ),
                        ),
                        iconSize: 0.0234 * widget.mediaQuery.size.height, //15
                        elevation: (0.025 * widget.mediaQuery.size.height)
                            .round(), //16
                        style: TextStyle(color: Colors.black),
                        onChanged: (String newValue) {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            dropdownValue = newValue;
                            widget.selected(dropdownValue);
                          });
                        },
                        items: _dropdownMenuItems,
                        // items: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // /// => this method listen to change [Orientation] ([portrait] or [landscape]) device
  // /// and update [width] of [screenSize] and [widthDropdown]
  // void orientationDeviceListener() {
  //   if (MediaQuery.of(context).orientation != myOrientation) {
  //     if (MediaQuery.of(context).orientation == Orientation.portrait) {
  //       setState(() {
  //         widthDropdown = widget.mediaQuery.size.width;
  //         myOrientation = Orientation.portrait;
  //         print('Orientation.portrait : widthDropdown = $widthDropdown');
  //       });
  //     } else {
  //       setState(() {
  //         widthDropdown = widget.mediaQuery.size.width;
  //         myOrientation = Orientation.landscape;
  //         print('Orientation.landscape : widthDropdown = $widthDropdown');
  //       });
  //     }
  //     _dropdownMenuItems =
  //         buildDropdownMenuItems(widget.options, widthDropdown);
  //   }
  // }
}
