// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/category.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-int.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-string.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-filter-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-option-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-search-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-unique-req-body.dart';
import 'package:jeanswest/src/models/api_response/category/list-of-category.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/categoryColor/category-color.dart';
import 'package:jeanswest/src/models/filterWidget/filter_widget_model.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/color_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/option_list_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/price_filters_panel.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/size_filters_panel.dart';

List<FilterWidgetModel> createFilters({@required List<String> mainGroup}) {
  List<FilterWidgetModel> filters = [];
  filters.add(
    FilterWidgetModel(
      title: "فیلتر ها",
      icon: Icons.filter_alt_outlined,
      closedArrow: Icons.arrow_drop_down,
      openedArrow: Icons.arrow_drop_up,
    ),
  );
  //
  for (int i = 0; i < mainGroup.length; i++) {
    filters.add(
      FilterWidgetModel(
        title: mainGroup[i],
        icon: Icons.filter_alt_outlined,
        closedArrow: Icons.arrow_drop_down,
        openedArrow: Icons.arrow_drop_up,
      ),
    );
  }
  //
  optionGroup.forEach((element) {
    filters.add(
      FilterWidgetModel(
        title: element,
        closedArrow: Icons.arrow_drop_down,
        openedArrow: Icons.arrow_drop_up,
      ),
    );
  });
  return filters;
}

List<String> deleteFromSeletion(
    {@required int index, @required List<String> activeSubGroupsTitle}) {
  List<String> tempActiveSubGroupsTitle = [];

  print("index : $index");

  tempActiveSubGroupsTitle.addAll(activeSubGroupsTitle.sublist(0, index));
  tempActiveSubGroupsTitle.addAll(activeSubGroupsTitle.sublist(index + 1));
  return tempActiveSubGroupsTitle;
}

int checkValueListStatus(List<bool> tempSubGroupsValue) {
  // print(tempSubGroupsValue);
  // !check all is true, return 1
  bool allIsTrue = true;
  bool allIsFalse = true;

  for (int t = 0; t < tempSubGroupsValue.length; t++) {
    if (tempSubGroupsValue[t]) {
      allIsTrue = true;
    } else {
      allIsTrue = false;
      break;
    }
  }
  // print("allIsTrue : $allIsTrue");
  // !check all is false, return -1
  for (int f = 0; f < tempSubGroupsValue.length; f++) {
    if (!tempSubGroupsValue[f]) {
      allIsFalse = true;
    } else {
      allIsFalse = false;
      break;
    }
  }
  // print("allIsFalse : $allIsFalse");
  if (allIsTrue)
    return 1;
  else if (allIsFalse)
    return -1;
  else {
    // print("true and false together");
    return 0;
  }
}

//
//
//
Map<String, List<dynamic>> prepareSubGroupValues(
  ListOfCategory listOfCat, {
  bool falseValues = true,
  Map<String, List<bool>> initValues,
}) {
  List<String> _groupsTitles = [];
  List<List<String>> _subGroupsTitles = [];
  List<List<bool>> _subGroupsValue = [];
  List<bool> _tempSubGroupValues = [];
  listOfCat.group.forEach((element) {
    _groupsTitles.addAll(element
        // _groupsTitles.add(element
        // .translation[element.translation
        //     .indexWhere((element) => element.language == FARSI_LANGUAGE)]
        .value);
    listOfCat.subGroup.forEach((_group) {
      List<String> _subsInGroup = [];
      _group.value.forEach((_subGroup) {
        _subsInGroup.add(_subGroup
            .translation[_subGroup.translation
                .indexWhere((_trans) => _trans.language == FARSI_LANGUAGE)]
            .value);
      });
      _tempSubGroupValues = initValues == null && falseValues
          ? List.filled(_subsInGroup.length, false)
          : initValues[element];
      _subGroupsValue.add(_tempSubGroupValues);

      _subGroupsTitles.add(_subsInGroup);
    });
  });

  return {
    "groupsTitles": _groupsTitles,
    "subGroupsTitles": _subGroupsTitles,
    "subGroupsValue": _subGroupsValue
  };
}

List<bool> prepareGenderValues(
  ListOfCategory listOfCat, {
  bool falseValues = true,
  List<bool> initValues,
}) {
  if (initValues == null && falseValues)
    return List.filled(listOfCat.gender.length, false);
  else
    return initValues;
}

List<bool> prepareAgeValues(
  ListOfCategory listOfCat, {
  bool falseValues = true,
  List<bool> initValues,
}) {
  if (initValues == null && falseValues)
    return List.filled(listOfCat.ageGroup.length, false);
  else
    return initValues;
}

List<bool> prepareColorValues(
  List<CategoryColorRes> catColors, {
  bool falseValues = true,
  List<bool> initValues,
}) {
  if (initValues == null && falseValues)
    return List.filled(catColors.length, false);
  else
    return initValues;
}

List<Map<String, bool>> prepareSizeGroupCheckBox(
  ListOfCategory listOfCat, {
  bool falseValues = true,
  List<Map<String, bool>> initValues,
}) {
  if (initValues == null || falseValues) {
    List<Map<String, bool>> _sizeGroupCheckBoxValue = [];
    listOfCat.size.forEach((_groupSize) {
      Map<String, bool> _mapInGroup = {};
      _groupSize.value.forEach((_subSize) {
        _mapInGroup[_subSize
            .translation[_subSize.translation
                .indexWhere((_trans) => _trans.language == FARSI_LANGUAGE)]
            .value] = false;
      });
      _sizeGroupCheckBoxValue.add(_mapInGroup);
    });
    // listOfCat.size.keys.forEach((element) {
    //   Map<String, bool> map = {};
    //   listOfCat.size[element].forEach((subGroupSizeName) {
    //     map[subGroupSizeName] = false;
    //   });

    //   _sizeGroupCheckBoxValue.add(map);
    // });
    return _sizeGroupCheckBoxValue;
  } else
    return initValues;
}

Map<String, int> preparePriceCheckBox({
  bool isBiggest = true,
  Map<String, int> initValues,
}) {
  if (initValues == null || isBiggest) {
    return {
      "min": MIN_PRICE_CATEGORY.toInt(),
      "max": MAX_PRICE_CATEGORY.toInt(),
    };
  } else
    return initValues;
}

List<Widget> prepareOptionsWidgets(
    {@required int selectedIndexPage,
    bool haveGenderAndAge = true,
    @required ListOfCategory listOfCat,
    @required List<bool> genderCheckBoxValue,
    @required List<bool> ageCheckBoxValue,
    @required List<bool> colorCheckBoxValue,
    @required List<Map<String, bool>> sizeGroupCheckBoxValue,
    @required Map<String, int> priceLimitValue,
    //
    @required Function(List<bool>) updateGenderValue,
    @required Function(List<bool>) updateAgeValue,
    @required Function(List<bool>) updateColorValue,
    @required Function(List<Map<String, bool>>) updateSizeValue,
    @required Function(int, int) updatePriceValue,
    //
    @required MediaQueryData mediaQuery}) {
  List<Widget> widgets = [];
  List<String> tempGenderName = [];
  List<String> tempAgeName = [];
  Map<String, List<String>> tempSizeName = {};

  listOfCat.gender.forEach((_gender) {
    tempGenderName.add(_gender
        .translation[_gender.translation
            .indexWhere((element) => element.language == FARSI_LANGUAGE)]
        .value);
  });
  listOfCat.ageGroup.forEach((_ageGroup) {
    tempAgeName.add(_ageGroup
        .translation[_ageGroup.translation
            .indexWhere((element) => element.language == FARSI_LANGUAGE)]
        .value);
  });

  listOfCat.size.forEach((_subGSize) {
    String _keyName = _subGSize
        .translation[_subGSize.translation
            .indexWhere((_trans) => _trans.language == FARSI_LANGUAGE)]
        .value;
    tempSizeName[_keyName] = [];
    _subGSize.value.forEach((_singleSize) {
      tempSizeName[_keyName].add(_singleSize
          .translation[_singleSize.translation
              .indexWhere((_trans) => _trans.language == FARSI_LANGUAGE)]
          .value);
    });
  });

  if (haveGenderAndAge) {
    widgets.add(OptionListFiltersPanel(
      indexInOptionWidgets: selectedIndexPage,
      checkBoxTitles: tempGenderName,
      checkBoxTitlesTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      checkBoxValue: genderCheckBoxValue,
      updateCheckBoxValue: (List<bool> newValue) => updateGenderValue(newValue),
    ));

    widgets.add(OptionListFiltersPanel(
      indexInOptionWidgets: selectedIndexPage,
      checkBoxTitles: tempAgeName,
      checkBoxTitlesTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      checkBoxValue: ageCheckBoxValue,
      updateCheckBoxValue: (List<bool> newValue) => updateAgeValue(newValue),
    ));
  }
  widgets.add(ColorFiltersPanel(
    indexInOptionWidgets: selectedIndexPage,
    colors: listOfCategory.colorFamily,
    colorsValue: colorCheckBoxValue,
    // colorsValue: List.filled(listOfCat.colorFamily.length, false),
    updateColorsValue: (List<bool> newValue) {
      updateColorValue(newValue);
    },
  ));
  //
  List<String> tempGroupName = [];
  listOfCat.group.forEach((_group) {
    tempGroupName.add(_group
        .translation[_group.translation
            .indexWhere((element) => element.language == FARSI_LANGUAGE)]
        .value);
  });
  widgets.add(SizeFiltersPanel(
    indexInOptionWidgets: selectedIndexPage,
    titles: tempGroupName,
    sizeTitles: tempSizeName,
    sizeValue: sizeGroupCheckBoxValue,
    updateSizesValue: (List<Map<String, bool>> newValue) =>
        updateSizeValue(newValue),
    mediaQuery: mediaQuery,
  ));
  widgets.add(PriceFiltersPanel(
    indexInOptionWidgets: selectedIndexPage,
    minPrice: priceLimitValue["min"],
    maxPrice: priceLimitValue["max"],
    updatePriceLimit: (int newMinValue, int newMaxBalue) {
      print("priceLimit : $newMinValue $newMaxBalue");
      updatePriceValue(
        newMinValue,
        newMaxBalue,
      );
    },
  ));

  return widgets;
}

int updateSomeOfActives(List<bool> values) {
  int sumOfActive = 0;
  values.forEach((element) {
    if (element) {
      sumOfActive++;
    }
  });
  return sumOfActive;
}

List<int> createSomeOfActive({
  List<int> someOfActiveSubGroup,
  int someOfActiveGenders,
  int someOfActiveAges,
  int someOfActiveColors,
  int someOfActiveSizes,
  int someOfActivePrice,
}) {
  List<int> some = [];
  some.addAll(someOfActiveSubGroup);
  some.add(someOfActiveGenders);
  some.add(someOfActiveAges);
  some.add(someOfActiveColors);
  some.add(someOfActiveSizes);
  some.add(someOfActivePrice);

  return some;
}

ProductReqBody updateproductReqBody({
  Map<String, int> priceSelected,
  List<String> ageSelected,
  int quantityBiggerThan = 0,
  Map<String, List<String>> subGroupSelected,
  List<String> colorSelected,
  List<String> genderSelected,
  List<String> sizeSelected,
  int page = 1,
  int ascent = 0,
  String sortBy = STYLE_CODE_SORT,
  String searchKeyword,
  String unique = STYLE_UNIQUE,
  Function() restSaerchKey,
  Function() restFilters,
}) {
  List<String> sub = [];
  ProductReqBody reqBody;
  if (sortBy == SEARCH_SORT) {
    reqBody = ProductReqBody(
      filter: ProductFilterReqBody(
        quantity: OperationInt(
          oGT: quantityBiggerThan,
        ),
      ),
      option: ProductOptionReqBody(
        page: OperationInt(oEQ: page),
        limit: OperationInt(oEQ: GET_PRODUCT_LIMIT),
        ascent: OperationInt(oEQ: ascent),
        sort: OperationString(oEQ: sortBy),
      ),
      search: searchKeyword != null && searchKeyword != ""
          ? ProductSearchReqBody(keyword: OperationString(oEQ: searchKeyword))
          : null,
      unique: ProductUniqueReqBody(
        color: unique == COLOR_UNIQUE ? OperationInt(oEQ: 1) : null,
        style: unique == STYLE_UNIQUE ? OperationInt(oEQ: 1) : null,
      ),
    );
    restFilters();
  } else {
    if (subGroupSelected != null && subGroupSelected.length > 0)
      subGroupSelected.values.forEach((subGroup) {
        sub.addAll(subGroup);
      });
    if ((ageSelected != null && ageSelected.length > 0) ||
        (subGroupSelected != null && subGroupSelected.length > 0) ||
        (colorSelected != null && colorSelected.length > 0) ||
        (genderSelected != null && genderSelected.length > 0) ||
        (sizeSelected != null && sizeSelected.length > 0)) {
      searchKeyword = "";
      sortBy = STYLE_CODE_SORT;
      restSaerchKey();
    }
    reqBody = ProductReqBody(
      filter: ProductFilterReqBody(
        quantity: OperationInt(
          oGT: quantityBiggerThan,
        ),
        basePrice: priceSelected != null &&
                priceSelected["min"] != null &&
                priceSelected["max"] != null
            ? OperationInt(
                oGT: priceSelected["min"],
                oLT: priceSelected["max"],
              )
            : null,
        ageGroup: ageSelected != null && ageSelected.length > 0
            ? OperationString(oEQL: ageSelected)
            : null,
        group: subGroupSelected != null && subGroupSelected.length > 0
            ? OperationString(oEQL: subGroupSelected.keys.toList())
            : null,
        subGroup: subGroupSelected != null && subGroupSelected.length > 0
            ? OperationString(oEQL: sub)
            : null,
        colorFamily: colorSelected != null && colorSelected.length > 0
            ? OperationString(oEQL: colorSelected)
            : null,
        gender: genderSelected != null && genderSelected.length > 0
            ? OperationString(oEQL: genderSelected)
            : null,
        size: sizeSelected != null && sizeSelected.length > 0
            ? OperationString(oEQL: sizeSelected)
            : null,
      ),
      option: ProductOptionReqBody(
        page: OperationInt(oEQ: page),
        limit: OperationInt(oEQ: GET_PRODUCT_LIMIT),
        ascent: OperationInt(oEQ: ascent),
        sort: OperationString(oEQ: sortBy),
      ),
      search: searchKeyword != null && searchKeyword != ""
          ? ProductSearchReqBody(keyword: OperationString(oEQ: searchKeyword))
          : null,
      unique: ProductUniqueReqBody(
        color: unique == COLOR_UNIQUE ? OperationInt(oEQ: 1) : null,
        style: unique == STYLE_UNIQUE ? OperationInt(oEQ: 1) : null,
      ),
    );
  }

  return reqBody;
}

String updatePerNameOfSortBy(String engNameOfSortBy, int ascentNumber) {
  if (engNameOfSortBy == COLOR_SORT)
    return "تنوع بر اساس رنگ";
  else if (engNameOfSortBy == SALE_PRICE_SORT) {
    if (ascentNumber == 1)
      return "گران ترین";
    else
      return "ارزان ترین";
  } else if (engNameOfSortBy == DISCOUNT_SORT && ascentNumber == 1)
    return "بیشترین تخفیف";
  else
    return "پیش فرض";
}

ListOfCategory cleanCategotyElements(ListOfCategory _cat) {
  // ! sort groups
  _cat.group.sort((a, b) {
    return a.priority.compareTo(b.priority);
  });
  // ! clean groups
  _cat.group.forEach((_singleGroup) {
    if (!_singleGroup.active) _cat.group.remove(_singleGroup);
  });
  //
  // ! sort subGroups
  _cat.subGroup.sort((a, b) {
    return a.priority.compareTo(b.priority);
  });
  _cat.subGroup.forEach((element) {
    element.value.sort((a, b) {
      return a.priority.compareTo(b.priority);
    });
  });

  // ! sort sizes
  _cat.size.sort((a, b) {
    return a.priority.compareTo(b.priority);
  });
  _cat.size.forEach((element) {
    element.value.sort((a, b) {
      return a.priority.compareTo(b.priority);
    });
  });
  // ! sort gender
  _cat.gender.sort((a, b) {
    return a.priority.compareTo(b.priority);
  });
  // ! sort age
  _cat.ageGroup.sort((a, b) {
    return a.priority.compareTo(b.priority);
  });
  // ! sort color
  _cat.colorFamily.sort((a, b) {
    return a.priority.compareTo(b.priority);
  });
  return _cat;
}
