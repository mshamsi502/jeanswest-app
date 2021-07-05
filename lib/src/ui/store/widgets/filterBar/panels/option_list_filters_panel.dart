// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

class OptionListFiltersPanel extends StatefulWidget {
  final int indexInOptionWidgets;
  final List<String> checkBoxTitles;
  final List<bool> checkBoxValue;
  final TextStyle checkBoxTitlesTextStyle;
  final Function(List<bool>) updateCheckBoxValue;
  // final Function() closePanel;

  const OptionListFiltersPanel({
    Key key,
    @required this.checkBoxTitles,
    @required this.checkBoxValue,
    @required this.updateCheckBoxValue,
    @required this.checkBoxTitlesTextStyle,
    @required this.indexInOptionWidgets,
    // @required this.closePanel,
  }) : super(key: key);
  @override
  _OptionListFiltersPanelState createState() => _OptionListFiltersPanelState();
}

class _OptionListFiltersPanelState extends State<OptionListFiltersPanel> {
  ScrollController scrollController = new ScrollController();
  ScrollController labelScrollController = new ScrollController();
  //
  int tempOfSelectedIndex;
  List<bool> tempcheckBoxValue = [];

  //
  @override
  void initState() {
    initializeValues();
    super.initState();
  }

  initializeValues() {
    print("update page index : ${widget.indexInOptionWidgets}");
    setState(() {
      tempcheckBoxValue = [];
      tempcheckBoxValue = widget.checkBoxValue;
      tempOfSelectedIndex = widget.indexInOptionWidgets;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (tempOfSelectedIndex != widget.indexInOptionWidgets) initializeValues();
    return Column(
      children: [
        ListView.builder(
          itemCount: widget.checkBoxTitles.length,
          controller: scrollController,
          shrinkWrap: true,
          itemBuilder: (BuildContext contex, int index) {
            return Column(
              children: [
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            boxShadow: tempcheckBoxValue[index]
                                ? []
                                : [
                                    BoxShadow(
                                        color: Colors.grey[100],
                                        blurRadius: 3,
                                        offset: Offset(2, 1))
                                  ],
                          ),
                          child: Stack(
                            children: [
                              Container(
                                  color: tempcheckBoxValue[index]
                                      ? Colors.white
                                      : Colors.grey,
                                  margin: EdgeInsets.all(5)),
                              Icon(
                                Icons.check_box,
                                size: 32,
                                color: tempcheckBoxValue[index]
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
                  onTap: () => changeValueStatus(index),

                  // {
                  //   setState(() {
                  //     tempcheckBoxValue[index] = !tempcheckBoxValue[index];
                  //   });
                  // },
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.001 * _screenSize.width, //0.3,
                  height: 2,
                ),
              ],
            );
          },
        ),
        Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.all(20),
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
            onTap: () async {
              widget.updateCheckBoxValue(
                tempcheckBoxValue,
              );
            },
          ),
        ),
        SizedBox(height: 85),
      ],
    );
  }

  void changeValueStatus(int index) {
    bool _temp = !tempcheckBoxValue[index];
    List<bool> _tempList = tempcheckBoxValue.sublist(0, index);
    _tempList.add(_temp);
    _tempList.addAll(tempcheckBoxValue.sublist(index + 1));
    setState(() {
      tempcheckBoxValue = [];
      tempcheckBoxValue = _tempList;
    });
  }
}
