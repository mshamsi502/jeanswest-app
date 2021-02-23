// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/api_response/productRes/add-to-card-product-detail-res.dart';

class AddToCardPanelWidget extends StatefulWidget {
  final AddToCardProductDetailRes productDetail;
  final Function() closeAddToCardPanel;

  const AddToCardPanelWidget({
    Key key,
    this.closeAddToCardPanel,
    this.productDetail,
    // this.selectedProduct,
  }) : super(key: key);
  @override
  _AddToCardPanelWidgetState createState() => _AddToCardPanelWidgetState();
}

class _AddToCardPanelWidgetState extends State<AddToCardPanelWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 150,
      decoration: BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
    //
  }
}
