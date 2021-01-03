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
  final MediaQueryData mediaQuery;
  final List<String> options;
  final Function(String) selected;

  const CustomDropdownButtonWidget({
    Key key,
    this.title,
    this.options,
    this.mediaQuery,
    this.selected,
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
  Orientation myOrientation;
  //
  @override
  void initState() {
    heightTextField = 20;
    heightTitle = 60;
    widthDropdown = widget.mediaQuery.size.width;
    _dropdownMenuItems = buildDropdownMenuItems(widget.options, widthDropdown);
    myOrientation = widget.mediaQuery.orientation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orientationDeviceListener();
    return Container(
      width: widthDropdown,
      height: heightTextField + heightTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: heightTitle - 35,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: MAIN_BLUE_COLOR,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            // width: widthDropdown,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
              // color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: DropdownButton(
                      value: dropdownValue,
                      hint: Text(
                        "انتخاب دپارتمان ...",
                        style: TextStyle(
                          fontFamily: 'IRANSans',
                        ),
                      ),
                      underline: Container(),
                      icon: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GlobalSvgImages.svgArrowBottom,
                          ],
                        ),
                      ),
                      iconSize: 15,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String newValue) {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          dropdownValue = newValue;
                          widget.selected(dropdownValue);
                        });
                      },
                      // onChanged: null,
                      items: _dropdownMenuItems,
                      // items: null,
                    ),
                  ),
                ),
                // GlobalSvgImages.svgArrowBottom,
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// => this method listen to change [Orientation] ([portrait] or [landscape]) device
  /// and update [width] of [screenSize] and [widthDropdown]
  void orientationDeviceListener() {
    if (MediaQuery.of(context).orientation != myOrientation) {
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        setState(() {
          widthDropdown = widget.mediaQuery.size.width;
          myOrientation = Orientation.portrait;
          print('Orientation.portrait : widthDropdown = $widthDropdown');
        });
      } else {
        setState(() {
          widthDropdown = widget.mediaQuery.size.width;
          myOrientation = Orientation.landscape;
          print('Orientation.landscape : widthDropdown = $widthDropdown');
        });
      }
      _dropdownMenuItems =
          buildDropdownMenuItems(widget.options, widthDropdown);
    }
  }
}
