// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/product-info-grid-view-widget.dart';

class SingleProductSimilarWidget extends StatefulWidget {
  final List<SingleProductInfoRes> similarProducts;

  const SingleProductSimilarWidget({
    Key key,
    @required this.similarProducts,
  }) : super(key: key);
  @override
  _SingleProductSimilarWidgetState createState() =>
      _SingleProductSimilarWidgetState();
}

// product_description_short
class _SingleProductSimilarWidgetState
    extends State<SingleProductSimilarWidget> {
  ScrollController scrollController = new ScrollController();
  // List<bool> isAllExpanded;
  // @override
  // void initState() {
  //   isAllExpanded = List.filled(widget.titles.length, false);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      height: 380,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.023 * _screenSize.height, //15
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "محصولات مرتبط",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: widget.similarProducts.length,
              controller: scrollController,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ProductInfoGridViewWidget(
                    width: 180,
                    product: widget.similarProducts[index],
                    productIndex: index,
                    hasDelete: false,
                    hasAddToFav: true,
                    isFave: false,
                    productIsActive: true,
                    addToCardFromFav: (int productIndex) {},
                    addToCardIsActive: false,
                    deleteFromFav: (int productIndex) {},
                    changeFav: (int indexOfProduct, bool newValue) {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
