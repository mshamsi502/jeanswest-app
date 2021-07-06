// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math; // im
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-data.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_label_widget.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_favorite.dart';

class DetailProductWidget extends StatefulWidget {
  final ListOfProductsData productDetail;
  final int selectedColor;
  final int selectedSize;
  final Function(int) changeSelectedColor;
  final Function(int) changeSelectedSize;
  final Function() closeAddToCardPanel;
  final Function() showSizeGuid;
  final bool isAddToCardPanel;

  const DetailProductWidget({
    Key key,
    @required this.closeAddToCardPanel,
    @required this.productDetail,
    @required this.selectedColor,
    @required this.selectedSize,
    @required this.changeSelectedColor,
    @required this.changeSelectedSize,
    @required this.showSizeGuid,
    this.isAddToCardPanel = true,
  }) : super(key: key);
  @override
  _DetailProductWidgetState createState() => _DetailProductWidgetState();
}

class _DetailProductWidgetState extends State<DetailProductWidget> {
  ScrollController sizeScrollController;
  ScrollController colorScrollController;
  List<bool> productIsActive;
  String tempFirstBarcode;

  @override
  void initState() {
    tempFirstBarcode = widget.productDetail.result[0].barcode;
    sizeScrollController = new ScrollController();
    colorScrollController = new ScrollController();
    productIsActive = createColorIsActive(widget.productDetail);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (tempFirstBarcode != widget.productDetail.result[0].barcode) {
      setState(() {
        productIsActive = createColorIsActive(widget.productDetail);
        tempFirstBarcode = widget.productDetail.result[0].barcode;
      });
    }
    // ignore: unused_local_variable
    var _screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        widget.isAddToCardPanel
            ? Column(
                children: [
                  Row(
                    children: [
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
                        onTap: () => widget.closeAddToCardPanel(),
                      ),
                      SizedBox(
                        width: 0.041 * _screenSize.width, //15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.008 * _screenSize.height, //5
                  ),
                ],
              )
            : SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.054 * _screenSize.width, //20
              vertical: 0.016 * _screenSize.height //10
              ),
          child: Row(
            children: [
              Text(
                "انتخاب رنگ : ",
                style: TextStyle(
                  fontSize: 0.038 * _screenSize.width, //14,
                ),
              ),
              Text(
                "( ${widget.productDetail.result[widget.selectedColor].banimodeDetails.colorName} )",
                style: TextStyle(
                  fontSize: 0.038 * _screenSize.width, //14,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 0.15625 * _screenSize.height, //100,
          width: _screenSize.width,
          child: ListView.builder(
            controller: colorScrollController,
            itemCount: widget.productDetail.result.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  SizedBox(
                      width: index == 0
                          ? 0.054 * _screenSize.width //20
                          : 0),
                  GestureDetector(
                      child: Container(
                        width: 0.19 * _screenSize.width, //70,
                        margin: EdgeInsets.all(
                          0.00555 * _screenSize.width, //2,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(
                            0.00555 * _screenSize.width, //2,
                          ),
                          border: Border.all(
                            color: index == widget.selectedColor
                                ? MAIN_BLUE_COLOR
                                : Colors.grey[300],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.network(
                                widget
                                        .productDetail
                                        .result[index]
                                        .banimodeDetails
                                        .images
                                        .homeDefault[0] ??
                                    EMPTY_IMAGE,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              color:
                                  // index == widget.selectedColor
                                  !productIsActive[index]
                                      ? GREY_FADE_SELECTED_COLOR
                                      : Colors.transparent,
                            ),
                            Positioned(
                              top: 0.011 * _screenSize.height, //7
                              right: 0,
                              child: productIsActive[index]
                                  ? Container()
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            0.0138 * _screenSize.width, //5
                                      ),
                                      decoration: BoxDecoration(
                                        color: MAIN_ORANGE_COLOR,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            0.138 * _screenSize.width, //50
                                          ),
                                          bottomLeft: Radius.circular(
                                            0.138 * _screenSize.width, //50
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'ناموجود',
                                        style: TextStyle(
                                          fontSize:
                                              0.03 * _screenSize.width, //11
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        widget.changeSelectedColor(index);
                        int selectedSize = createSelectedSize(widget
                            .productDetail.result[index].banimodeDetails.size);
                        widget.changeSelectedSize(selectedSize);
                      }),
                  SizedBox(
                    width: 0.0138 * _screenSize.width, //5
                  ),
                  SizedBox(
                    width: index == widget.productDetail.result.length - 1
                        ? 0.041 * _screenSize.width //15,
                        : 0,
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 0.023 * _screenSize.height, //15
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.054 * _screenSize.width, //20
            vertical: 0.008 * _screenSize.height, //5
          ),
          child: Row(
            children: [
              Text(
                "انتخاب سایز : ",
                style: TextStyle(
                  fontSize: 0.038 * _screenSize.width, //14,
                ),
              ),
              Text(
                widget.selectedSize == -1
                    ? ""
                    : widget.productDetail.result[widget.selectedColor]
                        .banimodeDetails.size[widget.selectedSize].name,
                style: TextStyle(
                  fontSize: 0.038 * _screenSize.width, //14,
                ),
              ),
              Expanded(child: SizedBox()),
              GestureDetector(
                child: AvakatanLabelWidget(
                  text: "راهنمای سایز",
                  icon: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Icon(
                      Icons.help_outline,
                      color: MAIN_BLUE_COLOR,
                      size: 0.05 * _screenSize.width, //18,
                    ),
                  ),
                  textColor: MAIN_BLUE_COLOR,
                  backgroundColor: Colors.grey[200],
                  textSize: 0.03 * _screenSize.width, //11
                  fontWeight: FontWeight.w600,
                  borderColor: Colors.grey[200],
                ),
                onTap: () => widget.showSizeGuid(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 0.008 * _screenSize.height, //5
        ),
        Container(
          height: 0.046 * _screenSize.height, //30
          width: _screenSize.width,
          child: ListView.builder(
            controller: sizeScrollController,
            itemCount: widget.productDetail.result[widget.selectedColor]
                .banimodeDetails.size.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  SizedBox(
                      width: index == 0
                          ? 0.054 * _screenSize.width //20
                          : 0),
                  GestureDetector(
                      child: AvakatanLabelWidget(
                        text: widget.productDetail.result[widget.selectedColor]
                            .banimodeDetails.size[index].name,
                        textColor: widget
                                    .productDetail
                                    .result[widget.selectedColor]
                                    .banimodeDetails
                                    .size[index]
                                    .quantity ==
                                0
                            ? Colors.grey
                            : index == widget.selectedSize
                                ? MAIN_BLUE_COLOR
                                : Colors.black,
                        backgroundColor: widget
                                    .productDetail
                                    .result[widget.selectedColor]
                                    .banimodeDetails
                                    .size[index]
                                    .quantity ==
                                0
                            ? Colors.grey[300]
                            : Colors.white,
                        textSize: 0.033 * _screenSize.width, //13,
                        fontWeight: widget
                                        .productDetail
                                        .result[widget.selectedColor]
                                        .banimodeDetails
                                        .size[index]
                                        .quantity ==
                                    0 ||
                                index != widget.selectedSize
                            ? FontWeight.w500
                            : FontWeight.w600,
                        borderColor: widget
                                    .productDetail
                                    .result[widget.selectedColor]
                                    .banimodeDetails
                                    .size[index]
                                    .quantity ==
                                0
                            ? Colors.grey[300]
                            : index == widget.selectedSize
                                ? MAIN_BLUE_COLOR
                                : Colors.grey[200],
                      ),
                      onTap: () {
                        if (widget.productDetail.result[widget.selectedColor]
                                .banimodeDetails.size[index].quantity !=
                            0)
                          widget.changeSelectedSize(index);
                        else
                          print('this size is not exist');
                      }),
                  SizedBox(
                    width: 0.0138 * _screenSize.width, //5
                  ),
                  SizedBox(
                    width: index ==
                            widget.productDetail.result[widget.selectedColor]
                                    .banimodeDetails.size.length -
                                1
                        ? 0.041 * _screenSize.width //15,
                        : 0,
                  ),
                ],
              );
            },
          ),
        ),
        widget.isAddToCardPanel
            ? Column(
                children: [
                  SizedBox(
                    height: 0.039 * _screenSize.height, //25,
                  ),
                  AvakatanButtonWidget(
                    backgroundColor: MAIN_BLUE_COLOR,
                    textColor: Colors.white,
                    borderColor: Colors.transparent,
                    title: 'تایید و ادامه',
                    width: _screenSize.width -
                        (0.111 * _screenSize.width //40,
                        ),
                    height: 0.07263 * _screenSize.height, //43,
                    radius: 0.008 * _screenSize.height, //5
                    fontSize: 0.0444 * _screenSize.width, //16,
                    onTap: () {
                      // ! add to shopping baskets
                    },
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
