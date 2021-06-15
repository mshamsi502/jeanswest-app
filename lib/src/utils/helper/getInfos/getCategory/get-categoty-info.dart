//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/globalInstances/category.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/category/category-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<void> getCategoryInfo() async {
  CategoryRes listOfCategotyRes;
  try {
    listOfCategotyRes =
        await globalLocator<GlobalRestClient>().getAllCategory();
  } catch (e) {
    printErrorMessage(e);
  }

  if (listOfCategotyRes.data != null &&
      listOfCategotyRes.data.group != null &&
      listOfCategotyRes.data.group.length > 0) {
    listOfCategory = listOfCategotyRes.data;
  } else if (HARDCORE_DATA_IS_ENABLE) {
    print("   / use HardCOre DATA contactUsInfo");
    listOfCategory = listOfCategoryTempData;
  }
  print(
      '_=_ get successfully listOfCategory group length: ${listOfCategory.group.length}');
}
