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

class SearchAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String preTitle;
  final String title;
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
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SearchAppBarWidgetState();
}

class _SearchAppBarWidgetState extends State<SearchAppBarWidget> {
  double heightBar = 40;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightBar,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.grey[300],
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
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    child: Text(
                      widget.preTitle ?? "branch_screen.search_in".tr(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'IRANSansLight',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: MAIN_BLUE_COLOR, fontFamily: 'IRANSansBold'),
                    ),
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
