//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

class SearchAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function(bool) changeBranchListPanelState;
  @override
  Size get preferredSize => const Size.fromHeight(60);

  const SearchAppBarWidget(
      {Key key, this.title, this.changeBranchListPanelState})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _SearchAppBarWidgetState();
}

class _SearchAppBarWidgetState extends State<SearchAppBarWidget> {
  double heightBar = 40;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // open Branch-List-Widget Panel
        widget.changeBranchListPanelState(true);
      },
      child: Container(
        height: heightBar,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.grey[300],
        ),
        margin: EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                widget.title,
                style: TextStyle(
                    color: MAIN_BLUE_COLOR, fontFamily: 'IRANSansBold'),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: GlobalSvgImages.searchIcon,
                ),
                Container(
                  child: Text(
                    "branch_screen.search_in".tr(),
                    style: TextStyle(
                        color: Colors.grey, fontFamily: 'IRANSansLight'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
