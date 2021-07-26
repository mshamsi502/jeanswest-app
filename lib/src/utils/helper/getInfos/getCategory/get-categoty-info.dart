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
  } catch (e) {
    // printErrorMessage(e);
    if (HARDCORE_DATA_IS_ENABLE) {
      print("   / use HardCOre DATA listOfCategory");
      listOfCategory = listOfCategoryTempData;
    }
  }
  if (listOfCategotyRes != null &&
      listOfCategotyRes.data != null &&
      listOfCategotyRes.data.group != null &&
      listOfCategotyRes.data.group.length > 0) {
    listOfCategory = listOfCategotyRes.data;
    print(
        '_=_ get successfully listOfCategory group length: ${listOfCategory.group.length}');
    print('_=_ get successfully listOfCategory  : $listOfCategory');
  } else
    print('_=_ listOfCategory is Empty');
  listOfCategory = sortCategotyElements(listOfCategory);

  // if (listOfCategotyRes.data != null &&
  //     listOfCategotyRes.data.group != null &&
  //     listOfCategotyRes.data.group.length > 0) {
  //   listOfCategory = listOfCategotyRes.data;
  // } else if (HARDCORE_DATA_IS_ENABLE) {
  //   print("   / use HardCOre DATA contactUsInfo");
  //   listOfCategory = listOfCategoryTempData;
  // }
  // if (listOfCategory != null && listOfCategory.group.length > 0)
  //   print(
  //       '_=_ get successfully listOfCategory group length: ${listOfCategory.group.length}');
  // if (listOfCategory != null && listOfCategory.colorFamily.length > 0)
  // catColors = createCategotyColors(listOfCategory);
  // else
  //   catColors = tempCatColors;
  // print(
  //     '_=_ create successfully category Colors, length: ${catColors.length}');
}

// List<CategoryColorRes> sortColors(ListOfCategory categoty) {
//   List<CategoryColorRes> colors = [];
// }
// List<CategoryColor> createCategotyColors(ListOfCategory categoty) {
//   List<CategoryColor> colors = [];
// TODO : color
  // categoty.colorFamily.forEach((element) {
  //   switch (element) {
  //     case "آبي و سرمه اي":
  //       {
  //         if (!colors.contains(blueGroupColor)) colors.add(blueGroupColor);
  //         break;
  //       }
  //     case "سبزآبي و فيروزه اي":
  //       {
  //         if (!colors.contains(lightBlueGroupColor))
  //           colors.add(lightBlueGroupColor);
  //         break;
  //       }
  //     case "سبز و شكاري نظامي":
  //       {
  //         if (!colors.contains(greenGroupColor)) colors.add(greenGroupColor);
  //         break;
  //       }
  //     case "زيتوني و جيد":
  //       {
  //         if (!colors.contains(greenGroupColor)) colors.add(greenGroupColor);
  //         break;
  //       }
  //     case "صورتي و بنفش":
  //       {
  //         if (!colors.contains(purpleGroupColor)) colors.add(purpleGroupColor);
  //         break;
  //       }
  //     case "نارنجي و قرمز و زرشكي":
  //       {
  //         if (!colors.contains(redGroupColor)) colors.add(redGroupColor);
  //         break;
  //       }
  //     case "سفيد و شيري و بژ":
  //       {
  //         if (!colors.contains(whiteGroupColor)) colors.add(whiteGroupColor);
  //         break;
  //       }
  //     case "طوسي و مشكي":
  //       {
  //         if (!colors.contains(greyGroupColor)) colors.add(greyGroupColor);
  //         break;
  //       }
  //     case "تركيبي":
  //       {
  //         if (!colors.contains(mixtureGroupColor))
  //           colors.add(mixtureGroupColor);
  //         break;
  //       }
  //     case "قهوه اي و خاكي":
  //       {
  //         if (!colors.contains(brownGroupColor)) colors.add(brownGroupColor);
  //         break;
  //       }
  //     case "زرد و خردلي":
  //       {
  //         if (!colors.contains(yellowGroupColor)) colors.add(yellowGroupColor);
  //         break;
  //       }
  //     default:
  //       {
  //         colors.add(CategoryColor(
  //           engName: "",
  //           perName: element,
  //           image: Container(
  //             width: 60,
  //             height: 60,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(50),
  //                 color: Colors.grey[300]),
  //           ),
  //         ));
  //         break;
  //       }
  //   }
  // });

  //
  // int index = 0;
  // colors.forEach((element) {
  // print("color created colors[$index] : ${element.perName}");
  // index++;
  // });

//   return colors;
// }
