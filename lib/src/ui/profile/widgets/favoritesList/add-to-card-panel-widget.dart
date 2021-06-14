// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/ui/profile/widgets/favoritesList/detail-product-widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/favoritesList/size-guid-product-widget.dart';

class AddToCardPanelWidget extends StatefulWidget {
  final ListOfProductsRes productDetail;
  final int selectedColor;
  final int selectedSize;
  final bool addToCardPanelIsClosed;
  final Function(int) changeSelectedColor;
  final Function(int) changeSelectedSize;
  final Function() closeAddToCardPanel;

  const AddToCardPanelWidget({
    Key key,
    this.closeAddToCardPanel,
    this.productDetail,
    this.selectedColor,
    this.selectedSize,
    this.changeSelectedColor,
    this.changeSelectedSize,
    this.addToCardPanelIsClosed,
  }) : super(key: key);
  @override
  _AddToCardPanelWidgetState createState() => _AddToCardPanelWidgetState();
}

class _AddToCardPanelWidgetState extends State<AddToCardPanelWidget> {
  bool showSizeGuid;
  @override
  void initState() {
    showSizeGuid = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.addToCardPanelIsClosed) {
      setState(() {
        showSizeGuid = false;
      });
    }
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      padding: EdgeInsets.symmetric(
        vertical: 0.008 * _screenSize.height, //5
      ),
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            0.0444 * _screenSize.width, //16
          ),
          topRight: Radius.circular(
            0.0444 * _screenSize.width, //16
          ),
        ),
      ),
      child: showSizeGuid
          ? SizeGuideProductWidget(
              productDetail: widget.productDetail,
              hideSizeGuide: () => setState(() {
                showSizeGuid = false;
              }),
            )
          : DetailProductWidget(
              productDetail: widget.productDetail.data,
              closeAddToCardPanel: widget.closeAddToCardPanel,
              selectedColor: widget.selectedColor,
              selectedSize: widget.selectedSize,
              changeSelectedColor: widget.changeSelectedColor,
              changeSelectedSize: widget.changeSelectedSize,
              showSizeGuid: () => setState(() {
                showSizeGuid = true;
              }),
            ),
    );
  }
}
