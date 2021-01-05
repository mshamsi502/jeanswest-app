// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
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
            Container(
              height: 0.31 * _screenSize.height, //200,
              width: _screenSize.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage(widget.headerAsset),
                ),
              ),
            ),
            SizedBox(height: 0.015 * _screenSize.height //10
                ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: questionStrings.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ConfigurableExpansionTile(
                      headerExpanded: Expanded(
                        child: Text(
                          questionStrings[index],
                          style: TextStyle(
                              fontSize: 0.036 * _screenSize.width // 13
                              ),
                        ),
                      ),
                      header: Expanded(
                        child: Text(
                          questionStrings[index],
                          style: TextStyle(
                              fontSize: 0.036 * _screenSize.width // 13
                              ),
                        ),
                      ),
                      animatedWidgetFollowingHeader: Icon(
                        Icons.expand_more,
                        color: Colors.grey[600],
                        size: 0.039 * _screenSize.height, //25,
                      ),
                      children: <Widget>[
                        SizedBox(
                          height: 0.0078 * _screenSize.height, //5
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.018 * _screenSize.height //12
                              ),
                          alignment: Alignment.centerRight,
                          child: Text(
                            answerStrings[index],
                            style: TextStyle(
                                fontSize: 0.027 * _screenSize.width, //10,
                                color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 0.015 * _screenSize.height //10
                            ),
                      ],
                    ),
                    SizedBox(
                      height: 0.0078 * _screenSize.height, //5
                    ),
                    Divider(
                      endIndent: 5,
                      thickness: 0.0016 * _screenSize.height, //1
                    ),
                    SizedBox(
                      height: 0.0078 * _screenSize.height, //5
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
