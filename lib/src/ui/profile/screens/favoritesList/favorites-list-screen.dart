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

  @override
  void initState() {
    scrollController = new ScrollController();
    deleteProductPanel = new PanelController();
    addToCardPanel = new PanelController();
    selectedProduct = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    print('${(widget.products.data.result.length / 2).ceil()}');
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: SlidingUpPanel(
            controller: deleteProductPanel,
            minHeight: 0,
            maxHeight: 150,
            backdropEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            panel: DeletePanelWidget(
                height: 150,
                selectedProduct: selectedProduct,
                closeDeletePanel: () {
                  setState(() {});
                  deleteProductPanel.close();
                }),
            body: SlidingUpPanel(
              controller: addToCardPanel,
              minHeight: 0,
              maxHeight: 300,
              backdropEnabled: true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              panel: AddToCardPanelWidget(
                productDetail: addToCardProductDetailRes,
                closeAddToCardPanel: () => addToCardPanel.close(),
              ),
              body: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 5,
                  ),
                  AppBarWithBackWidget(
                    title: widget.title,
                    onTap: () => Navigator.pop(context),
                  ),
                  Container(
                    color: Colors.white,
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey[300],
                    height: 3,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: _screenSize.height - 70,
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
                                    width: ((_screenSize.width / 2) - 15),
                                    product:
                                        widget.products.data.result[index * 2],
                                    productIndex: index * 2,
                                    hasDelete: true,
                                    hasAddToFav: false,
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
                                  SizedBox(width: 10),
                                  (widget.products.data.result.length / 2)
                                              .floor() >
                                          index
                                      ? ProductInfoGridViewWidget(
                                          width: ((_screenSize.width / 2) - 15),
                                          product: widget.products.data
                                              .result[(index * 2) + 1],
                                          productIndex: (index * 2) + 1,
                                          hasDelete: true,
                                          hasAddToFav: false,
                                          isFave: index == 0,
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
                                        )
                                      : Container(),
                                ],
                              ),
                              SizedBox(height: 30),
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
    );
  }
}
