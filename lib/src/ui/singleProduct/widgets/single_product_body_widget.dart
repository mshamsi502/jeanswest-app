// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';

import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/detail-product-widget.dart';
import 'package:jeanswest/src/ui/singleProduct/widgets/SingleProductBody/single_product_attributes_widget.dart';
import 'package:jeanswest/src/ui/singleProduct/widgets/SingleProductBody/single_product_main_info_widget.dart';
import 'package:jeanswest/src/ui/singleProduct/widgets/SingleProductBody/single_product_similar_widget.dart';

class SingleProductBodyWidget extends StatefulWidget {
  final SingleProductInfoRes product;
  final ListOfProductsRes allColorsAndSizesProducts;
  final ListOfProductsRes relatedProducts;
  final bool isFave;
  final Function(bool) changeFave;

  final Function() imageExpandedPanel;
  final Function() openExistInBranchesPanel;
  final Function() openSizeGuidPanel;
  final Function() openShoppingBasket;
  final Function(int) updateSelectedColor;
  final Function(SingleProductInfoRes) updateSelectedProduct;
  const SingleProductBodyWidget({
    Key key,
    @required this.product,
    @required this.isFave,
    @required this.changeFave,
    @required this.openExistInBranchesPanel,
    @required this.openSizeGuidPanel,
    @required this.allColorsAndSizesProducts,
    @required this.relatedProducts,
    @required this.updateSelectedProduct,
    @required this.imageExpandedPanel,
    @required this.updateSelectedColor,
    @required this.openShoppingBasket,
  }) : super(key: key);
  @override
  _SingleProductBodyWidgetState createState() =>
      _SingleProductBodyWidgetState();
}

class _SingleProductBodyWidgetState extends State<SingleProductBodyWidget> {
  ScrollController scrollController = new ScrollController();
  //
  int selectedColor;
  int selectedSize;
  SingleProductInfoRes _selectedProduct;
  @override
  void initState() {
    selectedColor = 0;
    selectedSize = -1;
    _selectedProduct = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      // color: Colors.red,
      height: _screenSize.height,
      width: _screenSize.width,
      child: widget.allColorsAndSizesProducts == null ||
              widget.allColorsAndSizesProducts.data == null ||
              widget.allColorsAndSizesProducts.data.result == null ||
              widget.allColorsAndSizesProducts.data.result.length == 0 ||
              widget.relatedProducts == null ||
              widget.relatedProducts.data == null ||
              widget.relatedProducts.data.result == null ||
              widget.relatedProducts.data.result.length == null
          ? SizedBox()
          : SingleChildScrollView(
              controller: scrollController,
              child: Container(
                width: _screenSize.width,
                child: Column(
                  children: [
                    SingleProductMainInfoWidget(
                      changeFave: (bool newIsFave) =>
                          widget.changeFave(newIsFave),
                      isFave: widget.isFave,
                      product: _selectedProduct,
                      openImageExpandedPanel: () => widget.imageExpandedPanel(),
                      openExistInBranches: () =>
                          widget.openExistInBranchesPanel(),
                    ),
                    Container(
                      height: 0.0125 * _screenSize.height, //8,

                      color: F7_BACKGROUND_COLOR,
                    ),
                    widget.allColorsAndSizesProducts == null ||
                            widget.allColorsAndSizesProducts.data == null
                        ? SizedBox()
                        : DetailProductWidget(
                            isAddToCardPanel: false,
                            productDetail:
                                widget.allColorsAndSizesProducts.data,
                            selectedColor: selectedColor,
                            selectedSize: selectedSize,
                            showSizeGuid: () => widget.openSizeGuidPanel(),
                            changeSelectedColor: (int value) => setState(() {
                              selectedColor = value;
                              _selectedProduct = widget
                                  .allColorsAndSizesProducts.data.result[value];
                              widget.updateSelectedProduct(_selectedProduct);
                              widget.updateSelectedColor(selectedColor);
                              selectedSize = -1;
                            }),
                            changeSelectedSize: (int value) => setState(() {
                              selectedSize = value;
                            }),
                            closeAddToCardPanel: () {},
                          ),
                    SizedBox(
                      height: 0.023 * _screenSize.height, //15
                    ),
                    Container(
                      height: 0.0125 * _screenSize.height, //8,

                      color: F7_BACKGROUND_COLOR,
                    ),
                    SingleProductAttributesWidget(
                      product: _selectedProduct,
                      titles: ["ویژگی ها"],
                      shortDiscribtions: [
                        widget.product.banimodeDetails.productDescriptionShort
                      ],
                      features: [
                        widget.product.banimodeDetails.productFeatures
                      ],
                    ),
                    Container(
                      height: 0.0125 * _screenSize.height, //8,

                      color: F7_BACKGROUND_COLOR,
                    ),
                    widget.allColorsAndSizesProducts != null &&
                            widget.allColorsAndSizesProducts.data != null &&
                            widget.allColorsAndSizesProducts.data.result !=
                                null &&
                            widget.allColorsAndSizesProducts.data.result
                                    .length >
                                0
                        ? Column(
                            children: [
                              SingleProductSimilarWidget(
                                similarProducts:
                                    // [],
                                    // widget.allColorsAndSizesProducts.data.result,
                                    widget.relatedProducts.data.result,
                              ),
                              Container(
                                height: 0.0125 * _screenSize.height, //8,

                                color: F7_BACKGROUND_COLOR,
                              ),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
    );
  }
}
