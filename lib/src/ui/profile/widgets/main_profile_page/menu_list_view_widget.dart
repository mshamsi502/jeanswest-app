//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MenuListViewWidget extends StatefulWidget {
  final List<String> titles;
  final List<Widget> icons;
  final List<Widget> widgets;
  final Color backgroundColor;
  const MenuListViewWidget({
    Key key,
    this.titles,
    this.icons,
    this.widgets,
    this.backgroundColor,
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
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: widget.titles.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              color: widget.backgroundColor,
              // color: Colors.blue,
              height: 60,
              child: ListTile(
                title: Align(
                  alignment: context.locale.toString() == 'en_US'
                      ? Alignment(-1.15, -0.2)
                      : Alignment(1.15, -0.3),
                  child: Container(
                    width: 170,
                    // color: Colors.red,
                    child: Text(
                      widget.titles[index],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color:
                            index == 6 ? Color(0xffF51F1F) : Color(0xff323B56),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.grey[400],
                ),
                leading: Container(
                  height: 25,
                  width: 25,
                  child: widget.icons[index],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => widget.widgets[index],
                    ),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.3,
              indent: 60,
              height: 2,
            ),
            // SizedBox(
            //   height: index == widget.titles.length - 1 ? 20 : 0,
            // ),
          ],
        );
      },
    );
  }
}
