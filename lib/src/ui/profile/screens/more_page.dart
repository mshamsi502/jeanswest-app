// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/profile/constants.dart';

import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/menu_list_view_widget.dart';

class MorePage extends StatefulWidget {
  final String title;
  final List<Widget> pages;

  const MorePage({
    Key key,
    this.title,
    this.pages,
  }) : super(key: key);
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                AppBarWithBackWidget(
                  title: widget.title,
                  onTap: () => Navigator.pop(context),
                ),
                SizedBox(height: 20),
                MenuListViewWidget(
                  titles: moreListTitles,
                  icons: moreListIcons,
                  pages: widget.pages,
                  haveExit: false,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
