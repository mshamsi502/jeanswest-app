// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/categoryColor/category-color.dart';
import 'package:jeanswest/src/utils/helper/store/helper.dart';

class ColorFiltersPanel extends StatefulWidget {
  final List<CategoryColor> colors;
  final List<bool> colorsValue;
  final Function(List<bool>) updateColorsValue;

  const ColorFiltersPanel({
    Key key,
    @required this.colors,
    @required this.colorsValue,
    @required this.updateColorsValue,
  }) : super(key: key);
  @override
  _ColorFiltersPanelState createState() => _ColorFiltersPanelState();
}

class _ColorFiltersPanelState extends State<ColorFiltersPanel> {
  ScrollController scrollController = new ScrollController();
  ScrollController labelScrollController = new ScrollController();
  //
  // List<CategoryColor> activeColors = [];
  List<bool> tempColorsValue = [];
  bool selectAllStatus = false;
  bool notSelected = true;
  //
  @override
  void initState() {
    initializeValues();
    super.initState();
  }

  initializeValues() {
    setState(() {
      tempColorsValue = widget.colorsValue;
      int check = checkValueListStatus(tempColorsValue);
      selectAllStatus = (check == 1);
      notSelected = (check == -1);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg_images/store/category/wheel_color.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "نمایش همه رنگ ها",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    FlutterSwitch(
                      width: 60,
                      height: 33,
                      valueFontSize: 14,
                      toggleSize: 30,
                      inactiveColor: MAIN_BLUE_COLOR,
                      activeColor: Colors.grey[400],
                      borderRadius: 50,
                      padding: 3,
                      showOnOff: false,
                      value: !selectAllStatus,
                      onToggle: (val) {
                        setState(() {
                          selectAllStatus = !val;
                          notSelected = !selectAllStatus;
                          tempColorsValue = List.filled(
                              widget.colorsValue.length, selectAllStatus);
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.grey,
                thickness: 0.001 * _screenSize.width, //0.3,
                height: 2,
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              crossAxisCount: ((_screenSize.width - 30) ~/ 65),
              mainAxisSpacing: 20,
              crossAxisSpacing: 5,
              children: List.generate(widget.colors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    changeColorsStatus(index);
                    // updateActiveColors(index);
                  },
                  child: Container(
                    width: 65,
                    height: 65,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Center(
                          child: widget.colors[index].image,
                        ),
                        tempColorsValue[index]
                            ? Center(
                                child: SvgPicture.asset(
                                  'assets/images/svg_images/store/category/circle_checkbox.svg',
                                  width: 35,
                                  height: 35,
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                );
              }),
            ),
          )),
        ],
      ),
    );
  }

  changeColorsStatus(int index) {
    setState(() {
      tempColorsValue[index] = !tempColorsValue[index];
      selectAllStatus = (checkValueListStatus(tempColorsValue) == 1);
    });
  }

  // updateActiveColors(int index) {
  //   List<CategoryColor> tempActiveColors = [];
  //   setState(() {
  //     if (selectAllStatus)
  //       tempActiveColors = widget.colors;
  //     else {
  //       //! sort by widget.subGroupsTitle list
  //       //
  //       // if (activeSubGroupsTitle.contains("همه ${widget.groupTitle} ها")) {
  //       //   activeSubGroupsTitle = widget.subGroupsTitle;
  //       // }
  //       // activeSubGroupsTitle = [];
  //       // for (int i = 0; i < tempSubGroupsValue.length; i++) {
  //       //   if (tempSubGroupsValue[i])
  //       //     activeSubGroupsTitle.add(widget.subGroupsTitle[i]);
  //       // }
  //       //
  //       //! sort by user activation
  //       if (activeSubGroupsTitle.contains(widget.subGroupsTitle[index])) {
  //         int indexInActive =
  //             activeSubGroupsTitle.indexOf(widget.subGroupsTitle[index]);
  //         tempActiveSubGroupsTitle = deleteFromSeletion(
  //           index: indexInActive,
  //           activeSubGroupsTitle: activeSubGroupsTitle,
  //         );
  //       } else {
  //         tempActiveSubGroupsTitle = activeSubGroupsTitle;
  //         tempActiveSubGroupsTitle.add(widget.subGroupsTitle[index]);
  //       }
  //     }
  //     activeSubGroupsTitle = tempActiveSubGroupsTitle;
  //   });
  // }
}
