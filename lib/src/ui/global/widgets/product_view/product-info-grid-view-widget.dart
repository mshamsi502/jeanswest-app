//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/product-add-to-card-info.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_label_widget.dart';

class ProductInfoGridViewWidget extends StatefulWidget {
  final double width;
  final SingleProductInfoRes product;
  final int productIndex;
  final bool hasDelete;
  final bool hasAddToFav;
  final bool isFave;
  final bool productIsActive;
  final Function(int) deleteFromFav;
  final Function(int) addToCardFromFav;

  ProductInfoGridViewWidget({
    Key key,
    this.product,
    this.width,
    this.hasDelete,
    this.hasAddToFav,
    this.isFave,
    this.deleteFromFav,
    this.productIndex,
    this.addToCardFromFav,
    this.productIsActive,
  }) : super(key: key);

  State<StatefulWidget> createState() => _ProductInfoGridViewWidgetState();
}

class _ProductInfoGridViewWidgetState extends State<ProductInfoGridViewWidget> {
  // bool productIsActive;
  int discountPercent;
  //
  int selectedColor;
  int selectedSize;

  @override
  void initState() {
    discountPercent = ((widget.product.basePrice - widget.product.salePrice) /
            widget.product.basePrice *
            100)
        .round();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 0.5067 * _screenSize.height, //300,
      width: widget.width,
      // color: Colors.amber,
      child: Column(
        children: [
          Container(
            height: 0.3547 * _screenSize.height, //210,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                0.00555 * _screenSize.width, //2,
              ),
              border: Border.all(
                color: Colors.grey[300],
              ),
            ),
            child: Stack(
              children: [
                Container(
                  height: 0.3547 * _screenSize.height, //210,
                  width: widget.width,
                  child: Image.network(
                    widget.product.banimodeDetails.images.homeDefault[widget
                                    .product
                                    .banimodeDetails
                                    .images
                                    .homeDefault
                                    .length >
                                6
                            ? 2
                            : 0] ??
                        EMPTY_IMAGE,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                widget.productIsActive
                    ? SizedBox()
                    : Container(
                        color: GREY_FADE_BACKGROUND_COLOR,
                      ),
                Positioned(
                  right: 0.00555 * _screenSize.width, //2,
                  bottom: 0.003125 * _screenSize.height, //2,
                  child: widget.hasAddToFav
                      ? GestureDetector(
                          onTap: () {
                            // !  change isFave
                          },
                          child: Container(
                            height: 0.09722 * _screenSize.width, //35,
                            width: 0.09722 * _screenSize.width, //35,
                            child: Icon(
                              widget.isFave
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: widget.isFave ? Colors.red : Colors.grey,
                              size: 0.083 * _screenSize.width, //30
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
                Positioned(
                  left: 0.00555 * _screenSize.width, //2,
                  top: 0.003125 * _screenSize.height, //2,
                  child: widget.hasDelete
                      ? Container(
                          height: 0.09722 * _screenSize.width, //35,
                          width: 0.09722 * _screenSize.width, //35,
                          padding:
                              EdgeInsets.all(0.0166 * _screenSize.width //6,
                                  ),
                          child: GestureDetector(
                            onTap: () {
                              widget.deleteFromFav(widget.productIndex);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  0.138 * _screenSize.width, //50,
                                ),
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius:
                                        0.00555 * _screenSize.width, //2,
                                    blurRadius: 0.022 * _screenSize.width, //8,
                                    color: Colors.grey[200],
                                  )
                                ],
                              ),
                              child: Icon(
                                Icons.close,
                                size: 0.0444 * _screenSize.width, //16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                widget.product.banimodeDetails.productManufacturerEnName,
                textAlign: TextAlign.right,
                textDirection: rtlTextDirection,
                style: TextStyle(
                  fontSize: 0.0333 * _screenSize.width, //12,
                ),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            child: Text(
              widget.product.banimodeDetails.productName,
              textDirection: rtlTextDirection,
              style: TextStyle(
                fontSize: 0.0333 * _screenSize.width, //12,
              ),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 0.08 * _screenSize.height, //45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.productIsActive && discountPercent != 0
                            ? Text(
                                toPriceStyle(widget.product.basePrice),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 0.0333 * _screenSize.width, //12,
                                    decoration: TextDecoration.lineThrough),
                              )
                            : SizedBox(),
                        Text(
                          widget.productIsActive
                              ? toPriceStyle(widget.product.salePrice)
                              : 'ناموجود',
                          style: TextStyle(
                            color: widget.productIsActive
                                ? Colors.black
                                : MAIN_ORANGE_COLOR,
                            fontSize: 0.038 * _screenSize.width, //14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 0.0083 * _screenSize.width, //3,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.0046 * _screenSize.height, //3,
                    ),
                    width: 0.111 * _screenSize.width, //40,
                    height: 0.075 * _screenSize.height, //45,
                    child: widget.productIsActive
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              discountPercent != 0
                                  ? AvakatanLabelWidget(
                                      text: '$discountPercent %',
                                      textColor: Colors.white,
                                      backgroundColor: MAIN_BLUE_COLOR,
                                      textSize: 0.027 * _screenSize.width, //10,
                                    )
                                  : SizedBox(),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    'تومان',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 0.027 * _screenSize.width, //10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Container(
                height: 0.125 * _screenSize.width, //45,
                width: 0.125 * _screenSize.width, //45,
                child: GestureDetector(
                  onTap: () async {
                    try {
                      print('styleCode : ${widget.product.styleCode}');

                      Map<String, dynamic> mapFilter = {
                        "filter": {
                          "styleCode": {"eq": widget.product.styleCode},
                          "quantity": {"gt": 0}
                        },
                        "option": {
                          "page": {"eq": 1},
                          "limit": {"eq": 20}
                        },
                        "unique": {
                          "color": {"eq": 1}
                        }
                      };
                      ListOfProductsRes _addToCardProductDetailRes =
                          await globalLocator<GlobalRestClient>()
                              .getProductList(mapFilter);

                      setState(() {
                        addToCardProductDetailRes = _addToCardProductDetailRes;
                      });
                      widget.addToCardFromFav(widget.productIndex);
                    } catch (e) {
                      printErrorMessage(e);
                      print('error :(');
                    }
                    // } else // ! for test, delete it
                    //   print('no exist :)');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        0.138 * _screenSize.width, //50,
                      ),
                      border: Border.all(
                        color: Colors.grey[300],
                      ),
                    ),
                    child: Icon(
                      Icons.add_shopping_cart,
                      size: 0.069 * _screenSize.width, //25,
                      color: widget.productIsActive
                          ? MAIN_BLUE_COLOR
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
