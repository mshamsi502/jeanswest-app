//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/globalInstances/product-add-to-card-info.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_label_widget.dart';

class ProductInfoGridViewWidget extends StatefulWidget {
  final double width;
  final SingleProductInfoRes product;
  final int productIndex;
  final bool hasDelete;
  final bool hasAddToFav;
  final bool isFave;
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
  }) : super(key: key);

  State<StatefulWidget> createState() => _ProductInfoGridViewWidgetState();
}

class _ProductInfoGridViewWidgetState extends State<ProductInfoGridViewWidget> {
  bool productIsActive;
  int sizeIsActive;
  int discountPercent;

  @override
  void initState() {
    discountPercent = ((widget.product.basePrice - widget.product.salePrice) /
            widget.product.basePrice *
            100)
        .round();
    print('discountPercent : $discountPercent');
    productIsActive = false;
    for (int i = 0; i < widget.product.banimodeDetails.size.length; i++) {
      sizeIsActive = widget.product.banimodeDetails.size[i].active;
      if (sizeIsActive == 1) {
        productIsActive = true;
        break;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 300,
      width: widget.width,
      // color: Colors.amber,
      child: Column(
        children: [
          Container(
            height: 210,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: Colors.grey[300],
              ),
            ),
            child: Stack(
              children: [
                Container(
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
                    fit: BoxFit.contain,
                  ),
                ),
                productIsActive
                    ? SizedBox()
                    : Container(
                        color: GREY_FADE_BACKGROUND_COLOR,
                      ),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: widget.hasAddToFav
                      ? GestureDetector(
                          onTap: () {
                            // !  change isFave
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            child: Icon(
                              widget.isFave
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: widget.isFave ? Colors.red : Colors.grey,
                              size: 30,
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
                Positioned(
                  left: 2,
                  top: 2,
                  child: widget.hasDelete
                      ? Container(
                          height: 35,
                          width: 35,
                          padding: EdgeInsets.all(6),
                          child: GestureDetector(
                            onTap: () =>
                                widget.deleteFromFav(widget.productIndex),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.grey[300],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    color: Colors.grey[200],
                                  )
                                ],
                              ),
                              child: Icon(
                                Icons.close,
                                size: 16,
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
            child: Text(
              widget.product.banimodeDetails.productName,
              textDirection: rtlTextDirection,
              style: TextStyle(fontSize: 12),
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    // color: Colors.red,
                    // width: 60,
                    height: 45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        productIsActive && discountPercent != 0
                            ? Text(
                                toPriceStyle(widget.product.basePrice),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough),
                              )
                            : SizedBox(),
                        Text(
                          productIsActive
                              ? toPriceStyle(widget.product.salePrice)
                              : 'ناموجود',
                          style: TextStyle(
                            color: productIsActive
                                ? Colors.black
                                : MAIN_ORANGE_COLOR,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 3),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    // color: Colors.green,
                    width: 40,
                    height: 45,
                    child: productIsActive && discountPercent != 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AvakatanLabelWidget(
                                text: '$discountPercent %',
                                textColor: Colors.white,
                                backgroundColor: MAIN_BLUE_COLOR,
                                textSize: 10,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    'تومان',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
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
                height: 45,
                width: 45,
                child: GestureDetector(
                  onTap: () async {
                    if (widget.productIndex == 2) {
                      // ! if is sfor test, delete it
                      try {
                        print('barcode : ${widget.product.barcode}');
                        Map<String, String> reqBody = {
                          "barcode": widget.product.barcode,
                        };
                        ListOfProductsRes _addToCardProductDetailRes =
                            await globalLocator<GlobalRestClient>()
                                .getAddToCardProductDetailInfo(reqBody);
                        setState(() {
                          addToCardProductDetailRes =
                              _addToCardProductDetailRes;
                        });
                        //
                        widget.addToCardFromFav(widget.productIndex);
                      } catch (e) {
                        printErrorMessage(e);

                        print('error :(');
                      }
                    } else // ! for test, delete it
                      print('no data :)');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.grey[300],
                      ),
                    ),
                    child: Icon(
                      Icons.add_shopping_cart,
                      size: 25,
                      color: MAIN_BLUE_COLOR,
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
