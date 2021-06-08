// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/single-level-card.dart';

class LevelCardsInfoWidget extends StatefulWidget {
  final SingleLevelCard userLevel;
  // final LevelCard userLevel;
  final int moneyBuying;
  final List<SingleLevelCard> cardsInfo;

  const LevelCardsInfoWidget({
    Key key,
    this.userLevel,
    this.moneyBuying,
    this.cardsInfo,
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
    print('widget.moneyBuying ${widget.moneyBuying}');
    return Container(
      // color: Colors.white,
      child: ListView.builder(
        itemCount: widget.cardsInfo.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int levelIndex) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 0.0078 * _screenSize.height //5,
                  ),
              Container(
                height: 0.078125 * _screenSize.height, //50,
                // color: Colors.red,
                padding: EdgeInsets.symmetric(
                  horizontal: 0.054 * _screenSize.width, //20
                ),
                width: _screenSize.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Divider(
                      height: 0.001689 * _screenSize.height, //1,
                      thickness: 0.001689 * _screenSize.height, //1,
                      color: levelColors[levelIndex],
                    ),
                    Container(
                      height: 0.05468 * _screenSize.height, //35,
                      width: 0.3055 * _screenSize.width, //110,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          0.00555 * _screenSize.width, //2,
                        ),
                        border: Border.all(color: levelColors[levelIndex]),
                        color: Colors.white,
                      ),
                      // TODO
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سطح ',
                            style: TextStyle(
                              fontSize: 0.038 * _screenSize.width, //14,
                            ),
                          ),
                          Text(
                            widget.cardsInfo[levelIndex].engTitle,
                            textDirection: ltrTextDirection,
                            style: TextStyle(
                              fontSize: 0.038 * _screenSize.width, //14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 0.07777 * _screenSize.width, //28
                        width: 0.07777 * _screenSize.width, //28
                        padding: EdgeInsets.all(
                          0.00555 * _screenSize.width, //2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            0.138 * _screenSize.width, //50,
                          ),
                          border: Border.all(color: levelColors[levelIndex]),
                          color: Colors.white,
                        ),
                        child: Text(
                          '${widget.cardsInfo[levelIndex].percent}%',
                          style: TextStyle(
                            fontSize: 0.0333 * _screenSize.width, //12,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Container(
                          height: 0.07777 * _screenSize.width, //28
                          width: 0.07777 * _screenSize.width, //28
                          padding: EdgeInsets.all(
                            0.00555 * _screenSize.width, //2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              0.138 * _screenSize.width, //50,
                            ),
                            border: Border.all(color: levelColors[levelIndex]),
                            color: Colors.white,
                          ),
                          child: Icon(
                            (widget.moneyBuying >=
                                    widget.cardsInfo[levelIndex].minPay)
                                ? Icons.lock_open
                                : Icons.lock,
                            size: 0.05 * _screenSize.width, //18,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.0078 * _screenSize.height //5,
                  ),
              Column(
                children: [
                  ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.083 * _screenSize.width, //30
                      ),
                      itemCount: widget.cardsInfo[levelIndex].subTitles.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int condIndex) {
                        return Column(
                          children: [
                            widget.cardsInfo[levelIndex]
                                            .descriptions[condIndex] ==
                                        null ||
                                    widget.cardsInfo[levelIndex]
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
                                          height:
                                              0.0194 * _screenSize.width, //7,
                                          width:
                                              0.0194 * _screenSize.width, //7,
                                          margin: EdgeInsets.all(
                                              0.022 * _screenSize.width //8,

                                              ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              0.138 * _screenSize.width, //50,
                                            ),
                                            color: levelColors[levelIndex],
                                          ),
                                        ),
                                        // SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            widget.cardsInfo[levelIndex]
                                                .descriptions[condIndex],
                                            style: TextStyle(
                                              fontSize: 0.038 *
                                                  _screenSize.width, //14,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 0.003125 * _screenSize.height, //2,
                            ),
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
