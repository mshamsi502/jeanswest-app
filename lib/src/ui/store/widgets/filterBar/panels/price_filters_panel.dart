// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';

class PriceFiltersPanel extends StatefulWidget {
  final int indexInOptionWidgets;
  final int minPrice;
  final int maxPrice;

  final Function(int, int) updatePriceLimit;

  const PriceFiltersPanel({
    Key key,
    @required this.indexInOptionWidgets,
    @required this.minPrice,
    @required this.maxPrice,
    @required this.updatePriceLimit,
  }) : super(key: key);
  @override
  _PriceFiltersPanelState createState() => _PriceFiltersPanelState();
}

class _PriceFiltersPanelState extends State<PriceFiltersPanel> {
  RangeValues selectedRange;
  int tempIndexInOptionWidgets;
  //
  @override
  void initState() {
    initialisePrice();
    super.initState();
  }

  initialisePrice() {
    setState(() {
      selectedRange = RangeValues(
        widget.minPrice.toDouble(),
        widget.maxPrice.toDouble(),
      );
      tempIndexInOptionWidgets = widget.indexInOptionWidgets;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (tempIndexInOptionWidgets != widget.indexInOptionWidgets)
      initialisePrice();

    return Column(
      children: [
        Container(
          width: _screenSize.width,
          // height: _screenSize.height,
          padding: EdgeInsets.symmetric(
            horizontal: 0.054 * _screenSize.width, //20

            vertical: 0.069 * _screenSize.width, //25,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 0.027 * _screenSize.width, //10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "از",
                        style: TextStyle(
                          fontSize: 0.038 * _screenSize.width, //14,

                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        width: 0.0138 * _screenSize.width, //5,
                      ),
                      Container(
                          width: 0.277 * _screenSize.width, //100,
                          height: 0.05468 * _screenSize.height, //35,

                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              0.0138 * _screenSize.width, //5,
                            ),
                            color: F2_BACKGROUND_COLOR,
                          ),
                          child: Text(
                            toPriceStyle(selectedRange.start.toInt()),
                            style: TextStyle(
                              fontSize: 0.0444 * _screenSize.width, //16,

                              fontWeight: FontWeight.w600,
                              color: MAIN_BLUE_COLOR,
                            ),
                          )),
                      SizedBox(
                        width: 0.0138 * _screenSize.width, //5,
                      ),
                      Text(
                        "تومان",
                        style: TextStyle(
                          fontSize: 0.038 * _screenSize.width, //14,

                          color: MAIN_BLUE_COLOR,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "تا",
                        style: TextStyle(
                          fontSize: 0.038 * _screenSize.width, //14,

                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        width: 0.0138 * _screenSize.width, //5,
                      ),
                      Container(
                          width: 0.277 * _screenSize.width, //100,

                          height: 0.05468 * _screenSize.height, //35,

                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              0.0138 * _screenSize.width, //5,
                            ),
                            color: F2_BACKGROUND_COLOR,
                          ),
                          child: Text(
                            toPriceStyle(selectedRange.end.toInt()),
                            style: TextStyle(
                              fontSize: 0.0444 * _screenSize.width, //16,

                              fontWeight: FontWeight.w600,
                              color: MAIN_BLUE_COLOR,
                            ),
                          )),
                      SizedBox(
                        width: 0.0138 * _screenSize.width, //5,
                      ),
                      Text(
                        "تومان",
                        style: TextStyle(
                          fontSize: 0.038 * _screenSize.width, //14,

                          color: MAIN_BLUE_COLOR,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 0.031 * _screenSize.height, //20,
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 0.0046 * _screenSize.height, //3,
                ),
                child: RangeSlider(
                  min: MIN_PRICE_CATEGORY,
                  max: MAX_PRICE_CATEGORY,
                  // divisions: 150,
                  divisions: MAX_PRICE_CATEGORY ~/ UNIT_PRICE_CATEGORY,
                  values: selectedRange,
                  activeColor: MAIN_BLUE_COLOR,
                  inactiveColor: F2_BACKGROUND_COLOR,
                  onChanged: (RangeValues value) {
                    setState(() {
                      selectedRange = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox()),
        // widget.indexInOptionWidgets <= 0
        //     ? SizedBox()
        //     :
        Padding(
          padding: EdgeInsets.all(
            0.054 * _screenSize.width, //20
          ),
          child: AvakatanButtonWidget(
            backgroundColor: MAIN_BLUE_COLOR,
            textColor: Colors.white,
            borderColor: MAIN_BLUE_COLOR,
            hasShadow: false,
            title: 'تایید',
            height: 0.07 * _screenSize.height, //45,
            width: _screenSize.width,
            fontSize: 0.05 * _screenSize.width, //18,
            radius: 0.011 * _screenSize.width, //4,
            onTap: () {
              // print("002222222222222220000");
              widget.updatePriceLimit(
                selectedRange.start.toInt(),
                selectedRange.end.toInt(),
              );
            },
          ),
        ),
        SizedBox(
          height: 0.1328 * _screenSize.height, //85,
        ),
      ],
    );
  }
}
