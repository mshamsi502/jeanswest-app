// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

class SortBarWidget extends StatefulWidget {
  final String title;
  final bool isGridView;
  final Function() openSortPanel;
  final Function(bool) changeView;

  const SortBarWidget({
    Key key,
    @required this.title,
    @required this.isGridView,
    @required this.openSortPanel,
    @required this.changeView,
  }) : super(key: key);
  @override
  _SortBarWidgetState createState() => _SortBarWidgetState();
}

class _SortBarWidgetState extends State<SortBarWidget> {
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = new ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      // height: 40,
      width: _screenSize.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0.5,
            color: Colors.grey[200],
          ),
        ],
        color: Colors.white,
        // color: Colors.red,
      ),
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () => widget.openSortPanel(),
          child: Container(
              height: 32,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: MAIN_BLUE_COLOR),
              ),
              child: Row(children: [
                Icon(
                  Icons.sort_rounded,
                  size: 25,
                  color: MAIN_BLUE_COLOR,
                ),
                SizedBox(width: 5),
                Text(widget.title,
                    style: TextStyle(fontSize: 14, color: MAIN_BLUE_COLOR)),
              ])),
        ),
        GestureDetector(
            onTap: () => widget.changeView(!widget.isGridView),
            child: Icon(
              widget.isGridView
                  ? Icons.view_module_rounded
                  : Icons.view_day_outlined,
              size: 32,
              color: MAIN_BLUE_COLOR,
            )),
      ]),
    );
  }
}
