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

class ProductInfoListViewWidget extends StatefulWidget {
  final double width;
  final SingleProductInfoRes product;
  final int productIndex;
  final bool isFave;
  final Function(int, bool) changeFav;
  final Function(int) openAddToCardPanel;

  ProductInfoListViewWidget({
    Key key,
    this.product,
    this.width,
    this.isFave,
    this.productIndex,
    this.changeFav,
    this.openAddToCardPanel,
  }) : super(key: key);

  State<StatefulWidget> createState() => _ProductInfoListViewWidgetState();
}

class _ProductInfoListViewWidgetState extends State<ProductInfoListViewWidget> {
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
      height: 505,
      // color: Colors.red,
      width: widget.width,
      child: Column(
        children: [
          Container(
            width: _screenSize.width,
            height: 5,
            color: F2_BACKGROUND_COLOR,
          ),
          Container(
            // height: 290,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                0.00555 * _screenSize.width, //2,
              ),
              // border: Border.all(
              //   color: Colors.grey[300],
              // ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: widget.width,
                    child: Image.network(
                      widget.product.banimodeDetails.images.thickboxDefault[
                              widget.product.banimodeDetails.images
                                          .thickboxDefault.length >
                                      6
                                  ? 2
                                  : 0] ??
                          EMPTY_IMAGE,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      // !  change isFave
                      widget.changeFav(widget.productIndex, !widget.isFave);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
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
                            spreadRadius: 0.00555 * _screenSize.width, //2,
                            blurRadius: 0.022 * _screenSize.width, //8,
                            color: Colors.grey[200],
                          )
                        ],
                      ),
                      child: Icon(
                        widget.isFave ? Icons.favorite : Icons.favorite_border,
                        color: widget.isFave ? MAIN_BLUE_COLOR : Colors.grey,
                        size: 0.083 * _screenSize.width, //30
                      ),
                    ),
                    // ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 10,
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
                          addToCardProductDetailRes =
                              _addToCardProductDetailRes;
                        });
                        widget.openAddToCardPanel(widget.productIndex);
                      } catch (e) {
                        printErrorMessage(e);
                        print('error :(');
                      }
                      // } else // ! for test, delete it
                      //   print('no exist :)');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
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
                            spreadRadius: 0.00555 * _screenSize.width, //2,
                            blurRadius: 0.022 * _screenSize.width, //8,
                            color: Colors.grey[200],
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 0.069 * _screenSize.width, //25,
                        color: MAIN_BLUE_COLOR,
                      ),
                    ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              // color: Colors.red,
              alignment: Alignment.centerRight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          widget.product.banimodeDetails
                              .productManufacturerEnName,
                          textAlign: TextAlign.right,
                          textDirection: rtlTextDirection,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        widget.product.banimodeDetails.productName,
                        textDirection: rtlTextDirection,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              discountPercent != 0
                                  ? Text(
                                      toPriceStyle(widget.product.basePrice),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize:
                                              0.0333 * _screenSize.width, //12,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  : SizedBox(),
                              Text(
                                toPriceStyle(widget.product.salePrice),
                                style: TextStyle(
                                  color: Colors.black,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
