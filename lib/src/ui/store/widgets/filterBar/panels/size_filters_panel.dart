// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

import 'package:jeanswest/src/ui/global/widgets/dropDown/custom_dropdown_button_widget.dart';

class SizeFiltersPanel extends StatefulWidget {
  final int indexInOptionWidgets;
  final List<String> titles;
  final Map<String, List<String>> sizeTitles;
  final List<Map<String, bool>> sizeValue;
  final MediaQueryData mediaQuery;
  final Function(List<Map<String, bool>>) updateSizesValue;

  const SizeFiltersPanel({
    Key key,
    @required this.titles,
    @required this.sizeTitles,
    @required this.mediaQuery,
    @required this.updateSizesValue,
    @required this.sizeValue,
    @required this.indexInOptionWidgets,
  }) : super(key: key);
  @override
  _SizeFiltersPanelState createState() => _SizeFiltersPanelState();
}

class _SizeFiltersPanelState extends State<SizeFiltersPanel> {
  ScrollController scrollController = new ScrollController();
  ScrollController labelScrollController = new ScrollController();
  //
  List<Map<String, bool>> tempSizesValue = [];
  List<Widget> dropDownItems = [];
  int tempIndexInOptionWidgets;
  //
  @override
  void initState() {
    initializeValues();

    super.initState();
  }

  initializeValues() {
    setState(() {
      tempIndexInOptionWidgets = widget.indexInOptionWidgets;
      tempSizesValue = widget.sizeValue;
      dropDownItems = createDropDownsSizes(widget.mediaQuery);
    });
  }

  List<Widget> createDropDownsSizes(MediaQueryData mediaQuery) {
    List<Widget> tempDropDownItems = [];
    print("drop downs recreate");
    for (int index = 0; index < widget.sizeTitles.length; index++) {
      tempDropDownItems.add(
        Positioned(
          top: ((100 * (widget.sizeTitles.length - index - 1)).toDouble()),
          child: CustomDropdownButtonWidget(
            title: widget.sizeTitles.keys
                .elementAt(widget.sizeTitles.length - index - 1),
            hintTitle: "",
            titleColor: Colors.black,
            hasCheckBox: true,
            options: widget.sizeTitles[widget.sizeTitles.keys
                .elementAt(widget.sizeTitles.length - index - 1)],
            mediaQuery: mediaQuery,
            initialCheckBoxValue:
                // widget.sizeValue[widget.sizeTitles.length - index - 1],
                tempSizesValue[widget.sizeTitles.length - index - 1],
            // updateCheckBoxValue: (Map<String, bool> newValue) => setState(() {
            // tempSizesValue[index] = newValue;
            // }),
            selected: (String _selectedOption) {},
          ),
        ),
      );
    }
    return tempDropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (tempIndexInOptionWidgets != widget.indexInOptionWidgets) {
      initializeValues();
    }

    // print("widget.sizeValue : ${widget.sizeValue}");
    // print("tempSizesValue : $tempSizesValue");
    return Column(
      children: [
        Expanded(
          child: Container(
            height: _screenSize.height,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: dropDownItems,
            ),
          ),
        ),
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
            title: 'اعمال فیلتر',
            height: 0.07 * _screenSize.height, //45,
            width: _screenSize.width,
            fontSize: 0.05 * _screenSize.width, //18,
            radius: 0.011 * _screenSize.width, //4,
            onTap: () {
              widget.updateSizesValue(tempSizesValue);
            },
          ),
        ),
      ],
    );
  }
}
