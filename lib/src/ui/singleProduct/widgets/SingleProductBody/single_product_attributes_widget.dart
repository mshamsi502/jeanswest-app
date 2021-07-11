// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimode-detail-product-features-res.dart';

import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:intent/action.dart' as android_action;
import 'package:intent/intent.dart' as android_intent;

class SingleProductAttributesWidget extends StatefulWidget {
  final SingleProductInfoRes product;
  final List<String> titles;
  final List<String> shortDiscribtions;
  final List<List<BanimodeDetailsProductFeaturesRes>> features;

  const SingleProductAttributesWidget({
    Key key,
    @required this.product,
    this.titles = const ["ویژگی ها", "بررسی محصول"],
    @required this.shortDiscribtions,
    @required this.features,
  }) : super(key: key);
  @override
  _SingleProductAttributesWidgetState createState() =>
      _SingleProductAttributesWidgetState();
}

// product_description_short
class _SingleProductAttributesWidgetState
    extends State<SingleProductAttributesWidget> {
  ScrollController scrollController = new ScrollController();
  List<bool> isAllExpanded;
  @override
  void initState() {
    isAllExpanded = List.filled(widget.titles.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: 0.015 * _screenSize.height, //10,
        ),
        ListView.builder(
            itemCount: widget.titles.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                      height: index - 1 >= 0 && isAllExpanded[index - 1]
                          ? 0.015 * _screenSize.height //10,
                          : 0),
                  ConfigurableExpansionTile(
                    onExpansionChanged: (bool isExpanded) => setState(() {
                      isAllExpanded[index] = isExpanded;
                    }),
                    headerExpanded: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.054 * _screenSize.width, //20

                            right: 0.054 * _screenSize.width, //20

                            bottom: 0.011824 * _screenSize.height, //7,

                            top: 0.0078 * _screenSize.height //5,

                            ),
                        child: Text(
                          widget.titles[index],
                          style: TextStyle(
                              fontSize: 0.036 * _screenSize.width // 13
                              ),
                        ),
                      ),
                    ),
                    header: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.054 * _screenSize.width, //20

                            right: 0.054 * _screenSize.width, //20

                            bottom: 0.011824 * _screenSize.height, //7,

                            top: 0.0078 * _screenSize.height //5,

                            ),
                        child: Text(
                          widget.titles[index],
                          style: TextStyle(
                              fontSize: 0.036 * _screenSize.width // 13
                              ),
                        ),
                      ),
                    ),
                    animatedWidgetFollowingHeader: Padding(
                      padding: EdgeInsets.only(
                          left: 0.054 * _screenSize.width, //20

                          right: 0.054 * _screenSize.width, //20

                          bottom: 0.011824 * _screenSize.height, //7,

                          top: 0.0078 * _screenSize.height //5,

                          ),
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.grey[600],
                        size: 0.039 * _screenSize.height, //25,
                      ),
                    ),
                    headerAnimationTween: Tween<double>(begin: 0, end: 0),
                    animatedWidgetTween: Tween<double>(begin: -0.5, end: 0.5),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.054 * _screenSize.width, //20

                          vertical: 0.015 * _screenSize.height, //10,
                        ),
                        color: F2_BACKGROUND_COLOR,
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Html(
                              data: widget.shortDiscribtions[index],
                              style: {
                                "p": Style.fromTextStyle(
                                  TextStyle(
                                    fontSize: 0.0333 * _screenSize.width, //12,

                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                                "table": Style.fromTextStyle(
                                  TextStyle(
                                    fontSize: 0.0333 * _screenSize.width, //12,

                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                                "strong": Style.fromTextStyle(
                                  TextStyle(
                                    fontSize: 0.0333 * _screenSize.width, //12,

                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                "li": Style.fromTextStyle(
                                  TextStyle(
                                    fontSize: 0.0333 * _screenSize.width, //12,

                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                "a": Style.fromTextStyle(
                                  TextStyle(
                                    fontSize: 0.0333 * _screenSize.width, //12,

                                    fontWeight: FontWeight.w400,
                                    // color: Colors.black54,
                                  ),
                                ),
                              },
                              onLinkTap: (url) {
                                print("Opening $url ...");
                                String newURL = "";
                                String _scheme = "";
                                if (url.contains("https")) {
                                  newURL = url.replaceAll("https", "");
                                  _scheme = "https";
                                } else if (url.contains("http")) {
                                  newURL = url.replaceAll("http", "");
                                  _scheme = "http";
                                }
                                android_intent.Intent()
                                  ..setAction(android_action.Action.ACTION_VIEW)
                                  ..setData(Uri(scheme: _scheme, path: newURL))
                                  ..startActivity().catchError((e) => print(e));
                              },
                            ),
                            Text(
                              "مشخصات:",
                              style: TextStyle(
                                fontSize: 0.038 * _screenSize.width, //14,

                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ListView.builder(
                              itemCount: widget.features[index].length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context,
                                  int indexOfSingleProFeature) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.027 * _screenSize.width, //10,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 0.011 * _screenSize.width, //4,

                                        height: 0.011 * _screenSize.width, //4,

                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 0.015 * _screenSize.height, //10,
                                      ),
                                      Text(
                                        "${widget.features[index][indexOfSingleProFeature].title}:",
                                        style: TextStyle(
                                          fontSize:
                                              0.0333 * _screenSize.width, //12,

                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 0.0138 * _screenSize.width, //5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget
                                              .features[index]
                                                  [indexOfSingleProFeature]
                                              .value,
                                          style: TextStyle(
                                            fontSize: 0.0333 *
                                                _screenSize.width, //12,

                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: index == widget.titles.length - 1 &&
                              !isAllExpanded[index]
                          ? 0.0078*_screenSize.height//5,

                          : 0),
                  index == widget.titles.length - 1 || isAllExpanded[index]
                      ? SizedBox()
                      : Divider(
                          thickness: 0.0016 * _screenSize.height, //1
                        ),
                ],
              );
            }),
      ],
    );
  }
}
