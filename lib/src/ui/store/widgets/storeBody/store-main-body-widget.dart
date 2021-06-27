// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/product-info-grid-view-widget.dart';

class StoreMainBodyWidget extends StatefulWidget {
  final List<SingleProductInfoRes> products;
  final Function() openAddToCardPanel;
  const StoreMainBodyWidget({
    Key key,
    @required this.products,
    @required this.openAddToCardPanel,
  }) : super(key: key);
  @override
  _StoreMainBodyWidgetState createState() => _StoreMainBodyWidgetState();
}

class _StoreMainBodyWidgetState extends State<StoreMainBodyWidget> {
  ScrollController scrollController = new ScrollController();

  int selectedProduct;
  List<SingleProductInfoRes> tempProducts = [];
  List<bool> activeProducts;

  @override
  void initState() {
    updateProducts();
    super.initState();
  }

  updateProducts() {
    setState(() {
      tempProducts = widget.products;
      activeProducts = createActiveProducts(widget.products);
      print("widget.products.length : ${widget.products.length}");
      print("activeProducts.length : ${activeProducts.length}");
    });
  }

  List<bool> createActiveProducts(List<SingleProductInfoRes> products) {
    // ignore: deprecated_member_use
    List<bool> activtionProducts = [];
    if (widget.products == null || widget.products.length == 0) {
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
    if (tempProducts != widget.products) updateProducts();
    return Container(
      width: _screenSize.width,
      // height: 60,
      // color: Colors.red,
      child: SingleChildScrollView(
        child: tempProducts != null && tempProducts.length > 0
            ? ListView.builder(
                itemCount: (tempProducts.length / 2).ceil(),
                controller: scrollController,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  // print("favProducts : ${favProducts.data.length}");
                  // print(
                  //     "styleCode of $index : ${favProducts.data[index * 2].styleCode}");
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
                            hasAddToFav: false,
                            // productIsActive: activeProducts[index * 2],
                            productIsActive: true,
                            addToCardFromFav: (int productIndex) {
                              setState(() {
                                selectedProduct = productIndex;
                              });
                              widget.openAddToCardPanel();
                            },
                            deleteFromFav: (int productIndex) {
                              setState(() {
                                selectedProduct = productIndex;
                              });
                              // deleteProductPanel.open();
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
                                  hasDelete: true,
                                  hasAddToFav: false,
                                  isFave: index == 0,
                                  productIsActive:
                                      activeProducts[(index * 2) + 1],
                                  addToCardFromFav: (int productIndex) {
                                    setState(() {
                                      selectedProduct = productIndex;
                                    });
                                    widget.openAddToCardPanel();
                                  },
                                  deleteFromFav: (int productIndex) {
                                    setState(() {
                                      selectedProduct = productIndex;
                                    });
                                    // deleteProductPanel.open();
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
            : SizedBox(),
      ),
    );
  }
}
