//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';

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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 120,
          // aspectRatio: 16 / 9,
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
                height: 120,
                decoration: BoxDecoration(
                  // color: Colors.red,
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
