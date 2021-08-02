// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/product-info-grid-view-widget.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/product-info-list-view-widget.dart';

class StoreMainBodyWidget extends StatefulWidget {
  final List<SingleProductInfoRes> products;
  final ScrollController listOfProductsScrollController;
  final Function(int) openAddToCardPanel;
  final bool isLoadingForGetting;

  final bool isGridView;
  const StoreMainBodyWidget({
    Key key,
    @required this.products,
    @required this.openAddToCardPanel,
    @required this.isGridView,
    @required this.listOfProductsScrollController,
    @required this.isLoadingForGetting,
  }) : super(key: key);
  @override
  _StoreMainBodyWidgetState createState() => _StoreMainBodyWidgetState();
}

class _StoreMainBodyWidgetState extends State<StoreMainBodyWidget>
    with SingleTickerProviderStateMixin {

  int selectedProduct;
  List<SingleProductInfoRes> tempProducts = [];
  bool tempIsGridView;
  List<bool> activeProducts = [];
  List<bool> isFavProducts = [];

  //
  double currentScrollPosition;
  int scrollOnIndex;
  //

  GifController controller;
  @override
  void initState() {
    controller = GifController(vsync: this);
    controller.repeat(min: 0, max: 29, period: Duration(milliseconds: 500));
    tempIsGridView = widget.isGridView;
    tempProducts = widget.products;
    isFavProducts = List.filled(tempProducts.length, false);
    updateProducts();
    widget.listOfProductsScrollController.addListener(() {
      currentScrollPosition =
          widget.listOfProductsScrollController.position.pixels;
      double _temp = (currentScrollPosition /
          widget.listOfProductsScrollController.position.maxScrollExtent *
          tempProducts.length);
      scrollOnIndex = tempIsGridView ? (_temp / 2).floor() : (_temp).floor();
      //
      Future.delayed(Duration(milliseconds: 300)).then((_) {
        if (widget.isLoadingForGetting)
          widget.listOfProductsScrollController.animateTo(
            widget.listOfProductsScrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
          );
      });
    });
    super.initState();
  }

  updateProducts() {
    setState(() {
      List<SingleProductInfoRes> _newProducts = widget.products;
      int minLength = _newProducts.length <= tempProducts.length
          ? _newProducts.length
          : tempProducts.length;
      int maxLength = _newProducts.length <= tempProducts.length
          ? tempProducts.length
          : _newProducts.length;

      List<bool> tempIsFavProducts = List.filled(maxLength, false);

      for (int indexOfProduct = 0;
          indexOfProduct < minLength;
          indexOfProduct++) {
        tempIsFavProducts[indexOfProduct] = isFavProducts[indexOfProduct];
      }

      isFavProducts = tempIsFavProducts;
      tempProducts = _newProducts;
      if (!tempIsGridView && widget.isGridView) {
        //
        scrollOnIndex = (scrollOnIndex / 2).floor();
        widget.listOfProductsScrollController.jumpTo(
            (scrollOnIndex / tempProducts.length) *
                widget.listOfProductsScrollController.position.maxScrollExtent);
      } else if (tempIsGridView && !widget.isGridView) {
        
        widget.listOfProductsScrollController.jumpTo(scrollOnIndex *
            widget.listOfProductsScrollController.position.maxScrollExtent);
      }
      tempIsGridView = widget.isGridView;
      activeProducts = createActiveProducts(tempProducts);

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
    // if (widget.isLoadingForGetting)
    //   widget.listOfProductsScrollController.animateTo(
    //     widget.listOfProductsScrollController.position.maxScrollExtent,
    //     duration: Duration(milliseconds: 100),
    //     curve: Curves.linear,
    //   );
    if (tempProducts == null ||
        tempProducts.length != widget.products.length ||
        tempProducts.first.barcode != widget.products.first.barcode ||
        tempIsGridView != widget.isGridView) {
      setState(() {
        updateProducts();
      });
    }

    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(
        right: widget.isGridView
            ? 0.025 * _screenSize.width //9,

            : 0,
        left: widget.isGridView
            ? 0.025 * _screenSize.width //9,
            : 0,
        bottom: 0,
        top: 0.0138 * _screenSize.width, //5,
      ),
      width: _screenSize.width,
      child: tempProducts != null && tempProducts.length > 0
          ? Column(
              children: [
                Expanded(
                  child: widget.isGridView
                      ? ListView.builder(
                          itemCount: (tempProducts.length / 2).ceil(),
                          controller: widget.listOfProductsScrollController,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int indexOfGrid) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    ProductInfoGridViewWidget(
                                      width: ((_screenSize.width / 2) -
                                          (0.041 * _screenSize.width //15,
                                          )),
                                      product: tempProducts[indexOfGrid * 2],
                                      productIndex: indexOfGrid * 2,
                                      hasDelete: false,
                                      hasAddToFav: true,
                                      isFave: isFavProducts[indexOfGrid * 2],
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
                                      changeFav:
                                          (int indexOfProduct, bool newValue) {
                                        setState(() {
                                          isFavProducts[indexOfProduct] =
                                              newValue;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 0.027 * _screenSize.width, //10,
                                    ),
                                    (tempProducts.length / 2).floor() >
                                            indexOfGrid
                                        ? ProductInfoGridViewWidget(
                                            width: ((_screenSize.width / 2) -
                                                (0.041 * _screenSize.width //15,
                                                )),
                                            product: tempProducts[
                                                (indexOfGrid * 2) + 1],
                                            productIndex: (indexOfGrid * 2) + 1,
                                            hasDelete: false,
                                            hasAddToFav: true,
                                            // hasAddToFav: false,
                                            isFave: isFavProducts[
                                                (indexOfGrid * 2) + 1],
                                            // isFave: false,
                                            productIsActive: true,
                                            //    productIsActive:
                                            // activeProducts[(index * 2) + 1],
                                            addToCardFromFav:
                                                (int productIndex) {
                                              setState(() {
                                                selectedProduct = productIndex;
                                              });

                                              widget.openAddToCardPanel(
                                                  productIndex);
                                            },
                                            deleteFromFav: (int productIndex) {
                                              setState(() {
                                                selectedProduct = productIndex;
                                              });
                                              // deleteProductPanel.open();
                                            },
                                            changeFav: (int indexOfProduct,
                                                bool newValue) {
                                              setState(() {
                                                isFavProducts[indexOfProduct] =
                                                    newValue;
                                              });
                                            },
                                          )
                                        : Container(),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 0.031 * _screenSize.height, //20,
                                // ),
                                widget.isLoadingForGetting &&
                                        indexOfGrid ==
                                            (tempProducts.length / 2).ceil() - 1
                                    ? Container(
                                        // margin: EdgeInsets.only(bottom: 15),
                                        width: 0.09 * _screenSize.width,
                                        height: 0.09 * _screenSize.width,
                                        child: GifImage(
                                          controller: controller,
                                          width:
                                              0.138 * _screenSize.width, //50,

                                          height:
                                              0.138 * _screenSize.width, //50,

                                          image: AssetImage(
                                              "assets/images/gif_images/global/loading.gif"),
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  height: 0.031 * _screenSize.height, //20,
                                ),
                              ],
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: tempProducts.length,
                          controller: widget.listOfProductsScrollController,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int indexOfList) {
                            return tempProducts[indexOfList] == null ||
                                    tempProducts[indexOfList].barcode == null ||
                                    indexOfList > tempProducts.length
                                ? SizedBox()
                                : Column(
                                    children: [
                                      ProductInfoListViewWidget(
                                        width: _screenSize.width,
                                        product: tempProducts[indexOfList],
                                        productIndex: indexOfList,
                                        isFave: isFavProducts[indexOfList],
                                        openAddToCardPanel: (int productIndex) {
                                          setState(() {
                                            selectedProduct = productIndex;
                                          });

                                          widget
                                              .openAddToCardPanel(productIndex);
                                        },
                                        changeFav: (int indexOfProduct,
                                            bool newValue) {
                                          setState(() {
                                            isFavProducts[indexOfProduct] =
                                                newValue;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                            0.031 * _screenSize.height, //20,
                                      ),
                                      widget.isLoadingForGetting &&
                                              indexOfList ==
                                                  tempProducts.length - 1
                                          ? Container(
                                              // margin: EdgeInsets.only(bottom: 15),
                                              width: 0.09 * _screenSize.width,
                                              height: 0.09 * _screenSize.width,
                                              child: GifImage(
                                                controller: controller,
                                                width: 0.138 *
                                                    _screenSize.width, //50,

                                                height: 0.138 *
                                                    _screenSize.width, //50,

                                                image: AssetImage(
                                                    "assets/images/gif_images/global/loading.gif"),
                                              ),
                                            )
                                          : SizedBox(),
                                      SizedBox(
                                        height:
                                            0.031 * _screenSize.height, //20,
                                      ),
                                    ],
                                  );
                          },
                        ),
                ),
              ],
            )
          : Center(
              child: Container(
                // width: 180,
                height: 0.28 * _screenSize.height, //180,
                // color: Colors.red,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg_images/store/category/no_exist_product.svg',
                      width: 0.38888 * _screenSize.width, //140,

                      height: 0.38888 * _screenSize.width, //140,
                    ),
                    SizedBox(
                      height: 0.015 * _screenSize.height, //10,
                    ),
                    Text("آیتم موردنظر شما موجود نیست.",
                        style: TextStyle(
                          fontSize: 0.0444 * _screenSize.width, //16,
                        )),
                  ],
                ),
              ),
            ),
      // ),
    );
  }
}
