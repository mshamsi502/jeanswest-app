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
import 'package:jeanswest/src/models/branch/branch-for-product.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/size-guid-product-widget.dart';
import 'package:jeanswest/src/ui/singleProduct/widgets/panels/branch-detail-panel.dart';
import 'package:jeanswest/src/ui/singleProduct/widgets/panels/exist_in_branch_panel.dart';
import 'package:jeanswest/src/ui/singleProduct/widgets/panels/image_expanded_panel.dart';
import 'package:jeanswest/src/ui/singleProduct/widgets/single_product_body_widget.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getProduct/get-available-in-branch-info.dart';
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
  PanelController imageExpandedPanel = PanelController();
  PanelController directToBranchPanel = PanelController();
  PanelController existInBranchesPanel = PanelController();
  PanelController sizeGuidePanel = PanelController();
  //
  ListOfProductsRes allColorsAndSizesProducts;
  SingleProductInfoRes _selectedProduct;
//
  int _selectedSize = 0;
  List<BranchForProduct> _availableInBranches;
  BranchForProduct _selectedBranches;

  @override
  void initState() {
    _selectedProduct = widget.product;
    getAllColorsAndSizes(widget.product.styleCode).then((products) {
      setState(() {
        allColorsAndSizesProducts = products;
      });
    });
    updateAvailableInBranches();
    super.initState();
  }

  updateAvailableInBranches() async {
    print(
        "getting new AvailableInBranches whith reference : ${_selectedProduct.banimodeDetails.size[_selectedSize].reference}");
    List<BranchForProduct> tempAvailableInBranches =
        // await getAvailableInBranches(_selectedProduct.barcode);
        await getAvailableInBranches(
            _selectedProduct.banimodeDetails.size[_selectedSize].reference);
    setState(() {
      _availableInBranches = tempAvailableInBranches;
      _selectedBranches = tempAvailableInBranches.first;
    });
  }
  // 94591992-2010-120-1
  // 1901424420881051
  // 1901424461921051
  // 1901424420840051
  // 1901424420865051

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
              controller: imageExpandedPanel,
              minHeight: 0,
              maxHeight: _screenSize.height,
              backdropEnabled: true,
              onPanelClosed: () => FocusScope.of(context).unfocus(),
              panel: ImageExapndedPanel(
                product: _selectedProduct,
                closePanel: () => imageExpandedPanel.close(),
                screenSize: _screenSize,
              ),
              body: SlidingUpPanel(
                controller: directToBranchPanel,
                minHeight: 0,
                maxHeight: 0.4 * _screenSize.height, //??,
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
                panel: BranchDetailPanel(
                  selectedBranch: _selectedBranches,
                  close: () => directToBranchPanel.close(),
                ),
                // Container(
                //   color: Colors.amber,
                //   height: 0.3 * _screenSize.height, //??,
                // ),
                body: SlidingUpPanel(
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
                  panel: ExistInBranchPanel(
                    close: () => existInBranchesPanel.close(),
                    availableInBranches: _availableInBranches,
                    openBranchDetail: (BranchForProduct _branch) {
                      setState(() {
                        _selectedBranches = _branch;
                      });
                      existInBranchesPanel.close();
                      directToBranchPanel.open();
                    },
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
                        height: 0.0004687 * _screenSize.height, //0.3,

                        hideSizeGuide: () => sizeGuidePanel.close(),
                      ),
                    ),
                    body: Column(children: [
                      SizedBox(
                        height: 0.0039 * _screenSize.height, //2.5,
                      ),
                      AppBarWithBackWidget(
                        title: "",
                        option: GestureDetector(
                          child: SvgPicture.asset(
                            'assets/images/svg_images/global/new/fi-rr-shopping-cart.svg',
                            color: Colors.black,
                            width: 0.06388 * _screenSize.width, //23,

                            height: 0.06388 * _screenSize.width, //23,
                          ),
                          onTap: () {
                            // ! Navigation to Shopping BAsket
                          },
                        ),
                        onTapBack: () => Navigator.pop(context),
                      ),
                      SizedBox(
                        height: 0.0039 * _screenSize.height, //2.5,
                      ),
                      Container(
                        height: 0.0046 * _screenSize.height, //3,

                        color: F7_BACKGROUND_COLOR,
                      ),
                      Expanded(
                          child: SingleProductBodyWidget(
                        product: widget.product,
                        allColorsAndSizesProducts: allColorsAndSizesProducts,
                        isFave: widget.isFave,
                        changeFave: (bool newIsFave) =>
                            widget.changeFave(newIsFave),
                        openExistInBranchesPanel: () {
                          if (_availableInBranches != null &&
                              _availableInBranches.length > 0)
                            existInBranchesPanel.open();
                          else
                            showToast(
                              message:
                                  "این محصول با رنگ انختاب شده در هیچ شعبه ای موجود نیست!",
                              textColor: Colors.white,
                              backgroundColor: NERO_GREY_COLOR,
                            );
                        },
                        openSizeGuidPanel: () => sizeGuidePanel.open(),
                        updateSelectedProduct:
                            (SingleProductInfoRes _product) => setState(() {
                          _selectedProduct = _product;
                        }),
                        imageExpandedPanel: () => imageExpandedPanel.open(),
                        updateSelectedColor: (int newValue) {
                          setState(() {
                            _selectedSize = newValue;
                          });

                          updateAvailableInBranches();
                        },
                        openShoppingBasket: () {
                          // TODO : Navigate To Shopping BAsket Page
                        },
                      )),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.054 * _screenSize.width, //20
                          vertical: 0.041 * _screenSize.width, //15,
                        ),
                        child: AvakatanButtonWidget(
                          title: "افزودن به سبد خرید",
                          backgroundColor: MAIN_BLUE_COLOR,
                          borderColor: MAIN_BLUE_COLOR,
                          textColor: Colors.white,
                          height: 0.07263 * _screenSize.height, //43,

                          width: _screenSize.width,
                          onTap: () {
                            // ! addToCard
                          },
                        ),
                      ),
                      SizedBox(
                        height: 0.039 * _screenSize.height, //25,
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
