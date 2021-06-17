// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/category.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/filters_bar_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/color_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/main_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/price_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/size_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/sub_group_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/searchBar/store-search-bar-widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainStorePage extends StatefulWidget {
  final Function(bool) changeShowButtonNavigationBar;
  const MainStorePage({
    Key key,
    this.changeShowButtonNavigationBar,
  }) : super(key: key);
  @override
  _MainStorePageState createState() => _MainStorePageState();
}

class _MainStorePageState extends State<MainStorePage> {
  var keyboardVisibilityController = KeyboardVisibilityController();
  PanelController filtersPanelController = PanelController();
  //
  TextEditingController searchTextEditingController =
      new TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  bool searchTextFeildIsEnabled;
  int filterPageOpened = -1;

  @override
  void initState() {
    searchTextFeildIsEnabled = false;
    keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        setState(() {
          searchTextFeildIsEnabled = true;
        });
      } else {
        setState(() {
          searchTextFeildIsEnabled = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SlidingUpPanel(
        controller: filtersPanelController,
        minHeight: 0,
        maxHeight: _screenSize.height,
        isDraggable: false,
        onPanelClosed: () {
          widget.changeShowButtonNavigationBar(true);
          setState(() {
            filterPageOpened = -1;
          });
          FocusScope.of(context).unfocus();
        },
        onPanelOpened: () {
          widget.changeShowButtonNavigationBar(false);
        },
        panel: MainFiltersPanel(
            closePanel: () => filtersPanelController.close(),
            category: listOfCategory,
            screenSize: _screenSize),
        body: Column(
          children: [
            StoreSearchBarWidget(
              searchFocusNode: searchFocusNode,
              searchTextEditingController: searchTextEditingController,
              searchTextFeildIsEnabled: searchTextFeildIsEnabled,
              changeSearchTextFeildIsEnabled: (bool isEnable) => setState(() {
                searchTextFeildIsEnabled = isEnable;
              }),
            ),
            FiltersBarWidget(
              category: listOfCategory,
              filterPageOpened: filterPageOpened,
              openFilterPage: (int openedPage) {
                if (openedPage == 0)
                  filtersPanelController.open();
                else
                  setState(() {
                    filterPageOpened = openedPage;
                  });
              },
            ),
            Expanded(
              child: filterPageOpened < 0
                  ? SizedBox()
                  : filterPageOpened < listOfCategory.group.length
                      ? SubGroupFiltersPanel(
                          haveGroupTitle:
                              filterPageOpened < listOfCategory.group.length,
                          groupTitle: filterPageOpened < 0
                              ? ""
                              : filterPageOpened < listOfCategory.group.length
                                  ? listOfCategory.group[filterPageOpened]
                                  : optionGroup[filterPageOpened -
                                      (listOfCategory.group.length + 2)],
                          subGroupsTitle: listOfCategory
                              .subGroup[listOfCategory.group[filterPageOpened]],
                          subGroupsValue: List.filled(
                              listOfCategory
                                  .subGroup[listOfCategory.group[filterPageOpened]]
                                  .length,
                              false),
                          updateSubGroupsValue: (List<bool> newValues) {},
                        )
                      : filterPageOpened == listOfCategory.group.length + 2
                          ? ColorFiltersPanel(
                              colors: tempCatColors,
                              colorsValue: List.filled(
                                  listOfCategory.colorFamily.length, false),
                              updateColorsValue: (List<bool> newValue) {},
                            )
                          : filterPageOpened == listOfCategory.group.length + 3
                              ? SizeFiltersPanel(
                                  titles: listOfCategory.group,
                                  sizeTitles: listOfCategory.size,
                                  sizeValue: sizeGroupCheckBoxValue,
                                  updateSizesValue:
                                      (List<Map<String, bool>> newValue) {},
                                  mediaQuery: MediaQuery.of(context),
                                )
                              : filterPageOpened ==
                                      listOfCategory.group.length + 4
                                  ? PriceFiltersPanel(
                                      minPrice: 0,
                                      maxPrice: 1000000,
                                      updatePriceLimit:
                                          (int newMinPrice, int newMaxPrice) {},
                                    )
                                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
