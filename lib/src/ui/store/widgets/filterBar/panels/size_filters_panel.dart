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

class _SizeFiltersPanelState extends State<SizeFiltersPanel> {
  ScrollController scrollController = new ScrollController();
  ScrollController labelScrollController = new ScrollController();
  //
  List<Map<String, bool>> tempSizesValue = [];
  List<Widget> dropDownItems = [];
  int tempIndexInOptionWidgets;
  // List<List<String>> activedTitles;
  List<String> _hints;
  //
  @override
  void initState() {
    _hints = [];
    widget.sizeTitles.forEach((key, value) {
      _hints.add("");
    });
    initializeValues();

    super.initState();
  }

  initializeValues() {
    setState(() {
      tempIndexInOptionWidgets = widget.indexInOptionWidgets;
      tempSizesValue = widget.sizeValue;

      createDropDownsSizes(widget.mediaQuery);
    });
  }
  // !

  createDropDownsSizes(MediaQueryData mediaQuery) {
    List<Widget> tempDropDownItems = [];
    print("drop downs recreate");

    for (int index = 0; index < widget.sizeTitles.length; index++) {
      tempDropDownItems.add(
        Positioned(
          top: (((0.15625 * widget.mediaQuery.size.height //100,

                  ) *
                  (widget.sizeTitles.length - index - 1))
              .toDouble()),
          child: CustomDropdownButtonWidget(
            title: widget.sizeTitles.keys
                .elementAt(widget.sizeTitles.length - index - 1),
            hintTitle: _hints[widget.sizeTitles.length - index - 1],
            titleColor: Colors.black,
            hasCheckBox: true,
            options: widget.sizeTitles[widget.sizeTitles.keys
                .elementAt(widget.sizeTitles.length - index - 1)],
            mediaQuery: mediaQuery,
            initialCheckBoxValue:
                // widget.sizeValue[widget.sizeTitles.length - index - 1],
                tempSizesValue[widget.sizeTitles.length - index - 1],
            selected: (String newHint, List<String> _newActived) {
              setState(() {
                List<String> newHintList = [];
                for (int subIndex = widget.sizeTitles.length - 1;
                    subIndex > index;
                    subIndex--) {
                  newHintList
                      .add(_hints[widget.sizeTitles.length - subIndex - 1]);
                }

                newHintList.add(newHint);
                for (int subIndex = index - 1; subIndex >= 0; subIndex--) {
                  newHintList
                      .add(_hints[widget.sizeTitles.length - subIndex - 1]);
                }
                print("changeeeeeeeeeee : newHintList : $newHintList");
                _hints = newHintList;
              });
              print(
                  "_hints[${widget.sizeTitles.length - index - 1}] : ${_hints[widget.sizeTitles.length - index - 1]}");

              // initializeValues();
            },
          ),
        ),
      );
    }
    setState(() {
      dropDownItems = tempDropDownItems;
    });
    // return tempDropDownItems;
  }

  // List<Widget>
  updateDropDownsSizes(
    MediaQueryData mediaQuery,
    List<String> _hint,
    List<Widget> tempDropDownItems,
    int index,
  ) {
    // List<Widget> _newTempDropDownItems = [];
    List<Widget> _newTempDropDownItems = tempDropDownItems;

    _newTempDropDownItems[index] = Positioned(
      top: (((0.15625 * widget.mediaQuery.size.height //100,

              ) *
              (widget.sizeTitles.length - index - 1))
          .toDouble()),
      child: CustomDropdownButtonWidget(
        title: widget.sizeTitles.keys
            .elementAt(widget.sizeTitles.length - index - 1),
        hintTitle: _hints[widget.sizeTitles.length - index - 1],
        titleColor: Colors.black,
        hasCheckBox: true,
        options: widget.sizeTitles[widget.sizeTitles.keys
            .elementAt(widget.sizeTitles.length - index - 1)],
        mediaQuery: mediaQuery,
        initialCheckBoxValue:
            // widget.sizeValue[widget.sizeTitles.length - index - 1],
            tempSizesValue[widget.sizeTitles.length - index - 1],
        selected: (String newHint, List<String> _newActived) {
          print("_newActived in update: $_newActived");
          print("newHint in update: $newHint");
          print(
              "oldHint in update: ${_hints[widget.sizeTitles.length - index - 1]}");
          setState(() {
            _hints[widget.sizeTitles.length - index - 1] = newHint;

            // tempDropDownItems =
            updateDropDownsSizes(mediaQuery, _hint, tempDropDownItems, index);
          });
          print(
              "update ++++_hints[${widget.sizeTitles.length - index - 1}] : ${_hints[widget.sizeTitles.length - index - 1]}");

          // initializeValues();
        },
      ),
    );
    setState(() {
      dropDownItems = _newTempDropDownItems;
    });
    // return _newTempDropDownItems;
  }

  // !

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    print("5555555555555555555555555555555 : tempSizesValue : $tempSizesValue");

    return Column(
      children: [
        Expanded(
          child: Container(
            height: _screenSize.height,
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Stack(
              // children: dropDownItems,
              children:
                  List<Widget>.generate(widget.sizeTitles.length, (index) {
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
                          title: widget.sizeTitles.keys
                              .elementAt(widget.sizeTitles.length - index - 1),
                          hintTitle:
                              _hints[widget.sizeTitles.length - index - 1],
                          titleColor: Colors.black,
                          hasCheckBox: true,
                          options: widget.sizeTitles[widget.sizeTitles.keys
                              .elementAt(widget.sizeTitles.length - index - 1)],
                          mediaQuery: MediaQuery.of(context),
                          initialCheckBoxValue:
                              // widget.sizeValue[widget.sizeTitles.length - index - 1],
                              tempSizesValue[
                                  widget.sizeTitles.length - index - 1],
                          selected: (String newHint, List<String> _newActived) {
                            // _hints[widget.sizeTitles.length - index - 1] = "";
                            //
                            print(
                                "changeeeeeeeeeee : _newActived : $_newActived");
                            print("changeeeeeeeeeee : newHint : $newHint");
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
                            for (int subIndex = widget.sizeTitles.length - 1;
                                subIndex > index;
                                subIndex--) {
                              print(
                                  "$subIndex.............. : subIndex : $subIndex");
                              print(
                                  "$subIndex.............. : _hints[$subIndex] : ${_hints[subIndex]}");
                              // newHintList.add(_hints[subIndex]);
                              newHintList.add(_hints[
                                  widget.sizeTitles.length - subIndex - 1]);
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
                                  widget.sizeTitles.length - subIndex - 1]);
                            }
                            print(
                                "changeeeeeeeeeee : newHintList : $newHintList");
                            setState(() {
                              _hints = newHintList;
                            });
                            print(
                                "_hints[${widget.sizeTitles.length - index - 1}] : ${_hints[widget.sizeTitles.length - index - 1]}");

                            // initializeValues();
                          },
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
              widget.updateSizesValue(tempSizesValue);
            },
          ),
        ),
        SizedBox(
          height: 0.1328 * _screenSize.height, //85,
        ),
      ],
    );
  }
}
