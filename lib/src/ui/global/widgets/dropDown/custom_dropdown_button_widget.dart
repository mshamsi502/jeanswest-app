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
  // final Function(String) selected;
  final Function(String, List<String>) selected;
  final bool hasCheckBox;
  final bool isShowDropDown;
  final Function(bool) closeOtherDropDowns;
  final Map<String, bool> initialCheckBoxValue;
  final AnimationController expandController;
  final Animation<double> animation;
  // final Function(Map<String, bool>) updateCheckBoxValue;

  const CustomDropdownButtonWidget({
    Key key,
    @required this.title,
    @required this.options,
    @required this.mediaQuery,
    @required this.selected,
    @required this.hintTitle,
    this.titleColor = MAIN_BLUE_COLOR,
    this.initialCheckBoxValue,
    // this.updateCheckBoxValue,
    this.hasCheckBox = false,
    this.isShowDropDown = false,
    @required this.closeOtherDropDowns,
    @required this.expandController,
    @required this.animation,
  }) : super(key: key);
  State<StatefulWidget> createState() => _CustomDropdownButtonWidgetState();
}

class _CustomDropdownButtonWidgetState
    extends State<CustomDropdownButtonWidget> {
  ScrollController scrollController = new ScrollController();

  double heightTextField;
  double heightTitle;
  String dropdownValue;
  bool _tempIsShowDropDown;
  // List<DropdownMenuItem<String>> _dropdownMenuItems;
  double widthDropdown;

//

  DropListModel dropListModel = DropListModel([]);
  OptionItem optionItemSelected;
  @override
  void initState() {
    _tempIsShowDropDown = widget.isShowDropDown;
    update();
    heightTextField = 0.03125 * widget.mediaQuery.size.height; // 20;
    heightTitle = 0.1 * widget.mediaQuery.size.height; // 60;

    widthDropdown = widget.mediaQuery.size.width;
    // _drop0

    super.initState();
    //
  }

  update() {
    optionItemSelected = OptionItem(id: null, title: widget.hintTitle);

    for (var index = 0; index < widget.options.length; index++) {
      dropListModel.listOptionItems
          .add(OptionItem(id: "$index", title: widget.options[index]));
    }

    dropdownValue = widget.hintTitle ?? 'انتخاب کنید ...';
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _tempIsShowDropDown = widget.isShowDropDown;
    });
    if (widget.hintTitle != null && dropdownValue != widget.hintTitle) update();
    Size _screenSize = MediaQuery.of(context).size;
    print("widget.hintTitle  : ${widget.hintTitle}");
    print("optionItemSelected : ${optionItemSelected.title}");
    print("widget.initialCheckBoxValue : ${widget.initialCheckBoxValue}");
    print("dropListModel : ${dropListModel.listOptionItems.first.title}");
    return Container(
      color: Colors.transparent,
      // color: Colors.red,
      height: heightTextField +
          heightTitle + //
          (_tempIsShowDropDown
              ? 0.24166 * _screenSize.height //145
              : 0.008 * _screenSize.height //5 // !
          ),

      width: widget.mediaQuery.size.width - 0.054 * _screenSize.width, //20

      child: Container(
        height: heightTextField +
            heightTitle + //
            (_tempIsShowDropDown
                ? (0.0844594 *
                    _screenSize.height //50,
                    *
                    widget.options.length)
                : 0.008 * _screenSize.height //5 // !
            ),
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
                          selectedTile:
                              // "",
                              widget.hintTitle,
                          selectedIcon: SizedBox(),
                          isShow: _tempIsShowDropDown,
                          hasCheckBox: widget.hasCheckBox,
                          initialCheckBoxValue: widget.initialCheckBoxValue,
                          updateCheckBoxValue: (Map<String, bool> newValue) {
                            String _hint = "";
                            List<String> _actived = [];
                            bool isFisrt = true;
                            int index = 0;
                            print("33333333333333 newValue : $newValue");
                            newValue.values.forEach((element) {
                              if (element) {
                                _actived.add(newValue.keys.elementAt(index));
                                if (!_hint
                                    .contains(newValue.keys.elementAt(index))) {
                                  _hint = isFisrt
                                      ? _hint +
                                          "" +
                                          newValue.keys.elementAt(index)
                                      : _hint +
                                          "، " +
                                          newValue.keys.elementAt(index);
                                  isFisrt = false;
                                }
                              }
                              index++;
                            });
                            print("33333333333333 _hint : $_hint");
                            print("33333333333333 _actived : $_actived");
                            widget.selected(_hint, _actived);
                            // widget.selected(_hint);
                          },
                          itemSelected: optionItemSelected,
                          dropListModel: dropListModel,
                          optionsHeight: (0.0844594 *
                              _screenSize.height //50,
                              *
                              widget.options.length),
                          onOptionSelected: (optionItem) {
                            setState(() {
                              optionItemSelected = optionItem;
                            });
                            print(
                                "********** ** ** select : $optionItemSelected");
                            widget.selected(optionItem.title, []);
                          },
                          changeIsShow: (bool oldIsShow) async {
                            setState(() {
                              _tempIsShowDropDown = !oldIsShow;
                            });

                            // if (_tempIsShowDropDown) {
                            print(
                                "11111111111111111111111111111111111111111111");
                            widget.closeOtherDropDowns(_tempIsShowDropDown);
                            // }
                          },
                          expandController: widget.expandController,
                          animation: widget.animation,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
