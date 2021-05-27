//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter_html/flutter_html.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/profile/user/user-copouns-info.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter/material.dart';
import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';

class CopounDetailPanelWidget extends StatefulWidget {
  final UserCouponsInfo coupon;
  final Function() closePanel;

  const CopounDetailPanelWidget({
    Key key,
    this.coupon,
    this.closePanel,
  }) : super(key: key);

  State<StatefulWidget> createState() => _CopounDetailPanelWidgetState();
}

class _CopounDetailPanelWidgetState extends State<CopounDetailPanelWidget> {
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.027 * _screenSize.width, //10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            0.03 * _screenSize.width, //11
          ),
          topRight: Radius.circular(
            0.03 * _screenSize.width, //11
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.016 * _screenSize.height //10
              ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.coupon.promotionPoint.name,
                        style: TextStyle(
                          fontSize: 0.0444 * _screenSize.width, //16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(
                          0.0138 * _screenSize.width, //5
                        ),
                        child: Icon(
                          Icons.close,
                          size: 0.069 * _screenSize.width, //25,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () => widget.closePanel(),
                    ),
                  ],
                ),
                SizedBox(height: 0.016 * _screenSize.height //10
                    ),
                SingleChildScrollView(
                  controller: scrollController,
                  child: widget.coupon.promotionPoint.description != null
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Html(
                              data: widget
                                  .coupon.promotionPoint.description.context,
                              onLinkTap: (url) {
                                print("Opening $url ...");
                              },
                              customTextStyle: (node, style) {
                                TextStyle defaultStyle = style.apply(
                                    fontSizeFactor: (style.fontSize /
                                            360 *
                                            _screenSize.width) /
                                        style.fontSize);
                                if (node is dom.Element) {
                                  switch (node.localName) {
                                    case "custom_tag": // using this, you can handle custom tags in your HTML
                                      return TextStyle(
                                        fontSize:
                                            0.038 * _screenSize.width, //14,
                                        fontWeight: FontWeight.w400,
                                      );
                                    // case "h1": // using this, you can handle custom tags in your HTML
                                    //   return TextStyle(
                                    //     fontSize: 14,
                                    //     fontWeight: FontWeight.w500,
                                    //   );
                                    //! add styles
                                    default:
                                      {
                                        return defaultStyle;
                                      }
                                  }
                                }
                                return defaultStyle;
                              },
                              customRender: (node, children) {
                                if (node is dom.Element) {
                                  switch (node.localName) {
                                    case "custom_tag": // using this, you can handle custom tags in your HTML
                                      return Column(children: children);
                                  }
                                }
                                return null;
                              },
                              customTextAlign: (node) {
                                return TextAlign.right;
                              }),
                        )
                      : Container(
                          height: 0.234 * _screenSize.height, //150,
                          alignment: Alignment.center,
                          color: Colors.amber[200],
                          child: Text(
                            "اطلاعاتی برای نمایش وجود ندارد",
                            style: TextStyle(
                              fontSize: 0.038 * _screenSize.width, //14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 0.027 * _screenSize.width, //10,
                ),
                widget.coupon.price == null || widget.coupon.price == 0
                    ? SizedBox()
                    : Row(
                        children: [
                          Text(
                            "${toPriceStyle(widget.coupon.price)} تومان",
                            style: TextStyle(
                              fontSize: 0.038 * _screenSize.width, //14,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 0.027 * _screenSize.width, //10,
          ),
          Expanded(child: SizedBox()),
          AvakatanButtonWidget(
            backgroundColor: MAIN_BLUE_COLOR,
            textColor: Colors.white,
            borderColor: Colors.transparent,
            title: 'بریم خرید',
            width: _screenSize.width -
                (0.166 * _screenSize.width //60,
                ),
            height: 0.0625 * _screenSize.height, //40
            onTap: () {
              // widget.confirmDate(false, _dayValue, _monthValue, _yearValue);
            },
            radius: 0.008 * _screenSize.height, //5
            fontSize: 0.038 * _screenSize.width, //14,
          ),
          SizedBox(
            height: 0.031 * _screenSize.height, //20,
          ),
        ],
      ),
    );
  }
}
