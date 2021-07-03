// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/product-info-grid-view-widget.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/product-info-list-view-widget.dart';

class StoreMainBodyWidget extends StatefulWidget {
  final List<SingleProductInfoRes> products;
  final Function(int) openAddToCardPanel;
  // final Function() openSortByPanel;

  final bool isGridView;
  const StoreMainBodyWidget({
    Key key,
    @required this.products,
    @required this.openAddToCardPanel,
    @required this.isGridView,
    // @required this.openSortByPanel,
  }) : super(key: key);
  @override
  _StoreMainBodyWidgetState createState() => _StoreMainBodyWidgetState();
}

class _StoreMainBodyWidgetState extends State<StoreMainBodyWidget> {
  ScrollController scrollController = new ScrollController();

  int selectedProduct;
  List<SingleProductInfoRes> tempProducts = [];
  List<bool> activeProducts = [];
  List<bool> isFavProducts = [];

  @override
  void initState() {
    tempProducts = widget.products;
    isFavProducts = List.filled(tempProducts.length, false);
    updateProducts();
    super.initState();
  }

  updateProducts() {
    setState(() {
      List<SingleProductInfoRes> _newProducts = widget.products;
      List<bool> tempIsFavProducts = List.filled(_newProducts.length, false);
      // for (int index = 0; index < _newProducts.length; index++) {
      //
      for (int indexOfProduct = 0;
          indexOfProduct < tempProducts.length;
          indexOfProduct++) {
        _newProducts.forEach((element) {
          if (tempProducts[indexOfProduct].barcode == element.barcode) {
            tempIsFavProducts[indexOfProduct] =
                !tempIsFavProducts[indexOfProduct];
          }
        });
      }
      // if (_newProducts[index].barcode == tempProducts[index].barcode) {
      //   tempIsFavProducts[index] = isFavProducts[index];
      // }
      // }
      // isFavProducts = ;
      tempProducts = widget.products;
      activeProducts = createActiveProducts(widget.products);
      print("widget.products.length : ${widget.products.length}");
      print("tempProducts.length : ${tempProducts.length}");
      print("activeProducts.length : ${activeProducts.length}");
    });
  }

  List<bool> createActiveProducts(List<SingleProductInfoRes> products) {
    // ignore: deprecated_member_use
    List<bool> activtionProducts = [];
    if (products != null &&
        products.length != 0 &&
        products.first.barcode != null) {
      for (int j = 0; j < products.length; j++) {
        bool isBreak = false;
        for (int i = 0; i < products[j].banimodeDetails.size.length; i++) {
          if (products[j].banimodeDetails.size[i].quantity != 0) {
            isBreak = true;
          }
        }
        isBreak ? activtionProducts.add(true) : activtionProducts.add(false);
      }
    }
    return activtionProducts;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    print("tempProducts.length : ${tempProducts.length}");
    print("activeProducts.length : ${activeProducts.length}");
    print("tempProducts : $tempProducts");
    print("widget.products : ${widget.products}");
    print("-------------------------------------------------------");
    if (tempProducts == null ||
        (tempProducts.length != widget.products.length &&
            tempProducts.length > 0 &&
            widget.products.length > 0) ||
        tempProducts.first.barcode != widget.products.first.barcode ||
        tempProducts.last.barcode != widget.products.last.barcode) {
      print(
          "aaaaaaaaaabbbbbbbbbbbbbbbbbbbbbccccccccccccccccccccddddddddddddddddddeeeeeeeeeeeee");
      setState(() {
        updateProducts();
      });
    }
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(
        right: widget.isGridView ? 9 : 0,
        left: widget.isGridView ? 9 : 0,
        bottom: 0,
        top: 5,
      ),
      width: _screenSize.width,
      child: tempProducts != null &&
              tempProducts.length > 0 &&
              tempProducts.first.barcode != null
          ? widget.isGridView
              ? ListView.builder(
                  itemCount: (tempProducts.length / 2).ceil(),
                  controller: scrollController,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            ProductInfoGridViewWidget(
                              width: ((_screenSize.width / 2) -
                                  (0.041 * _screenSize.width //15,
                                  )),
                              product: tempProducts[index * 2],
                              productIndex: index * 2,
                              hasDelete: false,
                              hasAddToFav: true,
                              isFave: false,
                              productIsActive: true,
                              addToCardFromFav: (int productIndex) {
                                setState(() {
                                  selectedProduct = productIndex;
                                });

                                widget.openAddToCardPanel(productIndex);
                              },
                              deleteFromFav: (int productIndex) {
                                setState(() {
                                  selectedProduct = productIndex;
                                });
                                // deleteProductPanel.open();
                              },
                              changeFav: (int indexOfProduct, bool newValue) {
                                setState(() {
                                  isFavProducts[indexOfProduct] = newValue;
                                });
                              },
                            ),
                            SizedBox(
                              width: 0.027 * _screenSize.width, //10,
                            ),
                            (tempProducts.length / 2).floor() > index
                                ? ProductInfoGridViewWidget(
                                    width: ((_screenSize.width / 2) -
                                        (0.041 * _screenSize.width //15,
                                        )),
                                    product: tempProducts[(index * 2) + 1],
                                    productIndex: (index * 2) + 1,
                                    hasDelete: false,
                                    hasAddToFav: true,
                                    // hasAddToFav: false,
                                    // isFave: isFavProducts[(index * 2) + 1],
                                    isFave: false,
                                    productIsActive: true,
                                    //    productIsActive:
                                    // activeProducts[(index * 2) + 1],
                                    addToCardFromFav: (int productIndex) {
                                      setState(() {
                                        selectedProduct = productIndex;
                                      });

                                      widget.openAddToCardPanel(productIndex);
                                    },
                                    deleteFromFav: (int productIndex) {
                                      setState(() {
                                        selectedProduct = productIndex;
                                      });
                                      // deleteProductPanel.open();
                                    },
                                    changeFav:
                                        (int indexOfProduct, bool newValue) {
                                      setState(() {
                                        isFavProducts[indexOfProduct] =
                                            newValue;
                                      });
                                    },
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(
                          height: 0.046 * _screenSize.height, //30
                        ),
                      ],
                    );
                  },
                )
              : ListView.builder(
                  itemCount: tempProducts.length,
                  controller: scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ProductInfoListViewWidget(
                          width: _screenSize.width,
                          product: tempProducts[index],
                          productIndex: index,
                          isFave: isFavProducts[index],
                          openAddToCardPanel: (int productIndex) {
                            setState(() {
                              selectedProduct = productIndex;
                            });

                            widget.openAddToCardPanel(productIndex);
                          },
                          changeFav: (int indexOfProduct, bool newValue) {
                            setState(() {
                              isFavProducts[indexOfProduct] = newValue;
                            });
                          },
                        ),
                        // SizedBox(
                        //   height: 0.046 * _screenSize.height, //30
                        // ),
                      ],
                    );
                  },
                )
          : SizedBox(),
      // ),
    );
  }
}
