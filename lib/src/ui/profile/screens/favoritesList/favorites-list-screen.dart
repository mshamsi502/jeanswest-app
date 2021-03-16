// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFavorite/user-favorite-info-res.dart';
import 'package:jeanswest/src/ui/profile/widgets/favoritesList/add-to-card-panel-widget.dart';
import 'package:jeanswest/src/constants/global/globalInstances/product-add-to-card-info.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/product-info-grid-view-widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/favoritesList/delete-panel-widget.dart';

class FavoritesListScreen extends StatefulWidget {
  final String title;
  final UserFavoriteInfoRes products;

  const FavoritesListScreen({
    Key key,
    this.products,
    this.title,
  }) : super(key: key);
  @override
  _FavoritesListScreenState createState() => _FavoritesListScreenState();
}

class _FavoritesListScreenState extends State<FavoritesListScreen> {
  ScrollController scrollController;
  PanelController deleteProductPanel;
  PanelController addToCardPanel;
  int selectedProduct;
  List<bool> activeProducts;
  //
  int selectedColor;
  int selectedSize;

  @override
  void initState() {
    scrollController = new ScrollController();
    deleteProductPanel = new PanelController();
    addToCardPanel = new PanelController();
    activeProducts = createActiveProducts();
    selectedProduct = 0;
    selectedColor = 0;
    selectedSize = -1;
    //

    super.initState();
  }

  List<bool> createActiveProducts() {
    // ignore: deprecated_member_use
    List<bool> activtionProducts = new List<bool>();
    for (int j = 0; j < widget.products.data.result.length; j++) {
      bool isBreak = false;
      for (int i = 0;
          i < widget.products.data.result[j].banimodeDetails.size.length;
          i++) {
        if (widget.products.data.result[j].banimodeDetails.size[i].quantity !=
            0) {
          isBreak = true;
        }
      }
      isBreak ? activtionProducts.add(true) : activtionProducts.add(false);
    }
    return activtionProducts;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    print('${(widget.products.data.result.length / 2).ceil()}');
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (addToCardPanel.isPanelOpen)
              return await backPanelClose(addToCardPanel, context);
            if (deleteProductPanel.isPanelOpen)
              return await backPanelClose(deleteProductPanel, context);
            return false;
          },
          child: Scaffold(
            body: SlidingUpPanel(
              controller: deleteProductPanel,
              minHeight: 0,
              maxHeight: 0.234 * _screenSize.height, //150,
              backdropEnabled: true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  0.083 * _screenSize.width, //30
                ),
                topRight: Radius.circular(
                  0.083 * _screenSize.width, //30
                ),
              ),
              panel: DeletePanelWidget(
                  height: 0.234 * _screenSize.height, //150,
                  selectedProduct: selectedProduct,
                  closeDeletePanel: () {
                    setState(() {});
                    deleteProductPanel.close();
                    // ignore: deprecated_member_use
                    List<bool> activtionProducts = new List<bool>();
                    activtionProducts = createActiveProducts();
                    setState(() {
                      activeProducts = activtionProducts;
                    });
                  }),
              body: SlidingUpPanel(
                controller: addToCardPanel,
                minHeight: 0,
                maxHeight: 0.6587 * _screenSize.height, //390,
                backdropEnabled: true,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    0.083 * _screenSize.width, //30
                  ),
                  topRight: Radius.circular(
                    0.083 * _screenSize.width, //30
                  ),
                ),
                onPanelClosed: () => setState(() {
                  selectedColor = 0;
                  selectedSize = -1;
                }),
                panel: AddToCardPanelWidget(
                  productDetail: addToCardProductDetailRes,
                  closeAddToCardPanel: () => addToCardPanel.close(),
                  selectedColor: selectedColor,
                  selectedSize: selectedSize,
                  changeSelectedColor: (int value) => setState(() {
                    selectedColor = value;
                  }),
                  changeSelectedSize: (int value) => setState(() {
                    selectedSize = value;
                  }),
                ),
                body: Column(
                  children: [
                    AppBarWithBackWidget(
                      title: widget.title,
                      onTap: () => Navigator.pop(context),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 0.008 * _screenSize.height, //5
                      ),
                      color: Colors.grey[300],
                      height: 0.0046 * _screenSize.height, //3,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.027 * _screenSize.width, //10,
                      ),
                      height: _screenSize.height -
                          (0.19 * _screenSize.width //70
                          ),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          itemCount:
                              (widget.products.data.result.length / 2).ceil(),
                          controller: scrollController,
                          // physics: NeverScrollableScrollPhysics(),
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
                                      product: widget
                                          .products.data.result[index * 2],
                                      productIndex: index * 2,
                                      hasDelete: true,
                                      hasAddToFav: false,
                                      productIsActive:
                                          activeProducts[index * 2],
                                      addToCardFromFav: (int productIndex) {
                                        setState(() {
                                          selectedProduct = productIndex;
                                        });
                                        addToCardPanel.open();
                                      },
                                      deleteFromFav: (int productIndex) {
                                        setState(() {
                                          selectedProduct = productIndex;
                                        });
                                        deleteProductPanel.open();
                                      },
                                    ),
                                    SizedBox(
                                      width: 0.027 * _screenSize.width, //10,
                                    ),
                                    (widget.products.data.result.length / 2)
                                                .floor() >
                                            index
                                        ? ProductInfoGridViewWidget(
                                            width: ((_screenSize.width / 2) -
                                                (0.041 * _screenSize.width //15,
                                                )),
                                            product: widget.products.data
                                                .result[(index * 2) + 1],
                                            productIndex: (index * 2) + 1,
                                            hasDelete: true,
                                            hasAddToFav: false,
                                            isFave: index == 0,
                                            productIsActive:
                                                activeProducts[(index * 2) + 1],
                                            addToCardFromFav:
                                                (int productIndex) {
                                              setState(() {
                                                selectedProduct = productIndex;
                                              });
                                              addToCardPanel.open();
                                            },
                                            deleteFromFav: (int productIndex) {
                                              setState(() {
                                                selectedProduct = productIndex;
                                              });
                                              deleteProductPanel.open();
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
