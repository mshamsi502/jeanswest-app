// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

import 'package:jeanswest/src/models/dropDown/drop-list-model.dart';
import 'package:jeanswest/src/ui/global/widgets/dropDown/select_drop_list.dart';

class CustomDropdownButtonWidget extends StatefulWidget {
  final String title;
  final String hintTitle;
  final Color titleColor;
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
    this.titleColor = MAIN_BLUE_COLOR,
  }) : super(key: key);
  State<StatefulWidget> createState() => _CustomDropdownButtonWidgetState();
}

class _CustomDropdownButtonWidgetState
    extends State<CustomDropdownButtonWidget> {
  double heightTextField;
  double heightTitle;
  String dropdownValue;
  bool isShowDropDown;
  // List<DropdownMenuItem<String>> _dropdownMenuItems;
  double widthDropdown;

//

  DropListModel dropListModel = DropListModel([]);
  OptionItem optionItemSelected;
  @override
  void initState() {
    isShowDropDown = false;
    optionItemSelected = OptionItem(id: null, title: widget.hintTitle);
    for (var index = 0; index < widget.options.length; index++) {
      dropListModel.listOptionItems
          .add(OptionItem(id: "$index", title: widget.options[index]));
    }

    dropdownValue = widget.hintTitle ?? 'انتخاب کنید ...';
    heightTextField = 0.03125 * widget.mediaQuery.size.height; // 20;
    heightTitle = 0.1 * widget.mediaQuery.size.height; // 60;

    widthDropdown = widget.mediaQuery.size.width;
    // _dropdownMenuItems = buildDropdownMenuItems(
    //   widget.options,
    //   widthDropdown,
    //   widget.mediaQuery.size,
    // );
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      height: heightTextField +
          heightTitle + //
          (isShowDropDown
              ? (0.0844594 *
                  _screenSize.height //50,
                  *
                  widget.options.length)
              : 0.008 * _screenSize.height //5 // !
          ),
      width: widget.mediaQuery.size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: heightTitle - 0.054 * widget.mediaQuery.size.height, //30
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * widget.mediaQuery.size.width, //10,
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 0.038 * widget.mediaQuery.size.width, // 14,
                color: widget.titleColor,
              ),
            ),
          ),
          SizedBox(
            height: 0.0078 * widget.mediaQuery.size.height, //5
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  0.0078 * widget.mediaQuery.size.height, //5
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: SelectDropList(
                            selectedIcon: SizedBox(),
                            itemSelected: optionItemSelected,
                            dropListModel: dropListModel,
                            onOptionSelected: (optionItem) {
                              setState(() {
                                optionItemSelected = optionItem;
                              });
                              widget.selected(optionItem.title);
                            },
                            changeIsShow: (bool newIsShow) async {
                              if (newIsShow) {
                                setState(() {
                                  isShowDropDown = newIsShow;
                                });
                              }
                              await Future.delayed(Duration(milliseconds: 500));
                              if (!newIsShow) {
                                setState(() {
                                  isShowDropDown = newIsShow;
                                });
                              }
                              setState(() {
                                isShowDropDown = newIsShow;
                              });
                            })),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
