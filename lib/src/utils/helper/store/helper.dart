// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/globalInstances/store/category_colors.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-int.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-string.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-filter-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-option-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-search-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-unique-req-body.dart';
import 'package:jeanswest/src/models/api_response/category/list-of-category.dart';
import 'package:jeanswest/src/models/categoryColor/category-color.dart';
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
    _groupsTitles.add(element);
    _subGroupsTitles.add(listOfCat.subGroup[element]);

    _tempSubGroupValues = initValues == null && falseValues
        ? List.filled(listOfCat.subGroup[element].length, false)
        : initValues[element];
    _subGroupsValue.add(_tempSubGroupValues);
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
  List<CategoryColor> catColors, {
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
    listOfCat.size.keys.forEach((element) {
      Map<String, bool> map = {};
      listOfCat.size[element].forEach((subGroupSizeName) {
        map[subGroupSizeName] = false;
      });

      _sizeGroupCheckBoxValue.add(map);
    });
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
      "min": minPriceCategoty.toInt(),
      "max": maxPriceCategoty.toInt(),
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
  if (haveGenderAndAge) {
    widgets.add(OptionListFiltersPanel(
      indexInOptionWidgets: selectedIndexPage,
      // indexInOptionWidgets: listOfCat.group.length,
      checkBoxTitles: listOfCat.gender,
      checkBoxTitlesTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      checkBoxValue: genderCheckBoxValue,
      updateCheckBoxValue: (List<bool> newValue) => updateGenderValue(newValue),
    ));

    widgets.add(OptionListFiltersPanel(
      indexInOptionWidgets: selectedIndexPage,
      // indexInOptionWidgets: listOfCat.group.length + 1,
      checkBoxTitles: listOfCat.ageGroup,
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
    colors: catColors,
    colorsValue: colorCheckBoxValue,
    // colorsValue: List.filled(listOfCat.colorFamily.length, false),
    updateColorsValue: (List<bool> newValue) {
      updateColorValue(newValue);
    },
  ));

  widgets.add(SizeFiltersPanel(
    indexInOptionWidgets: selectedIndexPage,
    titles: listOfCat.group,
    sizeTitles: listOfCat.size,
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
}) {
  List<String> sub = [];
  if (subGroupSelected != null && subGroupSelected.length > 0)
    subGroupSelected.values.forEach((subGroup) {
      sub.addAll(subGroup);
    });

  ProductReqBody reqBody = ProductReqBody(
    filter: ProductFilterReqBody(
      quantity: OperationInt(
        oGT: quantityBiggerThan,
      ),
      basePrice: priceSelected != null &&
              priceSelected["min"] != null &&
              priceSelected["max"] != null
          ? OperationString(
              oGT: priceSelected["min"].toString(),
              oLT: priceSelected["max"].toString(),
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
          ? OperationString(oCT: sizeSelected)
          : null,
    ),
    option: ProductOptionReqBody(
      page: OperationInt(oEQ: page),
      limit: OperationInt(oEQ: getProductLimit),
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

  return reqBody;
}
