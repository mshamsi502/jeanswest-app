// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math; // im
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_label_widget.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_favorite.dart';

class SizeGuideProductWidget extends StatefulWidget {
  final ListOfProductsRes productDetail;
  final Function() hideSizeGuide;

  const SizeGuideProductWidget({
    Key key,
    this.productDetail,
    this.hideSizeGuide,
  }) : super(key: key);
  @override
  _SizeGuideProductWidgetState createState() => _SizeGuideProductWidgetState();
}

class _SizeGuideProductWidgetState extends State<SizeGuideProductWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 500,
      padding: EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.amber,
      child: Column(
        children: [
          Row(
            children: [
              Text('راهنمای انتخاب سایز'),
              Expanded(child: SizedBox()),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                onTap: () => widget.hideSizeGuide(),
              ),
            ],
          ),
          SizedBox(height: 15),
          // Expanded(
          //   child:
          Container(
            // color: Colors.green,
            height: 300,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  child: Container(
                    height: 20,
                    width: _screenSize.width - 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.symmetric(
                        vertical: BorderSide(color: BLUE_SKY_FADE_COLOR),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: _screenSize.width - 40,
                  child: ListView.builder(
                    itemCount: widget.productDetail.data[0].banimodeDetails
                        .productSizeGuide[0].length,
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 40,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: (_screenSize.width - 40) /
                            (widget.productDetail.data[0].banimodeDetails
                                .productSizeGuide[0].length),
                        decoration: BoxDecoration(
                          color: BLUE_SKY_FADE_COLOR,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(index == 0 ? 30 : 0),
                            topRight: Radius.circular(index == 0 ? 30 : 0),
                            topLeft: Radius.circular(index ==
                                    widget.productDetail.data[0].banimodeDetails
                                            .productSizeGuide[0].length -
                                        1
                                ? 30
                                : 0),
                            bottomLeft: Radius.circular(index ==
                                    widget.productDetail.data[0].banimodeDetails
                                            .productSizeGuide[0].length -
                                        1
                                ? 30
                                : 0),
                          ),
                        ),
                        child: Text(
                          widget.productDetail.data[0].banimodeDetails
                              .productSizeGuide[0][index],
                          style: TextStyle(fontSize: 12),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  child: Container(
                    height: 250,
                    width: _screenSize.width - 40,
                    child: ListView.builder(
                      itemCount: widget.productDetail.data[0].banimodeDetails
                          .productSizeGuide.length,
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int indexInColumn) {
                        return indexInColumn == 0
                            ? SizedBox()
                            : Container(
                                height: 40,
                                alignment: Alignment.center,
                                width: _screenSize.width - 40,
                                child: ListView.builder(
                                  itemCount: widget
                                      .productDetail
                                      .data[0]
                                      .banimodeDetails
                                      .productSizeGuide[indexInColumn]
                                      .length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int indexInRow) {
                                    return Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: (_screenSize.width - 40) /
                                          (widget
                                              .productDetail
                                              .data[0]
                                              .banimodeDetails
                                              .productSizeGuide[indexInColumn]
                                              .length),
                                      decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          border: Border(
                                        right: BorderSide(
                                            color: indexInRow == 0
                                                ? BLUE_SKY_FADE_COLOR
                                                : Colors.transparent),
                                        bottom: BorderSide(
                                            color: BLUE_SKY_FADE_COLOR),
                                        left: BorderSide(
                                            color: BLUE_SKY_FADE_COLOR),
                                      )),
                                      child: Text(
                                        widget
                                                .productDetail
                                                .data[0]
                                                .banimodeDetails
                                                .productSizeGuide[indexInColumn]
                                            [indexInRow],
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    );
                                  },
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
