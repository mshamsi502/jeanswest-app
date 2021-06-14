// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MembershipCardWidget extends StatefulWidget {
  final int showingCard;
  final List<String> assetsLevelCard;
  final List<String> imageType;
  final Function(int) changeShowingCard;

  const MembershipCardWidget({
    Key key,
    this.showingCard,
    this.changeShowingCard,
    this.assetsLevelCard,
    this.imageType,
  }) : super(key: key);
  State<StatefulWidget> createState() => _MembershipCardWidgetState();
}

class _MembershipCardWidgetState extends State<MembershipCardWidget> {
  List<int> index = [];
  CarouselController carouselController = new CarouselController();
  // int showingCard;
  @override
  void initState() {
    // showingCard = 0;
    for (var i = 0; i < widget.assetsLevelCard.length; i++) index.add(i);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(
                right: 0.041 * _screenSize.width, //15,
                top: 0.023 * _screenSize.height, //15
              ),
              child: Text(
                'معرفی کارت های عضویت جین وست',
                style: TextStyle(
                  fontSize: 0.038 * _screenSize.width, //14,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 0.016 * _screenSize.height, //10
            ),
            color: Colors.white,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 0.33 * _screenSize.width, // 120
                viewportFraction: 0.45,
                // initialPage: showingCard,
                initialPage: widget.showingCard,
                enableInfiniteScroll: true,
                onPageChanged: (int index, CarouselPageChangedReason reason) {},
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 6),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: index.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        carouselController.jumpToPage(i);
                        widget.changeShowingCard(i);
                      },
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            height: 0.33 * _screenSize.width, // 120
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                0.027 * _screenSize.width, //10,
                              ),
                            ),
                            child: widget.imageType[i] == "svg"
                                ? ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: SvgPicture.network(
                                      widget.assetsLevelCard.elementAt(i),
                                      placeholderBuilder:
                                          (BuildContext context) =>
                                              new Container(
                                        padding: const EdgeInsets.all(30.0),
                                        child: const CircularProgressIndicator(
                                          backgroundColor: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      widget.assetsLevelCard.elementAt(i),
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: widget.showingCard == i
                                ? 0.016 * _screenSize.height //10
                                : 0.008 * _screenSize.height, //5
                            left: widget.showingCard == i
                                ? 0.027 * _screenSize.width //10
                                : 0.054 * _screenSize.width, //20
                            child: Row(
                              children: [
                                Text(
                                  'اطلاعات بیشتر',
                                  style: TextStyle(
                                    color: i == 0 ? Colors.white : Colors.black,
                                    fontSize: 0.027 * _screenSize.width, //10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  size: 0.05 * _screenSize.width, //18,
                                  color: i == 0 ? Colors.white : Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
