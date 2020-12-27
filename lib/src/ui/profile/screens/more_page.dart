// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/profile/constants.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/menu_list_view_widget.dart';

class MorePage extends StatefulWidget {
  final String title;

  const MorePage({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

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
                AppBarWithBackWidget(title: widget.title),
                SizedBox(height: 20),
                MenuListViewWidget(
                  titles: moreListTitles,
                  icons: moreListIcons,
                  widgets: moreListWidgets,
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
