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

class DetailProductWidget extends StatefulWidget {
  final ListOfProductsRes productDetail;
  final int selectedColor;
  final int selectedSize;
  final Function(int) changeSelectedColor;
  final Function(int) changeSelectedSize;
  final Function() closeAddToCardPanel;
  final Function() showSizeGuid;

  const DetailProductWidget({
    Key key,
    this.closeAddToCardPanel,
    this.productDetail,
    this.selectedColor,
    this.selectedSize,
    this.changeSelectedColor,
    this.changeSelectedSize,
    this.showSizeGuid,
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
    tempFirstBarcode = widget.productDetail.data[0].barcode;
    sizeScrollController = new ScrollController();
    colorScrollController = new ScrollController();
    productIsActive = createColorIsActive(widget.productDetail);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (tempFirstBarcode != widget.productDetail.data[0].barcode) {
      setState(() {
        productIsActive = createColorIsActive(widget.productDetail);
        tempFirstBarcode = widget.productDetail.data[0].barcode;
      });
    }
    // ignore: unused_local_variable
    var _screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
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
              onTap: () => widget.closeAddToCardPanel(),
            ),
            SizedBox(width: 15),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(
                "انتخاب سایز : ",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                widget.selectedSize == -1
                    ? ""
                    : "( ${widget.productDetail.data[widget.selectedColor].banimodeDetails.size[widget.selectedSize].name} )",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Expanded(child: SizedBox()),
              GestureDetector(
                child: AvakatanLabelWidget(
                  text: "راهنمای سایز",
                  icon: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Icon(Icons.help_outline,
                        color: MAIN_BLUE_COLOR, size: 18),
                  ),
                  textColor: MAIN_BLUE_COLOR,
                  backgroundColor: Colors.grey[200],
                  textSize: 11,
                  fontWeight: FontWeight.w600,
                  borderColor: Colors.grey[200],
                ),
                onTap: () => widget.showSizeGuid(),
              ),
              SizedBox(width: 5),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 30,
          width: _screenSize.width,
          child: ListView.builder(
            controller: sizeScrollController,
            itemCount: widget.productDetail.data[widget.selectedColor]
                .banimodeDetails.size.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  SizedBox(width: index == 0 ? 20 : 0),
                  GestureDetector(
                      child: AvakatanLabelWidget(
                        text: widget.productDetail.data[widget.selectedColor]
                            .banimodeDetails.size[index].name,
                        textColor: widget
                                    .productDetail
                                    .data[widget.selectedColor]
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
                                    .data[widget.selectedColor]
                                    .banimodeDetails
                                    .size[index]
                                    .quantity ==
                                0
                            ? Colors.grey[300]
                            : Colors.white,
                        textSize: 13,
                        fontWeight: widget
                                        .productDetail
                                        .data[widget.selectedColor]
                                        .banimodeDetails
                                        .size[index]
                                        .quantity ==
                                    0 ||
                                index != widget.selectedSize
                            ? FontWeight.w500
                            : FontWeight.w600,
                        borderColor: widget
                                    .productDetail
                                    .data[widget.selectedColor]
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
                        if (widget.productDetail.data[widget.selectedColor]
                                .banimodeDetails.size[index].quantity !=
                            0)
                          widget.changeSelectedSize(index);
                        else
                          print('this size is not exist');
                      }),
                  SizedBox(width: 5),
                  SizedBox(
                    width: index ==
                            widget.productDetail.data[widget.selectedColor]
                                    .banimodeDetails.size.length -
                                1
                        ? 15
                        : 0,
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Text(
                "انتخاب رنگ : ",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "( ${widget.productDetail.data[widget.selectedColor].banimodeDetails.colorName} )",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: _screenSize.width,
          child: ListView.builder(
            controller: colorScrollController,
            itemCount: widget.productDetail.data.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  SizedBox(width: index == 0 ? 20 : 0),
                  GestureDetector(
                      child: Container(
                        width: 70,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.grey[300],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.network(
                                widget.productDetail.data[index].banimodeDetails
                                        .images.homeDefault[0] ??
                                    EMPTY_IMAGE,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              color: index == widget.selectedColor
                                  ? GREY_FADE_SELECTED_COLOR
                                  : Colors.transparent,
                            ),
                            Positioned(
                              top: 7,
                              right: 0,
                              child: productIsActive[index]
                                  ? Container()
                                  : Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: MAIN_ORANGE_COLOR,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        ),
                                      ),
                                      child: Text(
                                        'ناموجود',
                                        style: TextStyle(
                                          fontSize: 11,
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
                            .productDetail.data[index].banimodeDetails.size);
                        widget.changeSelectedSize(selectedSize);
                      }),
                  SizedBox(width: 5),
                  SizedBox(
                    width:
                        index == widget.productDetail.data.length - 1 ? 15 : 0,
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 25),
        AvakatanButtonWidget(
          backgroundColor: MAIN_BLUE_COLOR,
          textColor: Colors.white,
          borderColor: Colors.transparent,
          title: 'تایید و ادامه',
          width: _screenSize.width - 40,
          height: 43,
          radius: 0.008 * _screenSize.height, //5
          fontSize: 16,
          onTap: () {
            // ! add to shopping baskets
          },
        ),
      ],
    );
  }
}
