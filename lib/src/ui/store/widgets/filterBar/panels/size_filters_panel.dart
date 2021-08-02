// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

import 'package:jeanswest/src/ui/global/widgets/dropDown/custom_dropdown_button_widget.dart';

class SizeFiltersPanel extends StatefulWidget {
  final int indexInOptionWidgets;
  final List<String> titles;
  final Map<String, List<String>> sizeTitles;
  final List<Map<String, bool>> sizeValue;
  final MediaQueryData mediaQuery;
  final Function(List<Map<String, bool>>) updateSizesValue;

  const SizeFiltersPanel({
    Key key,
    @required this.titles,
    @required this.sizeTitles,
    @required this.mediaQuery,
    @required this.updateSizesValue,
    @required this.sizeValue,
    @required this.indexInOptionWidgets,
  }) : super(key: key);
  @override
  _SizeFiltersPanelState createState() => _SizeFiltersPanelState();
}

class _SizeFiltersPanelState extends State<SizeFiltersPanel>
    with TickerProviderStateMixin {
  ScrollController scrollController = new ScrollController();
  ScrollController labelScrollController = new ScrollController();
  //
  List<Map<String, bool>> tempSizesValue = [];
  List<Widget> dropDownItems = [];
  List<bool> isShowDropDown = [];
  int tempIndexInOptionWidgets;
  // List<List<String>> activedTitles;
  List<String> _hints;
  int _selectedForExpanded = -1;
  //

  List<AnimationController> expandController = [];
  List<Animation<double>> animation = [];
  //
  @override
  void initState() {
    _hints = [];
    int _counter = 0;
    widget.sizeTitles.forEach((key, value) {
      _hints.add("");
      isShowDropDown.add(false);
      expandController.add(AnimationController(
          vsync: this, duration: Duration(milliseconds: 350)));
      animation.add(CurvedAnimation(
        parent: expandController[_counter],
        curve: Curves.fastOutSlowIn,
      ));
      _counter++;
    });

    initializeValues();
    super.initState();
  }

  expandedListener() {
    scrollController.animateTo(
      _selectedForExpanded == -1 ||
              widget.sizeTitles.length == _selectedForExpanded + 1
          ? scrollController.position.minScrollExtent
          : ((widget.sizeTitles.length - _selectedForExpanded) *
                  (scrollController.position.maxScrollExtent /
                      widget.sizeTitles.length))
              .toDouble(),
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  initializeValues() {
    setState(() {
      tempIndexInOptionWidgets = widget.indexInOptionWidgets;
      tempSizesValue = widget.sizeValue;
    });
  }
  // !

  // !

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => setState(() {
        _selectedForExpanded = -1;
        isShowDropDown = [];
        widget.sizeTitles.forEach((key, value) {
          isShowDropDown.add(false);
        });
        expandController.forEach((element) {
          element.reverse();
        });
        expandedListener();
      }),
      child: Column(
        children: [
          Expanded(
            child: Container(
              // height: _screenSize.height,
              padding: EdgeInsets.symmetric(
                horizontal: 0.027 * _screenSize.width, //10,
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  height: ((0.15625 * widget.mediaQuery.size.height //100
                              ) *
                              widget.sizeTitles.length)
                          .toDouble() +
                      0.234 * widget.mediaQuery.size.height //150
                  ,
                  // color: Colors.red,
                  child: Stack(
                    // children: dropDownItems,
                    children: List<Widget>.generate(widget.sizeTitles.length,
                        (index) {
                      return Positioned(
                        top: (((0.15625 * widget.mediaQuery.size.height //100,

                                ) *
                                (widget.sizeTitles.length - index - 1))
                            .toDouble()),
                        child: Container(
                          // color: Colors.red,
                          child: Stack(
                            children: [
                              CustomDropdownButtonWidget(
                                title: widget.sizeTitles.keys.elementAt(
                                    widget.sizeTitles.length - index - 1),
                                hintTitle: _hints[
                                    widget.sizeTitles.length - index - 1],
                                titleColor: Colors.black,
                                hasCheckBox: true,
                                options: widget.sizeTitles[
                                    widget.sizeTitles.keys.elementAt(
                                        widget.sizeTitles.length - index - 1)],
                                mediaQuery: MediaQuery.of(context),
                                closeOtherDropDowns: (bool newIsShow) =>
                                    setState(() {
                                  _selectedForExpanded = newIsShow ? index : -1;
                                  for (int _indexOfShowing = 0;
                                      _indexOfShowing < isShowDropDown.length;
                                      _indexOfShowing++) {
                                    if (newIsShow && index == _indexOfShowing)
                                      isShowDropDown[_indexOfShowing] = true;
                                    else {
                                      isShowDropDown[_indexOfShowing] = false;
                                      expandController[_indexOfShowing]
                                          .reverse();
                                    }
                                  }
                                  expandedListener();
                                }),
                                isShowDropDown: isShowDropDown[index],
                                initialCheckBoxValue:
                                    // widget.sizeValue[widget.sizeTitles.length - index - 1],
                                    tempSizesValue[
                                        widget.sizeTitles.length - index - 1],
                                selected:
                                    (String newHint, List<String> _newActived) {
                                  // _hints[widget.sizeTitles.length - index - 1] = "";
                                  //
                                  print(
                                      "changeeeeeeeeeee : _newActived : $_newActived");
                                  print(
                                      "changeeeeeeeeeee : newHint : $newHint");
                                  print("_hints : $_hints");

                                  //
                                  // if (_hints[widget.sizeTitles.length - index - 1] == null ||
                                  //     _hints[widget.sizeTitles.length - index - 1] == "")
                                  //   _hints[widget.sizeTitles.length - index - 1] =
                                  //       _hints[widget.sizeTitles.length - index - 1] + newHint;
                                  // else {
                                  //   _newActived.forEach((element) {
                                  //     if (!_hints[widget.sizeTitles.length - index - 1]
                                  //         .contains(element))
                                  //       _hints[widget.sizeTitles.length - index - 1] =
                                  //           _hints[widget.sizeTitles.length - index - 1] +
                                  //               "، " +
                                  //               newHint;
                                  //   });
                                  List<String> newHintList = [];
                                  for (int subIndex =
                                          widget.sizeTitles.length - 1;
                                      subIndex > index;
                                      subIndex--) {
                                    print(
                                        "$subIndex.............. : subIndex : $subIndex");
                                    print(
                                        "$subIndex.............. : _hints[$subIndex] : ${_hints[subIndex]}");
                                    // newHintList.add(_hints[subIndex]);
                                    newHintList.add(_hints[
                                        widget.sizeTitles.length -
                                            subIndex -
                                            1]);
                                  }

                                  newHintList.add(newHint);
                                  for (int subIndex = index - 1;
                                      subIndex >= 0;
                                      subIndex--) {
                                    print(
                                        "$subIndex.............. : subIndex : $subIndex");
                                    print(
                                        "$subIndex.............. : _hints[$subIndex] : ${_hints[subIndex]}");
                                    // newHintList.add(_hints[subIndex]);
                                    newHintList.add(_hints[
                                        widget.sizeTitles.length -
                                            subIndex -
                                            1]);
                                  }
                                  setState(() {
                                    _hints = newHintList;
                                  });
                                },
                                expandController: expandController[index],
                                animation: animation[index],
                              ),
                              // Positioned(
                              //   top: 47,
                              //   right: 40,
                              //   child: Text(
                              //       _hints[widget.sizeTitles.length - index - 1]),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          // widget.indexInOptionWidgets <= 0
          //     ? SizedBox()
          //     :

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
              title: 'اعمال فیلتر',
              height: 0.07 * _screenSize.height, //45,
              width: _screenSize.width,
              fontSize: 0.05 * _screenSize.width, //18,
              radius: 0.011 * _screenSize.width, //4,
              onTap: () {
                widget.updateSizesValue(tempSizesValue);
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
}
