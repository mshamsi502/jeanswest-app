// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/size-guid-product-widget.dart';
import 'package:jeanswest/src/ui/singleProduct/widgets/single_product_body_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SingleProductMainPage extends StatefulWidget {
  final SingleProductInfoRes product;
  final bool isFave;

  final Function(bool) changeFave;
  const SingleProductMainPage({
    Key key,
    @required this.product,
    @required this.isFave,
    @required this.changeFave,
  }) : super(key: key);
  @override
  _SingleProductMainPageState createState() => _SingleProductMainPageState();
}

class _SingleProductMainPageState extends State<SingleProductMainPage> {
  PanelController existInBranchesPanel = PanelController();
  PanelController sizeGuidePanel = PanelController();
  //
  ListOfProductsRes allColorsAndSizesProducts;

  @override
  void initState() {
    getAllColorsAndSizes(widget.product.styleCode).then((products) {
      setState(() {
        allColorsAndSizesProducts = products;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height,
            color: Colors.white,
            // color: Colors.red,
            child: SlidingUpPanel(
              controller: existInBranchesPanel,
              minHeight: 0,
              maxHeight: 0.7 * _screenSize.height, //??,
              backdropEnabled: true,
              onPanelClosed: () => FocusScope.of(context).unfocus(),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  0.03 * _screenSize.width, //11,
                ),
                topRight: Radius.circular(
                  0.03 * _screenSize.width, //11,
                ),
              ),
              panel: Container(
                color: Colors.red,
                height: 0.7 * _screenSize.height, //??,
              ),
              body: SlidingUpPanel(
                controller: sizeGuidePanel,
                minHeight: 0,
                maxHeight: 0.52 * _screenSize.height, //??,
                backdropEnabled: true,
                onPanelClosed: () => FocusScope.of(context).unfocus(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    0.03 * _screenSize.width, //11,
                  ),
                  topRight: Radius.circular(
                    0.03 * _screenSize.width, //11,
                  ),
                ),
                panel: Container(
                  height: 0.52 * _screenSize.height, //??,
                  child: SizeGuideProductWidget(
                    productDetail: allColorsAndSizesProducts,
                    height: 0.3,
                    hideSizeGuide: () => sizeGuidePanel.close(),
                  ),
                ),
                body: Column(children: [
                  SizedBox(height: 2.5),
                  AppBarWithBackWidget(
                    title: "",
                    option: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/images/svg_images/global/new/fi-rr-shopping-cart.svg',
                        color: Colors.black,
                        width: 23,
                        height: 23,
                      ),
                      onTap: () {
                        // ! Navigation to Shopping BAsket
                      },
                    ),
                    onTapBack: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 2.5),
                  Container(
                    height: 3,
                    color: F7_BACKGROUND_COLOR,
                  ),
                  Expanded(
                      child: SingleProductBodyWidget(
                    product: widget.product,
                    allColorsAndSizesProducts: allColorsAndSizesProducts,
                    isFave: widget.isFave,
                    changeFave: (bool newIsFave) =>
                        widget.changeFave(newIsFave),
                    openExistInBranchesPanel: () => existInBranchesPanel.open(),
                    openSizeGuidPanel: () => sizeGuidePanel.open(),
                  )),
                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: AvakatanButtonWidget(
                      title: "افزودن به سبد خرید",
                      backgroundColor: MAIN_BLUE_COLOR,
                      borderColor: MAIN_BLUE_COLOR,
                      textColor: Colors.white,
                      height: 43,
                      width: _screenSize.width,
                      onTap: () {
                        // ! addToCard
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
