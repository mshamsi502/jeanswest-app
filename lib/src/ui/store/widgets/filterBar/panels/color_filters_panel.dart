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
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/utils/helper/store/helper.dart';

class ColorFiltersPanel extends StatefulWidget {
  final int indexInOptionWidgets;
  final List<CategoryColor> colors;
  final List<bool> colorsValue;
  final Function(List<bool>) updateColorsValue;

  const ColorFiltersPanel({
    Key key,
    @required this.indexInOptionWidgets,
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
  int tempIndexInOptionWidgets;
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
      tempColorsValue = [];
      tempColorsValue = widget.colorsValue;
      int check = checkValueListStatus(tempColorsValue);
      selectAllStatus = (check == 1);
      notSelected = (check == -1);
      tempIndexInOptionWidgets = widget.indexInOptionWidgets;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (tempIndexInOptionWidgets != widget.indexInOptionWidgets)
      initializeValues();

    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.054 * _screenSize.width, //20

                  vertical: 0.015 * _screenSize.height, //10,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg_images/store/category/wheel_color.svg',
                      width: 0.069 * _screenSize.width, //25,
                      height: 0.039 * _screenSize.height, //25,
                    ),
                    SizedBox(
                      width: 0.027 * _screenSize.width, //10,
                    ),
                    Text(
                      "نمایش همه رنگ ها",
                      style: TextStyle(
                        fontSize: 0.0444 * _screenSize.width, //16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    FlutterSwitch(
                      width: 0.166 * _screenSize.width, //60,

                      height: 0.0515 * _screenSize.height, //33,
                      valueFontSize: 0.038 * _screenSize.width, //14,
                      toggleSize: 0.083 * _screenSize.width, //30,
                      inactiveColor: MAIN_BLUE_COLOR,
                      activeColor: Colors.grey[400],
                      borderRadius: 0.138 * _screenSize.width, //50,
                      padding: 0.0083 * _screenSize.width, //3,
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
              SizedBox(height: 0.0078 * _screenSize.height //5,

                  ),
              Divider(
                color: Colors.grey,
                thickness: 0.001 * _screenSize.width, //0.3,
                height: 0.003125 * _screenSize.height, //2,
              ),
            ],
          ),
          SizedBox(
            height: 0.015 * _screenSize.height, //10,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.054 * _screenSize.width, //20
            ),
            child: GridView.count(
              crossAxisCount: ((_screenSize.width -
                      (0.083 * _screenSize.width //30,
                      )) ~/
                  (0.1805 * _screenSize.width //65,
                  )),
              mainAxisSpacing: 0.054 * _screenSize.width, //20

              crossAxisSpacing: 0.0138 * _screenSize.width, //5,

              children: List.generate(widget.colors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    changeColorsStatus(index);
                    // updateActiveColors(index);
                  },
                  child: Container(
                    width: 0.1805 * _screenSize.width, //65,

                    height: 0.1805 * _screenSize.width, //65,

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
                                  width: 0.09722 * _screenSize.width, //35,
                                  height: 0.09722 * _screenSize.width, //35,
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
          // Expanded(child: SizedBox()),
          // widget.indexInOptionWidgets <= 0
          //     ? SizedBox()
          //     :
          Padding(
            padding: EdgeInsets.all(
              0.054 * _screenSize.width, //20
            ),
            child: AvakatanButtonWidget(
              backgroundColor: MAIN_BLUE_COLOR,
              textColor: Colors.white,
              borderColor: MAIN_BLUE_COLOR,
              hasShadow: false,
              title: 'اعمال فیلتر',
              height: 0.07 * _screenSize.height, //45,
              width: _screenSize.width,
              fontSize: 0.05 * _screenSize.width, //18,
              radius: 0.011 * _screenSize.width, //4,
              onTap: () {
                widget.updateColorsValue(tempColorsValue);
              },
            ),
          ),
          SizedBox(
            height: 0.1328 * _screenSize.height, //85,
          ),
        ],
      ),
    );
  }

  void changeColorsStatus(int index) {
    bool _temp = !tempColorsValue[index];
    List<bool> _tempList = tempColorsValue.sublist(0, index);
    _tempList.add(_temp);
    _tempList.addAll(tempColorsValue.sublist(index + 1));
    setState(() {
      tempColorsValue = [];
      tempColorsValue = _tempList;
      selectAllStatus = (checkValueListStatus(tempColorsValue) == 1);
      notSelected = (checkValueListStatus(tempColorsValue) == -1);
    });
  }
}
