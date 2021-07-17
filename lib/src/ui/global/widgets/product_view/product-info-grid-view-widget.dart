//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/product-add-to-card-info.dart';
import 'package:jeanswest/src/models/api_response/globalRes/general_response.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/ui/singleProduct/screens/single_product_main_page.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserFavoritesInfo/get-user-favorites-info.dart';
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
  final bool addToCardIsActive;
  final Function(int) deleteFromFav;
  final Function(int) addToCardFromFav;
  final Function(int, bool) changeFav;

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
    this.changeFav,
    this.addToCardIsActive = true,
  }) : super(key: key);

  State<StatefulWidget> createState() => _ProductInfoGridViewWidgetState();
}

class _ProductInfoGridViewWidgetState extends State<ProductInfoGridViewWidget> {
  // bool productIsActive;
  int discountPercent;
  //
  int selectedColor;
  int selectedSize;
  bool tempIsFav;

  @override
  void initState() {
    tempIsFav = widget.isFave;
    if (widget.product != null &&
        widget.product.basePrice != null &&
        widget.product.salePrice != null)
      discountPercent = ((widget.product.basePrice - widget.product.salePrice) /
              widget.product.basePrice *
              100)
          .round();
    else
      discountPercent = 0;
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
                GestureDetector(
                  child: Container(
                    height: 0.3547 * _screenSize.height, //210,
                    width: widget.width,
                    child: Image.network(
                      widget.product != null &&
                              widget.product.banimodeDetails != null &&
                              widget.product.banimodeDetails.images != null
                          ? widget.product.banimodeDetails.images
                                  .thickboxDefault[
                              // widget.product.banimodeDetails
                              //             .images.thickboxDefault.length >
                              //         6
                              //     ? 2
                              //     :
                              0]
                          : EMPTY_IMAGE,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // ! navigation to single product
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleProductMainPage(
                                product: widget.product,
                                isFave: widget.isFave,
                                changeFave: (bool newIsFave) => widget
                                    .changeFav(widget.productIndex, newIsFave),
                              ))),
                ),
                widget.productIsActive
                    ? SizedBox()
                    : Container(
                        color: GREY_FADE_BACKGROUND_COLOR,
                      ),
                Positioned(
                  right: 7,
                  bottom: 7,
                  child: widget.hasAddToFav
                      ? GestureDetector(
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 0.02,
                                    color: Colors.grey[300],
                                  )
                                ]),
                            padding: EdgeInsets.all(7),
                            child: SvgPicture.asset(
                              tempIsFav
                                  ? 'assets/images/svg_images/global/new/heart-fill.svg'
                                  : 'assets/images/svg_images/global/new/heart.svg',
                              color: tempIsFav ? MAIN_BLUE_COLOR : Colors.grey,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          onTap: () async {
                            setState(() {
                              tempIsFav = !tempIsFav;
                            });
                            GeneralRespons res =
                                await addToUserFavoriteInfo(widget.product.sku);
                            if (res != null && res.statusCode == 200) {
                              widget.changeFav(widget.productIndex, tempIsFav);
                            } else
                              setState(() {
                                tempIsFav = !tempIsFav;
                              });
                          })

                      // GestureDetector(
                      //     onTap: () {
                      //       // !  change isFave
                      //       widget.changeFav(
                      //           widget.productIndex, !widget.isFave);
                      //     },
                      //     child: Container(
                      //       height: 0.09722 * _screenSize.width, //35,
                      //       width: 0.09722 * _screenSize.width, //35,
                      //       child: Icon(
                      //         widget.isFave
                      //             ? Icons.favorite
                      //             : Icons.favorite_border,
                      //         color:
                      //             widget.isFave ? MAIN_BLUE_COLOR : Colors.grey,
                      //         size: 0.083 * _screenSize.width, //30
                      //       ),
                      //     ),
                      //   )
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
                widget.product != null &&
                        widget.product.banimodeDetails != null &&
                        widget.product.banimodeDetails
                                .productManufacturerEnName !=
                            null
                    ? widget.product.banimodeDetails.productManufacturerEnName
                    : "",
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
              widget.product != null && widget.product.banimodeDetails != null
                  ? widget.product.banimodeDetails.productName
                  : "",
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
                                toPriceStyle(widget.product.basePrice,
                                    isFromRialToToman: true),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 0.0333 * _screenSize.width, //12,
                                    decoration: TextDecoration.lineThrough),
                              )
                            : SizedBox(),
                        Text(
                          widget.productIsActive
                              ? toPriceStyle(widget.product.salePrice,
                                  isFromRialToToman: true)
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
                    // width: 0.111 * _screenSize.width, //40,
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
              widget.addToCardIsActive
                  ? Container(
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
                              addToCardProductDetailRes =
                                  _addToCardProductDetailRes;
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
                    )
                  : SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
