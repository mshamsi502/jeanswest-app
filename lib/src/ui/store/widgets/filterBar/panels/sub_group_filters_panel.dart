// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/label_filters-panel.dart';
import 'package:jeanswest/src/utils/helper/store/helper.dart';

class SubGroupFiltersPanel extends StatefulWidget {
  final bool haveGroupTitle;
  final isFromMainFilter;
  final int indexInOptionWidgets;
  final String groupTitle;
  final List<String> subGroupsTitle;
  final List<bool> subGroupsValue;
  final Function(List<bool>) updateSubGroupsValue;

  const SubGroupFiltersPanel({
    Key key,
    @required this.groupTitle,
    @required this.haveGroupTitle,
    @required this.indexInOptionWidgets,
    @required this.subGroupsTitle,
    @required this.subGroupsValue,
    @required this.updateSubGroupsValue,
    @required this.isFromMainFilter,
  }) : super(key: key);
  @override
  _SubGroupFiltersPanelState createState() => _SubGroupFiltersPanelState();
}

class _SubGroupFiltersPanelState extends State<SubGroupFiltersPanel> {
  ScrollController scrollController = new ScrollController();
  ScrollController labelScrollController = new ScrollController();
  //
  int tempIndexInOptionWidgets;
  String tempGroupTitle;
  List<String> activeSubGroupsTitle = [];
  List<bool> tempSubGroupsValue = [];
  bool selectAllStatus = false;
  bool notSelected = true;
  //
  @override
  void initState() {
    // tempGroupTitle = widget.groupTitle;
    initializeValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (tempIndexInOptionWidgets != widget.indexInOptionWidgets ||
        widget.groupTitle != tempGroupTitle) {
      initializeValues();
    }
    print("tempSubGroupsValue : ${tempSubGroupsValue ?? "null"}");
    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
      child: Column(
        children: [
          notSelected
              ? SizedBox()
              : Container(
                  width: _screenSize.width,
                  height: 0.078125 * _screenSize.height, //50,

                  padding: EdgeInsets.symmetric(
                    vertical: 0.015 * _screenSize.height, //10,
                  ),
                  child: (activeSubGroupsTitle.length ==
                          widget.subGroupsTitle.length)
                      ? Row(
                          children: [
                            Container(
                              height: 0.09375 * _screenSize.height, //60,

                              padding: EdgeInsets.symmetric(
                                horizontal: 0.0138 * _screenSize.width, //5,
                              ),
                              child: LabelFiltersPanel(
                                text: "همه ${widget.groupTitle} ها",
                                index: -1,
                                deleteLabel: (int indexInActive) =>
                                    initializeValues(),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        )
                      : ListView.builder(
                          controller: labelScrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: activeSubGroupsTitle.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext contetx, int index) {
                            return Container(
                              height: 0.09375 * _screenSize.height, //60,
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.0138 * _screenSize.width, //5,
                              ),
                              child: LabelFiltersPanel(
                                  text: activeSubGroupsTitle[index],
                                  index: index,
                                  deleteLabel: (int indexInActive) {
                                    int indexInAll = widget.subGroupsTitle
                                        .indexOf(activeSubGroupsTitle[
                                            indexInActive]);
                                    setState(() {
                                      activeSubGroupsTitle = deleteFromSeletion(
                                        index: indexInActive,
                                        activeSubGroupsTitle:
                                            activeSubGroupsTitle,
                                      );
                                      changeSubGroupStatus(indexInAll);
                                    });
                                  }),
                              // Text(activeSubGroupsTitle[index])
                            );
                          }),
                ),
          widget.haveGroupTitle
              ? Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.054 * _screenSize.width, //20

                        vertical: 0.015 * _screenSize.height, //10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "انتخاب همه ${widget.groupTitle} ها",
                            style: TextStyle(
                              fontSize: 0.0444 * _screenSize.width, //16,

                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                                tempSubGroupsValue = List.filled(
                                    widget.subGroupsValue.length,
                                    selectAllStatus);
                                activeSubGroupsTitle = selectAllStatus
                                    ? widget.subGroupsTitle
                                    : [];
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.0138 * _screenSize.width, //5,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.001 * _screenSize.width, //0.3,
                      height: 0.003125 * _screenSize.height, //2,
                    ),
                  ],
                )
              : SizedBox(),
          Expanded(
            child:
                //  SizedBox(),
                ListView.builder(
              controller: scrollController,
              itemCount: widget.subGroupsTitle.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext contetx, int index) {
                print(
                    "222 -/-/-/-/-/-/-   widget.subGroupsTitle : ${widget.subGroupsTitle}");
                // print(
                // "-/-/-/-/-/-/-  subGroupsTitles : ${subGroupsTitles ?? "null"}");

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        changeSubGroupStatus(index);
                        updateActiveSubGroups(index);
                      },
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 0.023 * _screenSize.height, //15
                          horizontal: 0.031 * _screenSize.height, //20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 0.0888 * _screenSize.width, //32,
                              height: 0.0888 * _screenSize.width, //32,
                              decoration: BoxDecoration(
                                boxShadow: tempSubGroupsValue[index]
                                    ? []
                                    : [
                                        BoxShadow(
                                            color: Colors.grey[100],
                                            blurRadius:
                                                0.0083 * _screenSize.width, //3,

                                            offset: Offset(
                                              0.00555 * _screenSize.width, //2,

                                              0.00277 * _screenSize.width, //1,
                                            ))
                                      ],
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                      color: tempSubGroupsValue[index]
                                          ? Colors.white
                                          : Colors.grey,
                                      margin: EdgeInsets.all(
                                        0.0138 * _screenSize.width, //5,
                                      )),
                                  Icon(
                                    Icons.check_box,
                                    size: 0.0888 * _screenSize.width, //32,

                                    color: tempSubGroupsValue[index]
                                        ? GREEN_TEXT_COLOR
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 0.027 * _screenSize.width, //10,
                            ),
                            Text(
                              widget.subGroupsTitle[index],
                              style: TextStyle(
                                fontSize: 0.0444 * _screenSize.width, //16,

                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.001 * _screenSize.width, //0.3,
                      height: 0.00555 * _screenSize.width, //2,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(
              0.054 * _screenSize.width, //20
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(3, 0),
                )
              ],
              color: Colors.white,
            ),
            child: AvakatanButtonWidget(
              backgroundColor: MAIN_BLUE_COLOR,
              textColor: Colors.white,
              borderColor: MAIN_BLUE_COLOR,
              hasShadow: false,
              title: widget.indexInOptionWidgets <= 0 ? "تایید" : "اعمال فیلتر",
              height: 0.07 * _screenSize.height, //45,
              width: _screenSize.width,
              fontSize: 0.05 * _screenSize.width, //18,
              radius: 0.011 * _screenSize.width, //4,
              onTap: () {
                widget.updateSubGroupsValue(tempSubGroupsValue);
              },
            ),
          ),
          SizedBox(
            height: 0.036 * _screenSize.height, //23,
          ),
        ],
      ),
    );
  }

  changeSubGroupStatus(int index) {
    bool _temp = !tempSubGroupsValue[index];
    List<bool> _tempList = tempSubGroupsValue.sublist(0, index);
    _tempList.add(_temp);
    _tempList.addAll(tempSubGroupsValue.sublist(index + 1));
    setState(() {
      tempSubGroupsValue = [];
      tempSubGroupsValue = _tempList;
      selectAllStatus = (checkValueListStatus(tempSubGroupsValue) == 1);
      notSelected = (checkValueListStatus(tempSubGroupsValue) == -1);
    });
  }

  updateActiveSubGroups(int index) {
    List<String> tempActiveSubGroupsTitle = [];
    setState(() {
      if (selectAllStatus)
        tempActiveSubGroupsTitle = widget.subGroupsTitle;
      else {
        //! sort by widget.subGroupsTitle list
        //
        // if (activeSubGroupsTitle.contains("همه ${widget.groupTitle} ها")) {
        //   activeSubGroupsTitle = widget.subGroupsTitle;
        // }
        // activeSubGroupsTitle = [];
        // for (int i = 0; i < tempSubGroupsValue.length; i++) {
        //   if (tempSubGroupsValue[i])
        //     activeSubGroupsTitle.add(widget.subGroupsTitle[i]);
        // }
        //
        //! sort by user activation
        if (activeSubGroupsTitle.contains(widget.subGroupsTitle[index])) {
          int indexInActive =
              activeSubGroupsTitle.indexOf(widget.subGroupsTitle[index]);
          tempActiveSubGroupsTitle = deleteFromSeletion(
            index: indexInActive,
            activeSubGroupsTitle: activeSubGroupsTitle,
          );
        } else {
          tempActiveSubGroupsTitle = activeSubGroupsTitle;
          tempActiveSubGroupsTitle.add(widget.subGroupsTitle[index]);
        }
      }
      activeSubGroupsTitle = tempActiveSubGroupsTitle;
    });
  }

  initializeValues() {
    setState(() {
      tempIndexInOptionWidgets = widget.indexInOptionWidgets;
      tempSubGroupsValue = widget.subGroupsValue;
      activeSubGroupsTitle = [];
      int check = checkValueListStatus(tempSubGroupsValue);
      selectAllStatus = (check == 1);
      notSelected = (check == -1);
      tempGroupTitle = widget.groupTitle;
    });
  }
}
