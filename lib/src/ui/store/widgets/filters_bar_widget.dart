// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/filterWidget/filter_widget_model.dart';
import 'package:jeanswest/src/ui/store/widgets/filter_button_widget.dart';
import 'package:jeanswest/src/utils/helper/store/helper.dart';

class FiltersBarWidget extends StatefulWidget {
  const FiltersBarWidget({
    Key key,
  }) : super(key: key);
  @override
  _FiltersBarWidgetState createState() => _FiltersBarWidgetState();
}

class _FiltersBarWidgetState extends State<FiltersBarWidget> {
  ScrollController scrollController;
  List<FilterWidgetModel> filters;
  int filterPageOpened = -1;
  @override
  void initState() {
    scrollController = new ScrollController();
    filters = createFilters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: _screenSize.width,
      // color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        if (filterPageOpened == index)
                          filterPageOpened = -1;
                        else
                          filterPageOpened = index;
                      }),
                      child: FiltersButtonWidget(
                        isSelected: (filterPageOpened == index),
                        title: filters[index].title,
                        icon: filters[index].icon,
                        arrow: filterPageOpened == index
                            ? filters[index].openedArrow
                            : filters[index].closedArrow,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
