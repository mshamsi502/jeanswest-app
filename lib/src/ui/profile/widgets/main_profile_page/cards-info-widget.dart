// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/single-level-card.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';

class CardsInfoWidget extends StatefulWidget {
  // final List<String> assetsLevelCard;
  final List<SingleLevelCard> levelCards;
  // final List<MainLevelCard> levels;
  final Size screenSize;
  final Function closeCardsInfoPanel;
  final int showingCard;

  final Function(int) changeShowingCard;

  const CardsInfoWidget({
    Key key,
    // this.assetsLevelCard,
    this.closeCardsInfoPanel,
    this.showingCard,
    this.changeShowingCard,
    // this.levels,
    this.screenSize,
    @required this.levelCards,
  }) : super(key: key);

  State<StatefulWidget> createState() => _CardsInfoWidgetState();
}

class _CardsInfoWidgetState extends State<CardsInfoWidget> {
  ScrollController _scrollController;
  ScrollController cardScrollController;
  CarouselController carouselController;

  List<int> index = [];

  // ignore: deprecated_member_use
  List<double> largeHeights = List<double>();
  // ignore: deprecated_member_use
  List<double> largeWidths = List<double>();

  // !
  int someCards;
  int tempShowingCard;
  List<String> mainAssetsLevelCard;
  List<String> mainTitleLevelCard;
  List<String> mainTextLevelCard;
  List<int> someSubCards;
  List<String> imageType;
  //
  bool isCountBlue;
  bool isCountSilver;
  bool isCountGold;

  @override
  void initState() {
    _scrollController = new ScrollController();
    cardScrollController = new ScrollController();
    carouselController = CarouselController();
    tempShowingCard = widget.showingCard;
    //  !

    prepareMainCards();

    super.initState();
  }

  void prepareMainCards() {
    someCards = 0;
    // ignore: deprecated_member_use
    mainAssetsLevelCard = new List<String>();
    // ignore: deprecated_member_use
    mainTitleLevelCard = new List<String>();
    // ignore: deprecated_member_use
    mainTextLevelCard = new List<String>();
    // ignore: deprecated_member_use
    someSubCards = new List<int>();
    // ignore: deprecated_member_use
    imageType = new List<String>();
    someSubCards.add(0);
    someSubCards.add(0);
    someSubCards.add(0);
    isCountBlue = false;
    isCountSilver = false;
    isCountGold = false;

    for (int i = 0; i < widget.levelCards.length; i++) {
      if (((widget.levelCards[i].engTitle)
          .contains(RegExp(r'blue', caseSensitive: false)))) {
        if (!isCountBlue) {
          someCards++;
          mainAssetsLevelCard.add(widget.levelCards[i].image);
          imageType.add(getTypeFileLink(widget.levelCards[i].image));
          mainTitleLevelCard.add("کارت عضویت آبی");
          mainTextLevelCard.add(widget.levelCards[i].text);
          isCountBlue = true;
        }
        someSubCards[0] = someSubCards[0] + 1;
      }
      if (((widget.levelCards[i].engTitle)
          .contains(RegExp(r'silver', caseSensitive: false)))) {
        if (!isCountSilver) {
          someCards++;
          mainAssetsLevelCard.add(widget.levelCards[i].image);
          imageType.add(getTypeFileLink(widget.levelCards[i].image));
          mainTitleLevelCard.add(widget.levelCards[i].perTitle);
          mainTextLevelCard.add(widget.levelCards[i].text);
          isCountSilver = true;
        }
        someSubCards[1] = someSubCards[1] + 1;
      }
      if (((widget.levelCards[i].engTitle)
          .contains(RegExp(r'gold', caseSensitive: false)))) {
        if (!isCountGold) {
          someCards++;
          mainAssetsLevelCard.add(widget.levelCards[i].image);
          imageType.add(getTypeFileLink(widget.levelCards[i].image));
          mainTitleLevelCard.add(widget.levelCards[i].perTitle);
          mainTextLevelCard.add(widget.levelCards[i].text);
          isCountGold = true;
        }
        someSubCards[2] = someSubCards[2] + 1;
      }
    }

    for (int i = 0; i < someCards; i++) {
      if (i == widget.showingCard) {
        largeWidths.add((widget.screenSize.width / 2.25) -
            (0.054 * widget.screenSize.width //20
            ));
        largeHeights.add(0.2027 * widget.screenSize.height //120,
            );
      } else {
        largeWidths.add((widget.screenSize.width / 3.5));
        largeHeights.add(0.15625 * widget.screenSize.height //100,
            );
      }
    }

    for (var i = 0; i < someCards; i++) index.add(i);
    setState(() {
      tempShowingCard = widget.showingCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("showingCard in panel : ${widget.showingCard}");
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            0.083 * _screenSize.width, //30
          ),
          topRight: Radius.circular(
            0.083 * _screenSize.width, //30
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.054 * _screenSize.width, //20
              vertical: 0.023 * _screenSize.height, //15
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'معرفی کارت های جین وست',
                  style: TextStyle(
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.close,
                    size: 0.069 * _screenSize.width, //25,
                  ),
                  onTap: () => widget.closeCardsInfoPanel(),
                )
              ],
            ),
          ),
          // ! use CarouselSlider package
          // CarouselSlider(
          //   options: CarouselOptions(
          //     height: 0.33 * _screenSize.width, // 120
          //     viewportFraction: 0.45,
          //     // disableCenter: true,
          //     initialPage: widget.showingCard,
          //     enableInfiniteScroll: true,
          //     onPageChanged: (int index, CarouselPageChangedReason reason) {
          //       setState(() {
          //         widget.changeShowingCard(index);
          //       });
          //     },
          //     // autoPlay: true,
          //     autoPlayInterval: Duration(seconds: 4),
          //     autoPlayAnimationDuration: Duration(milliseconds: 1000),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enlargeStrategy: CenterPageEnlargeStrategy.scale,
          //     enlargeCenterPage: true,
          //   ),
          //   carouselController: carouselController,
          //   items: index.map((i) {
          //     return Builder(
          //       builder: (BuildContext context) {
          //         return GestureDetector(
          //           child: Stack(
          //             children: [
          //               Container(
          //                 alignment: Alignment.bottomLeft,
          //                 height: 0.33 * _screenSize.width, // 120
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(
          //                     0.027 * _screenSize.width, //10,
          //                   ),
          //                   image: DecorationImage(
          //                     fit: BoxFit.contain,
          //                     image: new AssetImage(
          //                         widget.assetsLevelCard.elementAt(i)),
          //                   ),
          //                 ),
          //               ),
          //               Positioned(
          //                 bottom: widget.showingCard == i
          //                     ? 0.016 * _screenSize.height //10
          //                     : 0.008 * _screenSize.height, //5
          //                 left: widget.showingCard == i
          //                     ? 0.027 * _screenSize.width //10
          //                     : 0.054 * _screenSize.width, //20
          //                 child: Row(
          //                   children: [
          //                     Text(
          //                       'اطلاعات بیشتر',
          //                       style: TextStyle(
          //                         color: i == 0 ? Colors.white : Colors.black,
          //                         fontSize: 0.027 * _screenSize.width, //10,
          //                         fontWeight: FontWeight.w500,
          //                       ),
          //                     ),
          //                     Icon(
          //                       Icons.chevron_right,
          //                       size: 0.05 * _screenSize.width, //18,
          //                       color: i == 0 ? Colors.white : Colors.black,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //           onTap: () => setState(() {
          //             if (widget.showingCard ==
          //                     widget.assetsLevelCard.length - 1 &&
          //                 i == 0)
          //               carouselController.nextPage();
          //             else if (i == widget.assetsLevelCard.length - 1 &&
          //                 widget.showingCard == 0)
          //               carouselController.previousPage();
          //             else
          //               carouselController.animateToPage(i);
          //             widget.changeShowingCard(i);
          //           }),
          //         );
          //       },
          //     );
          //   }).toList(),
          // ),
          // //

          // !

          Container(
            width: _screenSize.width,
            height: 0.172 * _screenSize.height, //110,
            child: ListView.builder(
              itemCount: someCards,
              // itemCount: widget.assetsLevelCard.length,
              shrinkWrap: true,
              controller: cardScrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.00555 * _screenSize.width, //2,
                  ),
                  child: AnimatedContainer(
                    width: largeWidths[index],
                    height: largeHeights[index],
                    decoration: BoxDecoration(),
                    child: GestureDetector(
                      child: imageType[index] == "svg"
                          ? SvgPicture.network(
                              mainAssetsLevelCard[index],
                              placeholderBuilder: (BuildContext context) =>
                                  new Container(
                                padding: const EdgeInsets.all(30.0),
                                child: const CircularProgressIndicator(
                                  backgroundColor: Colors.amber,
                                ),
                              ),
                            )
                          : NetworkImage(mainAssetsLevelCard[index]),
                      onTap: () => setState(() {
                        // cardScrollController.jumpTo(index == 0
                        //     ? 0
                        //     : index == 1
                        //         ? (widget.screenSize.width / 2)
                        //         : widget.screenSize.width);
                        cardScrollController.animateTo(
                          index == 0
                              ? 0
                              : index == 1
                                  ? (widget.screenSize.width / 2) +
                                      (0.041 * _screenSize.width //15,
                                      )
                                  : widget.screenSize.width +
                                      (0.054 * _screenSize.width //20

                                      ),
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear,
                        );
                        largeHeights[widget.showingCard] =
                            0.2027 * _screenSize.height; //120,
                        largeHeights[index] = 0.234 * _screenSize.height; //150,
                        //
                        largeWidths[widget.showingCard] =
                            (widget.screenSize.width / 3.5);
                        largeWidths[index] = (widget.screenSize.width / 2.25) -
                            (0.054 * _screenSize.width //20
                            );
                        widget.changeShowingCard(index);
                      }),
                    ),
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear,
                  ),
                );
              },
            ),
          ),
          // ),

          // ??
          //
          SizedBox(height: 0.0078 * _screenSize.height //5,
              ),
          Container(
            height: 0.0118 * _screenSize.height, //7,
            width: 0.09722 * _screenSize.width, //35,
            padding: EdgeInsets.symmetric(
              horizontal: 0.0083 * _screenSize.width, //3,
            ),
            alignment: Alignment.center,
            child: ListView.builder(
              // itemCount: widget.assetsLevelCard.length,
              itemCount: someCards,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 0.00555 * _screenSize.width, //2,
                    ),
                    Container(
                      width: widget.showingCard == index
                          ? 0.0194 * _screenSize.width //7,
                          : 0.0078 * _screenSize.height //5,
                      ,
                      height: widget.showingCard == index
                          ? 0.0194 * _screenSize.width //7,
                          : 0.0078 * _screenSize.height //5,
                      ,
                      // margin: EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: widget.showingCard == index
                            ? MAIN_BLUE_COLOR
                            : DARK_GREY,
                        borderRadius: BorderRadius.circular(
                          0.138 * _screenSize.width, //50,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.00555 * _screenSize.width, //2,
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 0.015 * _screenSize.height, //10,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              horizontal: 0.054 * _screenSize.width, //20
            ),
            child: Text(
              // widget.levels[widget.showingCard].perMainName,
              mainTitleLevelCard[widget.showingCard],
              style: TextStyle(
                fontSize: 0.038 * _screenSize.width, //14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 0.0078 * _screenSize.height //5,
              ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.054 * _screenSize.width, //20
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.015 * _screenSize.height, //10,
                    ),
                    Text(
                      mainTextLevelCard[widget.showingCard],
                      style: TextStyle(
                        fontSize: 0.038 * _screenSize.width, //14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 0.015 * _screenSize.height, //10,
                    ),
                    ListView.builder(
                      itemCount: someSubCards[widget.showingCard],
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int indexSubLvl) {
                        int indexOfSubCard = 0;
                        for (int mainIndex = 0;
                            mainIndex < widget.showingCard;
                            mainIndex++) {
                          for (int subIndex = 0;
                              subIndex < someSubCards[mainIndex];
                              subIndex++) {
                            indexOfSubCard++;
                          }
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            someSubCards[widget.showingCard] == 1
                                ? SizedBox()
                                : Text(
                                    widget
                                        // .levelCards[
                                        //     widget.showingCard + indexSubLvl]
                                        .levelCards[
                                            indexOfSubCard + indexSubLvl]
                                        .perTitle,
                                    style: TextStyle(
                                        fontSize:
                                            0.038 * _screenSize.width, //14,
                                        fontWeight: FontWeight.w500,
                                        color: widget.showingCard == 0
                                            ? MAIN_BLUE_COLOR
                                            : Colors.black),
                                  ),
                            Text(
                              widget.levelCards[indexOfSubCard + indexSubLvl]
                                  .receiptConditions,
                              style: TextStyle(
                                fontSize: 0.038 * _screenSize.width, //14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            ListView.builder(
                              itemCount: widget
                                  .levelCards[indexOfSubCard + indexSubLvl]
                                  .descriptions
                                  .length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder:
                                  (BuildContext contex, int indexDesc) {
                                return widget
                                                .levelCards[indexOfSubCard +
                                                    indexSubLvl]
                                                .descriptions[indexDesc] ==
                                            null ||
                                        widget
                                                .levelCards[indexOfSubCard +
                                                    indexSubLvl]
                                                .descriptions[indexDesc] ==
                                            ''
                                    ? SizedBox()
                                    : Text(
                                        widget
                                            .levelCards[
                                                indexOfSubCard + indexSubLvl]
                                            .descriptions[indexDesc],
                                        style: TextStyle(
                                          fontSize:
                                              0.038 * _screenSize.width, //14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      );
                              },
                            ),
                            SizedBox(
                              height: 0.031 * _screenSize.height, //20,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 0.1093 * _screenSize.height, //70,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
