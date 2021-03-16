// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MenuListViewWidget extends StatefulWidget {
  final List<String> titles;
  final List<Widget> icons;
  final List<Widget> pages;
  final Color backgroundColor;
  final bool haveExit;

  const MenuListViewWidget({
    Key key,
    this.titles,
    this.icons,
    this.backgroundColor,
    this.pages,
    this.haveExit,
  }) : super(key: key);

  State<StatefulWidget> createState() => _MenuListViewWidgetState();
}

class _MenuListViewWidgetState extends State<MenuListViewWidget> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: widget.titles.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () async {
                widget.haveExit && index == widget.titles.length - 1
                    ? print('exiting')
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => widget.pages[index]),
                      );
              },
              child: Container(
                color: widget.backgroundColor,
                // color: Colors.blue,
                height: 0.166 * _screenSize.width, //60,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Container(
                      // color: Colors.red,
                      height: 0.069 * _screenSize.width, //25,
                      width: 0.069 * _screenSize.width, //25,
                      child: widget.icons[index],
                    ),
                    Expanded(flex: 2, child: SizedBox()),
                    Container(
                      width: 0.472 * _screenSize.width, //170,
                      child: Text(
                        widget.titles[index],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: index == 6
                              ? Color(0xffF51F1F)
                              : Color(0xff323B56),
                          fontSize: 0.036 * _screenSize.width, //13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(flex: 10, child: SizedBox()),
                    Container(
                      width: 0.041 * _screenSize.width,
                      // color: Colors.greenAccent,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 0.041 * _screenSize.width, //15,
                        color: Colors.grey[400],
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.001 * _screenSize.width, //0.3,
              indent: 0.166 * _screenSize.width, //60,,
              height: 2,
            ),
          ],
        );
      },
    );
  }
}
