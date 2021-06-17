// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';

class PriceFiltersPanel extends StatefulWidget {
  final int minPrice;
  final int maxPrice;

  final Function(int, int) updatePriceLimit;

  const PriceFiltersPanel({
    Key key,
    @required this.minPrice,
    @required this.maxPrice,
    @required this.updatePriceLimit,
  }) : super(key: key);
  @override
  _PriceFiltersPanelState createState() => _PriceFiltersPanelState();
}

class _PriceFiltersPanelState extends State<PriceFiltersPanel> {
  RangeValues selectedRange;
  //
  @override
  void initState() {
    selectedRange = RangeValues(
      widget.minPrice.toDouble(),
      widget.maxPrice.toDouble(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
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
              min: 0,
              values: selectedRange,
              max: 10000000,
              divisions: 10,
              activeColor: MAIN_BLUE_COLOR,
              inactiveColor: F2_BACKGROUND_COLOR,
              onChanged: (RangeValues value) {
                widget.updatePriceLimit(value.start.toInt(), value.end.toInt());
                setState(() {
                  selectedRange = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
