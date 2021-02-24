// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';

class AddToCardPanelWidget extends StatefulWidget {
  final ListOfProductsRes productDetail;
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
  ScrollController scrollController;
  int selectedColor;
  @override
  void initState() {
    selectedColor = 0;
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 150,
      width: _screenSize.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(11),
          topRight: Radius.circular(11),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Text("انتخاب رنگ : "),
                Text(
                    "( ${widget.productDetail.data[selectedColor].banimodeDetails.colorName} )"),
              ],
            ),
          ),
          Container(
            height: 100,
            width: _screenSize.width,
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.productDetail.data.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    SizedBox(width: index == 0 ? 15 : 0),
                    GestureDetector(
                      child: Container(
                        width: 70,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.grey[300],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.network(
                                widget.productDetail.data[index].banimodeDetails
                                        .images.homeDefault[0] ??
                                    EMPTY_IMAGE,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              color: index == selectedColor
                                  ? GREY_FADE_SELECTED_COLOR
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      onTap: () => setState(() {
                        selectedColor = index;
                      }),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: index == widget.productDetail.data.length - 1
                          ? 10
                          : 0,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Text("انتخاب رنگ : "),
                Text(
                    "( ${widget.productDetail.data[selectedColor].banimodeDetails.colorName} )"),
              ],
            ),
          ),
          Container(
            height: 100,
            width: _screenSize.width,
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.productDetail.data.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    SizedBox(width: index == 0 ? 15 : 0),
                    GestureDetector(
                      child: Container(
                        width: 70,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.grey[300],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.network(
                                widget.productDetail.data[index].banimodeDetails
                                        .images.homeDefault[0] ??
                                    EMPTY_IMAGE,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              color: index == selectedColor
                                  ? GREY_FADE_SELECTED_COLOR
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      onTap: () => setState(() {
                        selectedColor = index;
                      }),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: index == widget.productDetail.data.length - 1
                          ? 10
                          : 0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
    //
  }
}
