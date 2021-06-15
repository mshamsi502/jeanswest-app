// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/api_response/category/list-of-category.dart';

class SubFiltersPanel extends StatefulWidget {
  final bool haveGroupTitle;
  final String groupTitle;

  const SubFiltersPanel({
    Key key,
    @required this.groupTitle,
    @required this.haveGroupTitle,
  }) : super(key: key);
  @override
  _SubFiltersPanelState createState() => _SubFiltersPanelState();
}

class _SubFiltersPanelState extends State<SubFiltersPanel> {
  ScrollController scrollController = new ScrollController();

  //

  List<bool> genderCheckBoxValue = [];
  //

  int selectedGroup = -1;
  //
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
      color: Colors.white,
      child: Column(
        children: [
          widget.haveGroupTitle
              ? Row(
                  children: [Text("انتخاب همه ${widget.groupTitle}ها")],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
