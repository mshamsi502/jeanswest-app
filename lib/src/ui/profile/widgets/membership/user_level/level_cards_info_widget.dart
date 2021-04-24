// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';

class LevelCardsInfoWidget extends StatefulWidget {
  final LevelCard userLevel;
  final int moneyBuying;

  const LevelCardsInfoWidget({
    Key key,
    this.userLevel,
    this.moneyBuying,
  }) : super(key: key);

  State<StatefulWidget> createState() => _LevelCardsInfoWidgetState();
}

class _LevelCardsInfoWidgetState extends State<LevelCardsInfoWidget> {
  List<Color> levelColors = [
    COLOMBIA_BLUE,
    MAYA_BLUE,
    LOCHMARA_BLUE,
    DARK_GREY,
    MAIN_GOLD_COLOR,
  ];

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      // color: Colors.white,
      child: ListView.builder(
        itemCount: levels.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int levelIndex) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 5),
              Container(
                height: 50,
                // color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: _screenSize.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: levelColors[levelIndex],
                    ),
                    Container(
                      height: 35,
                      width: 110,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: levelColors[levelIndex]),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سطح ',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            levels[levelIndex].title,
                            textDirection: ltrTextDirection,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 28,
                        width: 28,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: levelColors[levelIndex]),
                          color: Colors.white,
                        ),
                        child: Text(
                          '${levels[levelIndex].percent}%',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Container(
                          height: 28,
                          width: 28,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: levelColors[levelIndex]),
                            color: Colors.white,
                          ),
                          child: Icon(
                            (widget.moneyBuying >=
                                    int.parse(levels[levelIndex].maxPay))
                                ? Icons.lock_open
                                : Icons.lock,
                            size: 18,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Column(
                children: [
                  ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      itemCount: levels[levelIndex].subtitles.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int condIndex) {
                        return Column(
                          children: [
                            levels[levelIndex].descriptions[condIndex] ==
                                        null ||
                                    levels[levelIndex]
                                            .descriptions[condIndex] ==
                                        ''
                                ? SizedBox()
                                : Container(
                                    // color: Colors.green,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 7,
                                          width: 7,
                                          margin: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: levelColors[levelIndex],
                                          ),
                                        ),
                                        // SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            levels[levelIndex]
                                                .descriptions[condIndex],
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                            SizedBox(height: 2),
                          ],
                        );
                      })
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
