// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

class SearchAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @required
  final String preTitle;
  @required
  final String title;
  final TextStyle titleStyle;
  final bool titleIsCenter;
  @required
  final bool textFielIsActive;
  @required
  final Function(String) onChangeSearchField;
  @required
  final TextEditingController textEditingController;
  @required
  final FocusNode focusNode;
  @required
  final Widget icon;
  @required
  final Function() onTapIcon;
  @required
  final Size screenSize;
  @required
  final Function(bool, BuildContext) openRealSearchPanel;

  final bool haveClearText;
  @override
  Size get preferredSize => Size.fromHeight(0.093 * screenSize.height //60
      );

  const SearchAppBarWidget({
    Key key,
    this.title,
    this.openRealSearchPanel,
    this.icon,
    this.onTapIcon,
    this.preTitle,
    this.titleStyle = const TextStyle(
      color: MAIN_BLUE_COLOR,
      fontFamily: 'IRANSansBold',
    ),
    this.titleIsCenter = true,
    this.textFielIsActive,
    this.textEditingController,
    this.focusNode,
    this.onChangeSearchField,
    this.screenSize,
    this.haveClearText = false,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SearchAppBarWidgetState();
}

class _SearchAppBarWidgetState extends State<SearchAppBarWidget> {
  double heightBar; //40

  @override
  void initState() {
    heightBar = 0.0625 * widget.screenSize.height; //40

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: heightBar,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          0.0083 * _screenSize.width, //3,
        ),
        color: F2_BACKGROUND_COLOR,
      ),
      margin: EdgeInsets.all(0.022 * _screenSize.width //8,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 0.05 * _screenSize.width, //18,
              ),
              child: widget.icon,
            ),
            onTap: () => widget.onTapIcon(),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // open Branch-List-Widget Panel
                widget.openRealSearchPanel(true, context);
              },
              child: widget.textFielIsActive
                  ? Container(
                      // color: Colors.red,
                      child: TextField(
                        // enabled: widget.isEnable,
                        // keyboardType: TextInputType,
                        // style: TextStyle(
                        //   color: widget.textColor,
                        //   fontSize: 0.0388 * widget.mediaQuery.size.width, // 14,
                        // ),
                        // maxLines: widget.lines ?? 1,
                        focusNode: widget.focusNode,
                        controller: widget.textEditingController,
                        textAlign: TextAlign.right,
                        textInputAction: TextInputAction.search,
                        cursorColor: MAIN_BLUE_COLOR,
                        showCursor: true,
                        // onChanged: widget.onChangeSearchField,
                        onSubmitted: (String value) {
                          print("cccddddddddddddddddddddddddddd");
                          widget.onChangeSearchField(value);
                        },
                        decoration: InputDecoration(
                          hintText: widget.preTitle + widget.title ?? '',
                          hintStyle: widget.titleStyle,
                          contentPadding: EdgeInsets.all(
                            0.015 * _screenSize.height, // 10,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  : Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          height: heightBar,
                          // color: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.preTitle ??
                                    "branch_screen.search_in".tr(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'IRANSansLight',
                                  fontSize: widget.titleStyle.fontSize,
                                  fontWeight: widget.titleStyle.fontWeight,
                                ),
                              ),
                              widget.titleIsCenter
                                  ? SizedBox()
                                  : Expanded(
                                      child: Text(
                                        widget.title,
                                        style: widget.titleStyle,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        widget.titleIsCenter
                            ? Center(
                                child: Text(
                                  widget.title,
                                  style: widget.titleStyle,
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
            ),
          ),
          widget.textEditingController != null &&
                  widget.textEditingController.text != null &&
                  widget.textEditingController.text != ""
              ? GestureDetector(
                  onTap: () {
                    widget.textEditingController.clear();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    // color: Colors.red,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.3,
                            spreadRadius: 0.7,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        'assets/images/svg_images/global/new/fi-rr-cross.svg',
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
