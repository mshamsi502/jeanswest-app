// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/category.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/product-add-to-card-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/store/category_colors.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-req-body.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-data.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/ui/global/widgets/product_view/add-to-card-panel-widget.dart';

import 'package:jeanswest/src/ui/store/widgets/filterBar/filters_bar_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/main_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/sort_by_panel.dart';

import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/sub_group_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/sort_bar_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/searchBar/store-search-bar-widget.dart';
import 'package:jeanswest/src/ui/store/widgets/storeBody/store-main-body-widget.dart';
import 'package:jeanswest/src/utils/helper/store/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainStorePage extends StatefulWidget {
  final ProductReqBody initFilter;
  final Function(bool) changeShowButtonNavigationBar;
  const MainStorePage({
    Key key,
    @required this.changeShowButtonNavigationBar,
    this.initFilter,
  }) : super(key: key);
  @override
  _MainStorePageState createState() => _MainStorePageState();
}

class _MainStorePageState extends State<MainStorePage> {
  var keyboardVisibilityController = KeyboardVisibilityController();
  PanelController filtersPanelController = PanelController();
  PanelController addToCardPanelController = PanelController();
  PanelController sortPanelController = PanelController();
  //
  TextEditingController searchTextEditingController =
      new TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  bool searchTextFeildIsEnabled;
  int filterPageOpened = -1;
  int tempFilterPageOpened;
  //
  List<Widget> optionsWidget = [];
  MediaQueryData mediaQuery;
  bool getedMediaQuery = false;
  //
  List<String> groupsTitles = [];
  List<List<String>> subGroupsTitles = [];
  List<List<bool>> subGroupsValue = [];
  //
  List<Map<String, bool>> sizeGroupCheckBoxValue = [];
  List<bool> colorCheckBoxValue = [];
  Map<String, int> priceLimit = {};
  List<bool> genderCheckBoxValue = [];
  List<bool> ageCheckBoxValue = [];
  //
  List<int> someOfActiveSubGroup = [];
  int someOfActiveGenders;
  int someOfActiveAges;
  int someOfActiveColors;
  int someOfActiveSizes;
  int someOfActivePrice;
  //
  int pageNumber;
  int ascentNumber;
  String engNameOfSortBy;
  String perNameOfSortBy;
  int selectedIndexSort;
  String searchKeywordName;
  String uniqueName;
  //
  ProductReqBody filter;
  //
  ListOfProductsRes productsRes = ListOfProductsRes(
      data: ListOfProductsData(result: [SingleProductInfoRes()]));
  //
  bool isGridView;
  //
  int selectedColor;
  int selectedSize;
  int selectedProduct;

  @override
  void initState() {
    searchListener();
    setState(() {
      selectedColor = 0;
      selectedSize = -1;
      selectedProduct = -1;
      //
      isGridView = true;
      searchTextFeildIsEnabled = false;
      tempFilterPageOpened = filterPageOpened;
      keyboardVisibilityController.onChange.listen((bool visible) {
        if (visible) {
          searchTextFeildIsEnabled = true;
        } else {
          searchTextFeildIsEnabled = false;
        }
      });

      initPrepareValues();
      if (widget.initFilter != null)
        filter = widget.initFilter;
      else
        defaultFilter();
    });
    super.initState();
  }

  Future<void> searchListener() async {
    searchTextEditingController.addListener(() async {
      await Future.delayed(Duration(milliseconds: 500));
      if (searchTextEditingController.text != null &&
          searchTextEditingController.text != "") {
        setState(() {
          searchKeywordName = searchTextEditingController.text;
        });
        print(
            "------------------------ : searchKeywordName : $searchKeywordName");
        await prepareUpdateFilterReq();
      }
    });
  }

  initPrepareValues() {
    pageNumber = 1;
    ascentNumber = 1;
    engNameOfSortBy = STYLE_CODE_SORT;
    perNameOfSortBy = "پیش فرض";
    selectedIndexSort = 0;
    searchKeywordName = "";
    uniqueName = STYLE_UNIQUE;
    //
    initPrepareSubGroupValues();
    genderCheckBoxValue =
        prepareGenderValues(listOfCategory, falseValues: true);
    ageCheckBoxValue = prepareAgeValues(listOfCategory, falseValues: true);
    colorCheckBoxValue = prepareColorValues(catColors, falseValues: true);
    sizeGroupCheckBoxValue =
        prepareSizeGroupCheckBox(listOfCategory, falseValues: true);
    priceLimit = preparePriceCheckBox(isBiggest: true);
  }

  initPrepareSubGroupValues() {
    setState(() {
      Map<String, List<dynamic>> subGroup =
          prepareSubGroupValues(listOfCategory, falseValues: true);
      groupsTitles = subGroup["groupsTitles"] as List<String>;
      subGroupsTitles = subGroup["subGroupsTitles"] as List<List<String>>;
      subGroupsValue = subGroup["subGroupsValue"] as List<List<bool>>;
    });
  }

  prepareValues() {
    setState(() {
      mediaQuery = MediaQuery.of(context);
      getedMediaQuery = true;

      optionsWidget = prepareOptionsWidgets(
        selectedIndexPage: filterPageOpened,
        mediaQuery: mediaQuery,
        listOfCat: listOfCategory,
        genderCheckBoxValue: genderCheckBoxValue,
        ageCheckBoxValue: ageCheckBoxValue,
        colorCheckBoxValue: colorCheckBoxValue,
        sizeGroupCheckBoxValue: sizeGroupCheckBoxValue,
        priceLimitValue: priceLimit,
        //
        updateGenderValue: (List<bool> newValue) => setState(() {
          genderCheckBoxValue = newValue;
          filterPageOpened = -1;
        }),

        updateAgeValue: (List<bool> newValue) => setState(() {
          ageCheckBoxValue = newValue;
          filterPageOpened = -1;
        }),

        updateSizeValue: (List<Map<String, bool>> newValue) => setState(() {
          sizeGroupCheckBoxValue = newValue;
          filterPageOpened = -1;
        }),
        updateColorValue: (List<bool> newValue) => setState(() {
          colorCheckBoxValue = newValue;
          filterPageOpened = -1;
        }),
        updatePriceValue: (int newMinPrice, int newMaxPrice) => setState(() {
          priceLimit["min"] = newMinPrice;
          priceLimit["max"] = newMaxPrice;
          if (filtersPanelController.isPanelClosed) filterPageOpened = -1;
        }),
      );
      tempFilterPageOpened = filterPageOpened;
      //
      someOfActiveSubGroup = [];
      subGroupsValue.forEach((element) {
        int sum = updateSomeOfActives(element);
        someOfActiveSubGroup.add(sum);
      });
      someOfActiveGenders = updateSomeOfActives(genderCheckBoxValue);
      someOfActiveAges = updateSomeOfActives(ageCheckBoxValue);
      someOfActiveColors = updateSomeOfActives(colorCheckBoxValue);
      //
      someOfActiveSizes = 0;

      sizeGroupCheckBoxValue.forEach((subGroup) {
        subGroup.values.forEach((element) {
          if (element) someOfActiveSizes++;
        });
      });
      // someOfActiveSizes = updateSomeOfActives(tempSizeGroupCheckBoxValue);
      //
      if (priceLimit == null ||
          priceLimit["min"] == null ||
          priceLimit["max"] == null ||
          (priceLimit["min"] == 0 && priceLimit["max"] == maxPriceCategoty)) {
        someOfActivePrice = 0;
      } else
        someOfActivePrice = 1;
    });
  }

  prepareUpdateFilterReq() async {
    //
    List<String> ageSelected = [];
    for (int index = 0; index < ageCheckBoxValue.length; index++) {
      if (ageCheckBoxValue[index])
        ageSelected.add(listOfCategory.ageGroup[index]);
    }
    //
    List<String> colorSelected = [];
    for (int index = 0; index < colorCheckBoxValue.length; index++) {
      if (colorCheckBoxValue[index])
        colorSelected.add(listOfCategory.colorFamily[index]);
    }
    //
    List<String> genderSelected = [];
    for (int index = 0; index < genderCheckBoxValue.length; index++) {
      if (genderCheckBoxValue[index])
        genderSelected.add(listOfCategory.gender[index]);
    }
    //
    List<String> sizeSelected = [];
    for (int indexOfGroup = 0;
        indexOfGroup < sizeGroupCheckBoxValue.length;
        indexOfGroup++) {
      for (int indexOfSub = 0;
          indexOfSub < sizeGroupCheckBoxValue.length;
          indexOfSub++) {
        if (checkValueListStatus(
                sizeGroupCheckBoxValue[indexOfGroup].values.toList()) ==
            1) {
          sizeSelected = [];
        }
        if (sizeGroupCheckBoxValue[indexOfGroup].values.elementAt(indexOfSub))
          sizeSelected.add(
              sizeGroupCheckBoxValue[indexOfGroup].keys.elementAt(indexOfSub));
      }
    }
//
    Map<String, List<String>> subGroup = {};
    for (int indexOfGroup = 0;
        indexOfGroup < groupsTitles.length;
        indexOfGroup++) {
      List<String> subInGroup = [];
      for (int indexOfSub = 0;
          indexOfSub < subGroupsValue[indexOfGroup].length;
          indexOfSub++) {
        if (subGroupsValue[indexOfGroup][indexOfSub]) {
          subInGroup.add(subGroupsTitles[indexOfGroup][indexOfSub]);
        }
      }
      if (subInGroup != null && subInGroup.length > 0) {
        if (subInGroup.length == subGroupsTitles[indexOfGroup].length) {
          subGroup[groupsTitles[indexOfGroup]] = [];
        } else {
          subGroup[groupsTitles[indexOfGroup]] = subInGroup;
        }
      }
    }
    //
    ProductReqBody filter = updateproductReqBody(
      priceSelected: priceLimit,
      ageSelected: ageSelected,
      subGroupSelected: subGroup,
      colorSelected: colorSelected,
      genderSelected: genderSelected,
      sizeSelected: sizeSelected,
      page: pageNumber,
      ascent: ascentNumber,
      sortBy: engNameOfSortBy,
      searchKeyword: searchKeywordName,
      unique: uniqueName,
    );
    print("7777777777777777777777 filter : ${filter.map}");
    ListOfProductsRes tempProductRes =
        await globalLocator<GlobalRestClient>().getProductList(filter.map);
    setState(() {
      productsRes = tempProductRes;
    });
  }

  defaultFilter() async {
    filter = updateproductReqBody(
      ascent: 1,
      sortBy: STYLE_CODE_SORT,
      unique: STYLE_UNIQUE,
    );
    ListOfProductsRes tempProductRes =
        await globalLocator<GlobalRestClient>().getProductList(filter.map);

    setState(() {
      productsRes = tempProductRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (!getedMediaQuery || tempFilterPageOpened != filterPageOpened) {
      prepareValues();
      prepareUpdateFilterReq();
    }

    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
      child: SlidingUpPanel(
        controller: filtersPanelController,
        minHeight: 0,
        maxHeight: _screenSize.height,
        isDraggable: false,
        onPanelClosed: () {
          // if (sortPanelController.isPanelClosed)
          widget.changeShowButtonNavigationBar(true);
          setState(() {
            filterPageOpened = -1;
          });
          FocusScope.of(context).unfocus();
        },
        onPanelOpened: () {
          // if (sortPanelController.isPanelOpen)
          widget.changeShowButtonNavigationBar(false);
        },
        panel: MainFiltersPanel(
          mainFilterPanelState: filtersPanelController.isAttached &&
                  filtersPanelController.isPanelOpen
              ? PanelState.OPEN
              : PanelState.CLOSED,
          closePanel: () {
            prepareValues();
            filtersPanelController.close();
          },
          category: listOfCategory,
          optionGroup: optionGroup,
          mediaQuery: MediaQuery.of(context),
          subGroupsTitles: filterPageOpened < 0 &&
                  filterPageOpened > (listOfCategory.group.length)
              ? [[]] as List<List<String>>
              : subGroupsTitles,
          subGroupsValue: filterPageOpened < 0 &&
                  filterPageOpened > (listOfCategory.group.length)
              ? [[]] as List<List<bool>>
              : subGroupsValue,
          genderCheckBoxValue: genderCheckBoxValue,
          sizeGroupCheckBoxValue: sizeGroupCheckBoxValue,
          ageCheckBoxValue: ageCheckBoxValue,
          colorCheckBoxValue: colorCheckBoxValue,
          priceLimitValue: priceLimit,
          //
          confirmSubGroupValues: (List<List<bool>> newValue) => setState(() {
            subGroupsValue = newValue;
          }),
          confirmOptionsValues: (
            List<bool> newGenderCheckBoxValue,
            List<bool> newAgeCheckBoxValue,
            List<bool> newColorCheckBoxValue,
            List<Map<String, bool>> newSizeGroupCheckBoxValue,
            Map<String, int> newPriceLimitValue,
          ) =>
              setState(() {
            genderCheckBoxValue = genderCheckBoxValue;
            ageCheckBoxValue = ageCheckBoxValue;
            colorCheckBoxValue = newColorCheckBoxValue;
            sizeGroupCheckBoxValue = newSizeGroupCheckBoxValue;
            priceLimit = newPriceLimitValue;
          }),
        ),
        body: SlidingUpPanel(
          controller: sortPanelController,
          minHeight: 0,
          maxHeight: 0.4 * _screenSize.height,
          backdropEnabled: true,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              15,
            ),
            topRight: Radius.circular(
              0.03 * _screenSize.width, //11
            ),
          ),
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
          panel: SortByPanel(
            closeSortByPanel: () => sortPanelController.close(),
            selectedSort: selectedIndexSort,
            updateSelectedSortOption: (int selected) {
              updateSelectedSortOption(selected);
            },
          ),
          body: SlidingUpPanel(
            controller: addToCardPanelController,
            minHeight: 0,
            maxHeight: 0.6587 * _screenSize.height, //390,
            backdropEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                0.03 * _screenSize.width, //11
              ),
              topRight: Radius.circular(
                0.03 * _screenSize.width, //11
              ),
            ),
            onPanelClosed: () => setState(() {
              selectedColor = 0;
              selectedSize = -1;
            }),
            panel: AddToCardPanelWidget(
              productDetail: addToCardProductDetailRes,
              closeAddToCardPanel: () => addToCardPanelController.close(),
              selectedColor: selectedColor,
              selectedSize: selectedSize,
              addToCardPanelIsClosed: addToCardPanelController.isAttached
                  ? addToCardPanelController.isPanelClosed
                  : true,
              changeSelectedColor: (int value) => setState(() {
                selectedColor = value;
              }),
              changeSelectedSize: (int value) => setState(() {
                selectedSize = value;
              }),
            ),
            // panel: SizedBox(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StoreSearchBarWidget(
                  searchFocusNode: searchFocusNode,
                  searchTextEditingController: searchTextEditingController,
                  searchTextFeildIsEnabled: searchTextFeildIsEnabled,
                  changeSearchTextFeildIsEnabled: (bool isEnable) =>
                      setState(() {
                    searchTextFeildIsEnabled = isEnable;
                  }),
                ),
                FiltersBarWidget(
                  category: listOfCategory,
                  filterPageOpened: filterPageOpened,
                  openFilterPage: (int openedPage) {
                    if (openedPage == 0) {
                      setState(() {
                        filterPageOpened = openedPage;
                      });
                      filtersPanelController.open();
                    } else
                      setState(() {
                        filterPageOpened = openedPage;
                      });
                  },
                  someOfActiveSubGroup: someOfActiveSubGroup,
                  someOfActiveGenders: someOfActiveGenders,
                  someOfActiveAges: someOfActiveAges,
                  someOfActiveColors: someOfActiveColors,
                  someOfActiveSizes: someOfActiveSizes,
                  someOfActivePrice: someOfActivePrice,
                  clearActiveSubGroup: (int index) {
                    List<bool> falseList =
                        List.filled(subGroupsValue[index].length, false);
                    setState(() {
                      subGroupsValue[index] = falseList;
                    });
                    prepareUpdateFilterReq();
                  },
                  clearActiveGender: () => setState(() {
                    List<bool> falseList =
                        List.filled(genderCheckBoxValue.length, false);
                    setState(() {
                      genderCheckBoxValue = falseList;
                    });
                    prepareUpdateFilterReq();
                  }),
                  clearActiveAge: () => setState(() {
                    List<bool> falseList =
                        List.filled(ageCheckBoxValue.length, false);
                    setState(() {
                      ageCheckBoxValue = falseList;
                    });
                    prepareUpdateFilterReq();
                  }),
                  clearActiveColor: () => setState(() {
                    List<bool> falseList =
                        List.filled(colorCheckBoxValue.length, false);
                    setState(() {
                      colorCheckBoxValue = falseList;
                      someOfActiveColors =
                          updateSomeOfActives(colorCheckBoxValue);
                    });
                    prepareUpdateFilterReq();
                  }),
                  clearActiveSize: () => setState(() {
                    setState(() {
                      for (int index = 0;
                          index < sizeGroupCheckBoxValue.length;
                          index++) {
                        sizeGroupCheckBoxValue[index]
                            .keys
                            .forEach((keyElement) {
                          sizeGroupCheckBoxValue[index][keyElement] = false;
                        });
                      }
                    });
                    prepareUpdateFilterReq();
                  }),
                  clearActivePrice: () => setState(() {
                    priceLimit = preparePriceCheckBox(isBiggest: true);
                  }),
                ),
                Expanded(
                  child: filterPageOpened > 0 &&
                          filterPageOpened <
                              listOfCategory.group.length +
                                  optionsWidget.length +
                                  1
                      ? Column(
                          children: [
                            Container(
                              width: _screenSize.width,
                              color: ALICE_BLUE,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Text(filterPageOpened <=
                                      listOfCategory.group.length
                                  ? listOfCategory.group[filterPageOpened - 1]
                                  : optionGroup[filterPageOpened -
                                      listOfCategory.group.length -
                                      1]),
                            ),
                            Expanded(
                              child: filterPageOpened <=
                                      listOfCategory.group.length
                                  ? SubGroupFiltersPanel(
                                      isFromMainFilter: false,
                                      indexInOptionWidgets: filterPageOpened,
                                      haveGroupTitle: filterPageOpened <=
                                          listOfCategory.group.length,
                                      groupTitle: filterPageOpened <= 0
                                          ? []
                                          : filterPageOpened <=
                                                  listOfCategory.group.length
                                              ? groupsTitles[
                                                  filterPageOpened - 1]
                                              : optionGroup[filterPageOpened -
                                                  (listOfCategory
                                                      .group.length) -
                                                  1],
                                      subGroupsTitle:
                                          subGroupsTitles[filterPageOpened - 1],
                                      subGroupsValue:
                                          subGroupsValue[filterPageOpened - 1],
                                      updateSubGroupsValue:
                                          (List<bool> newValues) {
                                        filtersPanelController.close();
                                        updateSubGroupValue(
                                            filterPageOpened - 1, newValues);
                                      },
                                    )
                                  : optionsWidget[filterPageOpened -
                                      listOfCategory.group.length -
                                      1],
                            ),
                            // SizedBox(height: 25),
                          ],
                        )
                      : StoreMainBodyWidget(
                          products: productsRes.data.result,
                          openAddToCardPanel: (int selectedIndex) {
                            print("aaaaaaaaaaaaaaa");
                            setState(() {
                              selectedProduct = selectedIndex;
                            });
                            addToCardPanelController.open();
                          },
                          isGridView: isGridView,
                          // openSortByPanel: () => sortPanelController.open(),
                        ),
                ),
                filterPageOpened > 0
                    ? SizedBox()
                    : Column(
                        children: [
                          SortBarWidget(
                            title: perNameOfSortBy,
                            isGridView: isGridView,
                            changeView: (bool newISGridView) => setState(() {
                              isGridView = newISGridView;
                            }),
                            openSortPanel: () => sortPanelController.open(),
                          ),
                          SizedBox(height: 80),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateSubGroupValue(int index, List<bool> newValues) {
    List<bool> _temp = newValues;
    List<List<bool>> _tempList = subGroupsValue.sublist(0, index);
    _tempList.add(_temp);
    _tempList.addAll(subGroupsValue.sublist(index + 1));
    setState(() {
      subGroupsValue = [];
      subGroupsValue = _tempList;
    });
  }

  Future<void> updateSelectedSortOption(int selected) async {
    setState(() {
      switch (selected) {
        case 0:
          {
            engNameOfSortBy = STYLE_CODE_SORT;
            ascentNumber = 0;
            break;
          }
        case 1:
          {
            engNameOfSortBy = SALE_PRICE_SORT;
            ascentNumber = 0;
            break;
          }
        case 2:
          {
            engNameOfSortBy = SALE_PRICE_SORT;
            ascentNumber = 1;
            break;
          }
        case 3:
          {
            engNameOfSortBy = DISCOUNT_SORT;
            ascentNumber = 1;
            break;
          }
        case 4:
          {
            engNameOfSortBy = COLOR_SORT;
            ascentNumber = 0;
            break;
          }
      }
      perNameOfSortBy = updatePerNameOfSortBy(engNameOfSortBy, ascentNumber);
    });
    await prepareUpdateFilterReq();
  }
}
