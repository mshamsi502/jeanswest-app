// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/utils/helper/search/helper_search.dart';

class SearchAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String preTitle;
  final String title;
  final TextStyle titleStyle;
  final bool titleIsCenter;
  final bool textFielIsActive;
  final Function(String) onChangeSearchField;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Widget icon;
  final Function() onTapIcon;
  final Function(bool, BuildContext) openRealSearchPanel;
  @override
  Size get preferredSize => const Size.fromHeight(60);

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
    // this.titleColor = MAIN_BLUE_COLOR,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SearchAppBarWidgetState();
}

class _SearchAppBarWidgetState extends State<SearchAppBarWidget> {
  double heightBar = 40;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: heightBar,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: F2_BACKGROUND_COLOR,
      ),
      margin: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
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
                  ? TextField(
                      // enabled: widget.isEnable,
                      // keyboardType: TextInputType,
                      // style: TextStyle(
                      //   color: widget.textColor,
                      //   fontSize: 0.0388 * widget.mediaQuery.size.width, // 14,
                      // ),
                      // maxLines: widget.lines ?? 1,
                      focusNode: widget.focusNode,
                      controller: widget.textEditingController,
                      cursorColor: MAIN_BLUE_COLOR,
                      showCursor: true,
                      onChanged: widget.onChangeSearchField,
                      decoration: InputDecoration(
                        hintText: widget.preTitle + widget.title ?? '',
                        hintStyle: widget.titleStyle,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0.015 * _screenSize.height, // 10,
                          horizontal: 0.055 * _screenSize.width, // 20,
                        ),
                        border: InputBorder.none,
                      ),
                    )
                  : Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.preTitle ?? "branch_screen.search_in".tr(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'IRANSansLight',
                              ),
                            ),
                            widget.titleIsCenter
                                ? SizedBox()
                                : Text(widget.title, style: widget.titleStyle),
                          ],
                        ),
                        widget.titleIsCenter
                            ? Center(
                                child: Text(widget.title,
                                    style: widget.titleStyle),
                              )
                            : SizedBox(),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
