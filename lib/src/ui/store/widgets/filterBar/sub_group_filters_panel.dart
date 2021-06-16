// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/label_filters-panel.dart';

class SubGroupFiltersPanel extends StatefulWidget {
  final bool haveGroupTitle;
  final String groupTitle;
  final List<String> subGroupsTitle;
  final List<bool> subGroupsValue;
  final Function(List<bool>) updateSubGroupsValue;

  const SubGroupFiltersPanel({
    Key key,
    @required this.groupTitle,
    @required this.haveGroupTitle,
    @required this.subGroupsTitle,
    @required this.subGroupsValue,
    @required this.updateSubGroupsValue,
  }) : super(key: key);
  @override
  _SubGroupFiltersPanelState createState() => _SubGroupFiltersPanelState();
}

class _SubGroupFiltersPanelState extends State<SubGroupFiltersPanel> {
  ScrollController scrollController = new ScrollController();
  ScrollController labelScrollController = new ScrollController();
  //
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
    if (widget.groupTitle != tempGroupTitle) {
      initializeValues();
    }
    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
      child: Column(
        children: [
          (checkSubGroupStatus(tempSubGroupsValue) == -1)
              ? SizedBox()
              : Container(
                  width: _screenSize.width,
                  height: 60,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: (activeSubGroupsTitle.length ==
                          widget.subGroupsTitle.length)
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text("همه ${widget.groupTitle} ها"))
                      : ListView.builder(
                          controller: labelScrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: activeSubGroupsTitle.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext contetx, int index) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: LabelFiltersPanel(
                                  text: activeSubGroupsTitle[index],
                                  index: index,
                                  deleteLabel: (int selectForDelete) {
                                    print("aaaaaaaaaaaa index : $index");
                                    print(
                                        "aaaaaaaaaaaa selectForDelete : $selectForDelete");
                                    print(
                                        "aaaaaaaaaaaa activeSubGroupsTitle[selectForDelete] : ${activeSubGroupsTitle[selectForDelete]}");
                                    print(
                                        "aaaaaaaaaaaa widget.subGroupsTitle : ${widget.subGroupsTitle}");
                                    // List<String> tempActiveSubGroupsTitle = [];
                                    // tempActiveSubGroupsTitle =
                                    //     deleteFromSeletion(selectForDelet);
                                    setState(() {
                                      activeSubGroupsTitle =
                                          deleteFromSeletion(selectForDelete);
                                      // activeSubGroupsTitle =
                                      //     tempActiveSubGroupsTitle;
                                      int indexInAll = widget.subGroupsTitle
                                              .indexOf(activeSubGroupsTitle[
                                                  selectForDelete]) -
                                          1;
                                      print(
                                          "aaaaaaaaaaaa indexInAll : $indexInAll ");
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "انتخاب همه ${widget.groupTitle} ها",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                                tempSubGroupsValue = List.filled(
                                    widget.subGroupsValue.length,
                                    selectAllStatus);
                                activeSubGroupsTitle = selectAllStatus
                                    ? widget.subGroupsTitle
                                    // ? ["همه ${widget.groupTitle} ها"]
                                    : [];
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
                )
              : SizedBox(),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.subGroupsTitle.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext contetx, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        changeSubGroupStatus(index);
                        updateActiveSubGroups(index);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                boxShadow: tempSubGroupsValue[index]
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
                                      color: tempSubGroupsValue[index]
                                          ? Colors.white
                                          : Colors.grey,
                                      margin: EdgeInsets.all(5)),
                                  Icon(
                                    Icons.check_box,
                                    size: 32,
                                    color: tempSubGroupsValue[index]
                                        ? GREEN_TEXT_COLOR
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.subGroupsTitle[index],
                              style: TextStyle(
                                fontSize: 16,
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
                      height: 2,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  changeSubGroupStatus(int index) {
    setState(() {
      tempSubGroupsValue[index] = !tempSubGroupsValue[index];
      selectAllStatus = (checkSubGroupStatus(tempSubGroupsValue) == 1);
    });
  }

  updateActiveSubGroups(int index) {
    List<String> tempActiveSubGroupsTitle = [];
    setState(() {
      if (selectAllStatus)
        // tempActiveSubGroupsTitle = ["همه ${widget.groupTitle} ها"];
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
          tempActiveSubGroupsTitle = deleteFromSeletion(indexInActive);
          // activeSubGroupsTitle.removeAt(indexInActive);
        } else {
          tempActiveSubGroupsTitle = activeSubGroupsTitle;
          tempActiveSubGroupsTitle.add(widget.subGroupsTitle[index]);
        }
      }
      // print("subGroupsTitle : ${widget.subGroupsTitle}");
      // print("activeSubGroupsTitle : $activeSubGroupsTitle");
      activeSubGroupsTitle = tempActiveSubGroupsTitle;
    });
  }

  List<String> deleteFromSeletion(int index) {
    List<String> tempActiveSubGroupsTitle = [];

    print("index : $index");

    tempActiveSubGroupsTitle.addAll(activeSubGroupsTitle.sublist(0, index));
    tempActiveSubGroupsTitle.addAll(activeSubGroupsTitle.sublist(index + 1));
    return tempActiveSubGroupsTitle;
  }

  initializeValues() {
    setState(() {
      tempSubGroupsValue = widget.subGroupsValue;
      activeSubGroupsTitle = [];
      int check = checkSubGroupStatus(tempSubGroupsValue);
      selectAllStatus = (check == 1);
      notSelected = (check == -1);
      tempGroupTitle = widget.groupTitle;
    });
  }
//
}

//
int checkSubGroupStatus(List<bool> tempSubGroupsValue) {
  // print(tempSubGroupsValue);
  // !check all is true, return 1
  bool allIsTrue = true;
  bool allIsFalse = true;

  for (int t = 0; t < tempSubGroupsValue.length; t++) {
    if (tempSubGroupsValue[t]) {
      allIsTrue = true;
    } else {
      allIsTrue = false;
      break;
    }
  }
  // print("allIsTrue : $allIsTrue");
  // !check all is false, return -1
  for (int f = 0; f < tempSubGroupsValue.length; f++) {
    if (!tempSubGroupsValue[f]) {
      allIsFalse = true;
    } else {
      allIsFalse = false;
      break;
    }
  }
  // print("allIsFalse : $allIsFalse");
  if (allIsTrue)
    return 1;
  else if (allIsFalse)
    return -1;
  else {
    // print("true and false together");
    return 0;
  }
}
