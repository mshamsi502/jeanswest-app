// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';

class MembershipCardWidget extends StatefulWidget {
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final LevelCard preLevel;
  final int moneyBuying;

  const MembershipCardWidget({
    Key key,
    this.userLevel,
    this.moneyBuying,
    this.nextLevel,
    this.preLevel,
  }) : super(key: key);

  State<StatefulWidget> createState() => _MembershipCardWidgetState();
}

class _MembershipCardWidgetState extends State<MembershipCardWidget> {
  List<int> index = [];
  @override
  void initState() {
    for (var i = 0; i < assetsLevelCard.length; i++) index.add(i);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 0.33 * _screenSize.width, // 120
          viewportFraction: 0.5,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: index.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                alignment: Alignment.topCenter,
                height: 0.33 * _screenSize.width, // 120
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: new AssetImage(assetsLevelCard.elementAt(i)),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
