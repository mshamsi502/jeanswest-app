// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/api_response/category/list-of-category.dart';
import 'package:jeanswest/src/models/filterWidget/filter_widget_model.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/filter_button_widget.dart';
import 'package:jeanswest/src/utils/helper/store/helper.dart';

class FiltersBarWidget extends StatefulWidget {
  final ListOfCategory category;
  final Function(int) openFilterPage;
  final int filterPageOpened;
  //
  final List<int> someOfActiveSubGroup;
  final int someOfActiveGenders;
  final int someOfActiveAges;
  final int someOfActiveColors;
  final int someOfActiveSizes;
  final int someOfActivePrice;
  //
  final Function(int) clearActiveSubGroup;
  final Function() clearActiveGender;
  final Function() clearActiveAge;
  final Function() clearActiveColor;
  final Function() clearActiveSize;
  final Function() clearActivePrice;

  const FiltersBarWidget({
    Key key,
    @required this.openFilterPage,
    @required this.filterPageOpened,
    @required this.category,
    @required this.someOfActiveSubGroup,
    @required this.someOfActiveGenders,
    @required this.someOfActiveAges,
    @required this.someOfActiveColors,
    @required this.someOfActiveSizes,
    @required this.someOfActivePrice,
    @required this.clearActiveSubGroup,
    @required this.clearActiveGender,
    @required this.clearActiveAge,
    @required this.clearActiveColor,
    @required this.clearActiveSize,
    @required this.clearActivePrice,
  }) : super(key: key);
  @override
  _FiltersBarWidgetState createState() => _FiltersBarWidgetState();
}

class _FiltersBarWidgetState extends State<FiltersBarWidget> {
  ScrollController scrollController;
  List<FilterWidgetModel> filters;
  List<int> someOfActive = [0, 0, 0, 0, 0, 0, 0, 0];

  int tempFilterPageOpened;

  @override
  void initState() {
    scrollController = new ScrollController();
    filters = createFilters(mainGroup: widget.category.group ?? []);
    update();
    super.initState();
  }

  update() {
    setState(() {
      tempFilterPageOpened = widget.filterPageOpened;
      someOfActive = createSomeOfActive(
        someOfActiveSubGroup: widget.someOfActiveSubGroup,
        someOfActiveGenders: widget.someOfActiveGenders,
        someOfActiveAges: widget.someOfActiveAges,
        someOfActiveColors: widget.someOfActiveColors,
        someOfActiveSizes: widget.someOfActiveSizes,
        someOfActivePrice: widget.someOfActivePrice,
      );
    });

    print("ssssssssssssssome : ${someOfActive.length}");
    print("ssssssssssssssome : ${filters.length}");
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (widget.filterPageOpened != tempFilterPageOpened) update();

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
                        if (widget.filterPageOpened == index)
                          widget.openFilterPage(-1);
                        else {
                          widget.openFilterPage(index);
                        }
                      }),
                      child: FiltersButtonWidget(
                        isSelected: (widget.filterPageOpened == index),
                        title: filters[index].title,
                        icon: filters[index].icon,
                        arrow: widget.filterPageOpened == index
                            ? filters[index].openedArrow
                            : filters[index].closedArrow,
                        haveSomeActive: index == 0 ||
                                someOfActive == null ||
                                someOfActive[index - 1] == null
                            ? false
                            : someOfActive[index - 1] > 0,
                        someNumber: index == 0 ||
                                someOfActive == null ||
                                someOfActive[index - 1] == null
                            ? 0
                            : someOfActive[index - 1],
                        clear: () async {
                          if (index != 0) {
                            if (index <= widget.someOfActiveSubGroup.length) {
                              widget.clearActiveSubGroup(index - 1);
                              print("33333333333333333 is sub 000000000");
                            } else if (index ==
                                widget.someOfActiveSubGroup.length + 1)
                              widget.clearActiveGender();
                            else if (index ==
                                widget.someOfActiveSubGroup.length + 2)
                              widget.clearActiveAge();
                            else if (index ==
                                widget.someOfActiveSubGroup.length + 3)
                              widget.clearActiveColor();
                            else if (index ==
                                widget.someOfActiveSubGroup.length + 4)
                              widget.clearActiveSize();
                            else if (index ==
                                widget.someOfActiveSubGroup.length + 5)
                              widget.clearActivePrice();
                            if (index == 1)
                              widget.openFilterPage(1);
                            else
                              widget.openFilterPage(index - 1);
                            await Future.delayed(Duration(milliseconds: 1));
                            widget.openFilterPage(-1);
                            update();
                          }
                          // !
                        },
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
