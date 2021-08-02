//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/category.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/category/category-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/store/helper.dart';

Future<void> getCategoryInfo() async {
  CategoryRes listOfCategotyRes;
  try {
    print('_=_ listOfCategory -------------');
    listOfCategotyRes =
        await globalLocator<GlobalRestClient>().getAllCategory();
    print(
        '_=_ listOfCategotyRes ------------- ${listOfCategotyRes.statusCode}');
  } catch (e) {
    // printErrorMessage(e);
    if (HARDCORE_DATA_IS_ENABLE) {
      print("   / use HardCOre DATA listOfCategory");
      listOfCategory = listOfCategoryTempData;
    }
  }
  if (listOfCategotyRes != null && listOfCategotyRes.data != null) {
    // print(
    //     '_=_ get successfully listOfCategotyRes.data  : ${listOfCategotyRes.data}');
    if (listOfCategotyRes.data.group != null &&
        listOfCategotyRes.data.group.length > 0) {
      listOfCategory = cleanCategotyElements(listOfCategotyRes.data);
      print(
          '_=_ get successfully listOfCategory group length: ${listOfCategory.group.length}');
    }
  } else
    print('_=_ listOfCategory is Empty');
}
