// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:jeanswest/src/ui/global/widgets/dropDown/custom_dropdown_button_widget.dart';

class SizeFiltersPanel extends StatefulWidget {
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
  }) : super(key: key);
  @override
  _SizeFiltersPanelState createState() => _SizeFiltersPanelState();
}

class _SizeFiltersPanelState extends State<SizeFiltersPanel> {
  ScrollController scrollController = new ScrollController();
  ScrollController labelScrollController = new ScrollController();
  //
  List<Map<String, bool>> tempSizesValue = [];
  bool selectAllStatus = false;
  bool notSelected = true;
  //
  List<Widget> dropDownItems = [];
  //
  @override
  void initState() {
    tempSizesValue = widget.sizeValue;
    dropDownItems = createDropDownsSizes(widget.mediaQuery);
    super.initState();
  }

  List<Widget> createDropDownsSizes(MediaQueryData mediaQuery) {
    // print("sizeTitles : ${widget.sizeTitles}");
    print("sizeValue : ${widget.sizeValue}");
    List<Widget> tempDropDownItems = [];
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
                widget.sizeValue[widget.sizeTitles.length - index - 1],
            updateCheckBoxValue: (Map<String, bool> newValue) => setState(() {
              tempSizesValue[index] = newValue;
            }),
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

    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: dropDownItems,
      ),
    );
  }

  Map<String, bool> createCheckBoxValue(List<String> titles, List<bool> list) {
    Map<String, bool> map = {};
    int index = 0;
    titles.forEach((element) {
      map[element] = list[index];
      index++;
    });
    return map;
  }
}
