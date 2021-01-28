// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

class RealSearchAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final FocusNode inputNode;
  final Function(bool, BuildContext) changeListPanelState;
  final Function(String) changeTextFieldSearch;
  final TextEditingController textEditingController;
  @override
  Size get preferredSize => const Size.fromHeight(60);

  const RealSearchAppBarWidget(
      {Key key,
      this.title,
      this.inputNode,
      this.changeListPanelState,
      this.changeTextFieldSearch,
      this.textEditingController})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _RealSearchAppBarWidgetState();
}

class _RealSearchAppBarWidgetState extends State<RealSearchAppBarWidget> {
  double heightBar = 40;
  @override
  void initState() {
    widget.textEditingController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
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
                padding: EdgeInsets.all(10),
                height: heightBar,
                width: heightBar,
                child: context.locale.toString() == 'en_US'
                    ? GlobalSvgImages.leftIcon
                    : GlobalSvgImages.rightIcon,
              ),
              onTap: () {
                widget.textEditingController.clear();
                widget.changeTextFieldSearch('');
                widget.changeListPanelState(false, context);
              },
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                focusNode: widget.inputNode,
                controller: widget.textEditingController,
                onChanged: (value) {
                  widget.changeTextFieldSearch(value);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '${"search_in_list_hint".tr()} ${widget.title}',
                  hintStyle:
                      TextStyle(fontFamily: 'IRANSansLight', fontSize: 14),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10),
                height: heightBar,
                width: heightBar,
                child: GlobalSvgImages.clearTextFieldIcon,
              ),
              onTap: () {
                widget.changeTextFieldSearch('');
                widget.textEditingController.clear();
              },
            ),
          ],
        ),
      ),
      // ),
    );
  }

  Future<bool> _onWillPop() async {
    widget.changeTextFieldSearch('');
    widget.textEditingController.clear();
    widget.changeListPanelState(false, context);
    return false;
  }
}
