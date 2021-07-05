// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';

class SortByPanel extends StatefulWidget {
  final int selectedSort;
  final Function() closeSortByPanel;
  final Function(int) updateSelectedSortOption;

  const SortByPanel({
    Key key,
    @required this.closeSortByPanel,
    @required this.selectedSort,
    @required this.updateSelectedSortOption,
  }) : super(key: key);
  @override
  _SortByPanelState createState() => _SortByPanelState();
}

class _SortByPanelState extends State<SortByPanel> {
  ScrollController scrollController = new ScrollController();
  int tempSelectedSort;

  //
  @override
  void initState() {
    tempSelectedSort = widget.selectedSort;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      // height: 0.3 * _screenSize.height,
      width: _screenSize.width,
      padding: EdgeInsets.symmetric(
        horizontal: 0.054 * _screenSize.width, //20
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'مرتب سازی',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Expanded(child: SizedBox()),
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
                onTap: () => widget.closeSortByPanel(),
              ),
            ],
          ),
          Container(
            height: 0.3 * _screenSize.height, //300,
            child: ListView.builder(
              itemCount: sortOptionsName.length,
              shrinkWrap: true,
              controller: scrollController,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // color: Colors.red,
                  height: 35,
                  alignment: Alignment.center,
                  // margin: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      IconButton(
                        icon: tempSelectedSort == index
                            ? Icon(
                                Icons.radio_button_on,
                                color: MAIN_BLUE_COLOR,
                                size: 23,
                              )
                            : Icon(
                                Icons.radio_button_unchecked,
                                color: Colors.grey,
                                size: 23,
                              ),
                        onPressed: () {
                          widget.updateSelectedSortOption(index);
                          setState(() {
                            tempSelectedSort = index;
                          });
                          widget.closeSortByPanel();
                        },
                      ),
                      Text(
                        sortOptionsName[index],
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
