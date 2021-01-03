// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/test_data/texts.dart';

class QuestionsWidget extends StatefulWidget {
  final String headerAsset;

  const QuestionsWidget({Key key, this.headerAsset}) : super(key: key);
  State<StatefulWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 200,
              width: _screenSize.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage(widget.headerAsset),
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: questionStrings.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ExpansionTile(
                  expandedAlignment: Alignment.centerRight,
                  title: Text(
                    questionStrings[index],
                    style: TextStyle(fontSize: 13),
                  ),
                  children: <Widget>[
                    Text(
                      answerStrings[index],
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
