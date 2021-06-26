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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "از",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                          width: 100,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: F2_BACKGROUND_COLOR,
                          ),
                          child: Text(
                            toPriceStyle(selectedRange.start.toInt()),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: MAIN_BLUE_COLOR,
                            ),
                          )),
                      SizedBox(width: 5),
                      Text(
                        "تومان",
                        style: TextStyle(
                          fontSize: 14,
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
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                          width: 100,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: F2_BACKGROUND_COLOR,
                          ),
                          child: Text(
                            toPriceStyle(selectedRange.end.toInt()),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: MAIN_BLUE_COLOR,
                            ),
                          )),
                      SizedBox(width: 5),
                      Text(
                        "تومان",
                        style: TextStyle(
                          fontSize: 14,
                          color: MAIN_BLUE_COLOR,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 3,
                ),
                child: RangeSlider(
                  min: minPriceCategoty,
                  max: maxPriceCategoty,
                  // divisions: 150,
                  divisions: maxPriceCategoty ~/ unitPriceCategoty,
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
          padding: const EdgeInsets.all(20),
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
      ],
    );
  }
}
