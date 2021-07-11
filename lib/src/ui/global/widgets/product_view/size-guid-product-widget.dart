// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';

class SizeGuideProductWidget extends StatefulWidget {
  final ListOfProductsRes productDetail;
  final Function() hideSizeGuide;
  final double height;

  const SizeGuideProductWidget({
    Key key,
    @required this.productDetail,
    @required this.hideSizeGuide,
    this.height = 0.4, // 250
  }) : super(key: key);
  @override
  _SizeGuideProductWidgetState createState() => _SizeGuideProductWidgetState();
}

class _SizeGuideProductWidgetState extends State<SizeGuideProductWidget> {
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(
        horizontal: 0.054 * _screenSize.width, //20
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'راهنمای انتخاب سایز',
                style: TextStyle(
                  fontSize: 0.038 * _screenSize.width, //14,
                ),
              ),
              Expanded(child: SizedBox()),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(
                    0.0138 * _screenSize.width, //5
                  ),
                  child: Icon(
                    Icons.close,
                    size: 0.069 * _screenSize.width, //25,
                    color: Colors.black,
                  ),
                ),
                onTap: () => widget.hideSizeGuide(),
              ),
            ],
          ),

          widget.productDetail != null &&
                  widget.productDetail.data != null &&
                  widget.productDetail.data.result != null &&
                  widget.productDetail.data.result.length > 0 &&
                  widget.productDetail.data.result.first.banimodeDetails !=
                      null &&
                  widget.productDetail.data.result.first.banimodeDetails
                          .productSizeGuide !=
                      null &&
                  widget.productDetail.data.result.first.banimodeDetails
                          .productSizeGuide.length >
                      0
              ? Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.023 * _screenSize.height, //15
                      ),
                      Expanded(
                        child: Container(
                          height: 0.5067 * _screenSize.height, //300,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0.03125 * _screenSize.height, //20
                                child: Container(
                                  height: 0.03125 * _screenSize.height, //20
                                  width: _screenSize.width -
                                      (0.111 * _screenSize.width //40,
                                      ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.symmetric(
                                      vertical: BorderSide(
                                          color: BLUE_SKY_FADE_COLOR),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 0.0625 * _screenSize.height, //40
                                width: _screenSize.width -
                                    (0.111 * _screenSize.width //40,
                                    ),
                                child: ListView.builder(
                                  itemCount: widget
                                      .productDetail
                                      .data
                                      .result[0]
                                      .banimodeDetails
                                      .productSizeGuide[0]
                                      .length,
                                  // physics: NeverScrollableScrollPhysics(),

                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: 0.0625 * _screenSize.height, //40
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            0.0138 * _screenSize.width, //5
                                      ),
                                      width: (_screenSize.width -
                                              (0.111 * _screenSize.width //40,
                                              )) /
                                          (widget
                                              .productDetail
                                              .data
                                              .result[0]
                                              .banimodeDetails
                                              .productSizeGuide[0]
                                              .length),
                                      decoration: BoxDecoration(
                                        color: BLUE_SKY_FADE_COLOR,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(index ==
                                                  0
                                              ? 0.083 * _screenSize.width //30
                                              : 0),
                                          topRight: Radius.circular(index == 0
                                              ? 0.083 * _screenSize.width //30
                                              : 0),
                                          topLeft: Radius.circular(index ==
                                                  widget
                                                          .productDetail
                                                          .data
                                                          .result[0]
                                                          .banimodeDetails
                                                          .productSizeGuide[0]
                                                          .length -
                                                      1
                                              ? 0.083 * _screenSize.width //30
                                              : 0),
                                          bottomLeft: Radius.circular(index ==
                                                  widget
                                                          .productDetail
                                                          .data
                                                          .result[0]
                                                          .banimodeDetails
                                                          .productSizeGuide[0]
                                                          .length -
                                                      1
                                              ? 0.083 * _screenSize.width //30
                                              : 0),
                                        ),
                                      ),
                                      child: Text(
                                        widget
                                            .productDetail
                                            .data
                                            .result[0]
                                            .banimodeDetails
                                            .productSizeGuide[0][index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              0.03 * _screenSize.width, //12,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 0.0625 * _screenSize.height, //40
                                child:
                                    // Expanded(
                                    //   child:
                                    Container(
                                  // color: Colors.red,
                                  height: widget.height * _screenSize.height,
                                  width: _screenSize.width -
                                      (0.111 * _screenSize.width //40,
                                      ),
                                  child: ListView.builder(
                                    itemCount: widget
                                        .productDetail
                                        .data
                                        .result[0]
                                        .banimodeDetails
                                        .productSizeGuide
                                        .length,
                                    // physics: NeverScrollableScrollPhysics(),
                                    physics: AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    controller: scrollController,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (BuildContext context,
                                        int indexInColumn) {
                                      return indexInColumn == 0
                                          ? SizedBox()
                                          : Container(
                                              height: 0.0625 *
                                                  _screenSize.height, //40
                                              alignment: Alignment.center,
                                              width: _screenSize.width -
                                                  (0.111 *
                                                      _screenSize.width //40,
                                                  ),
                                              child: ListView.builder(
                                                itemCount: widget
                                                    .productDetail
                                                    .data
                                                    .result[0]
                                                    .banimodeDetails
                                                    .productSizeGuide[
                                                        indexInColumn]
                                                    .length,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int indexInRow) {
                                                  return Container(
                                                    height: 0.0625 *
                                                        _screenSize.height, //40
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 0.0138 *
                                                          _screenSize.width, //5
                                                    ),
                                                    width: (_screenSize.width -
                                                            (0.111 *
                                                                _screenSize
                                                                    .width //40,
                                                            )) /
                                                        (widget
                                                            .productDetail
                                                            .data
                                                            .result[0]
                                                            .banimodeDetails
                                                            .productSizeGuide[
                                                                indexInColumn]
                                                            .length),
                                                    decoration: BoxDecoration(
                                                        // color: Colors.blue,
                                                        border: Border(
                                                      right: BorderSide(
                                                          color: indexInRow == 0
                                                              ? BLUE_SKY_FADE_COLOR
                                                              : Colors
                                                                  .transparent),
                                                      bottom: BorderSide(
                                                          color:
                                                              BLUE_SKY_FADE_COLOR),
                                                      left: BorderSide(
                                                          color:
                                                              BLUE_SKY_FADE_COLOR),
                                                    )),
                                                    child: Text(
                                                      widget
                                                              .productDetail
                                                              .data
                                                              .result[0]
                                                              .banimodeDetails
                                                              .productSizeGuide[
                                                          indexInColumn][indexInRow],
                                                      // textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 0.034 *
                                                            _screenSize
                                                                .width, //12,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                    },
                                  ),
                                ),
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/svg_images/global/message/no_exist_data.svg',
                            width: 140,
                            height: 140,
                          ),
                          SizedBox(height: 10),
                          Text("اطلاعاتی برای نمایش وجود ندارد.",
                              style: TextStyle(
                                fontSize: 16,
                              )),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
          //     ),
          //   ),
          // ),
          // ),
        ],
      ),
    );
  }
}
