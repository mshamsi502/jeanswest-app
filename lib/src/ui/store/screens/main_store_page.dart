// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:jeanswest/src/constants/global/globalInstances/category.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/filters_bar_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/main_filters_panel.dart';
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
          ],
        ),
      ),
    );
  }
}
