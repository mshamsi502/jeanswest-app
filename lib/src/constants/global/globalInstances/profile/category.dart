import 'package:jeanswest/src/models/api_response/category/list-of-category.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/category-object.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/category-translation.dart';

ListOfCategory listOfCategory = ListOfCategory();
//

ListOfCategory listOfCategoryTempData = ListOfCategory(
  group: [
    CategoryObjectRes(
      id: "e65772d2-e12f-4b20-9775-e756672f1028",
      code: "JWCG-e65772d2",
      name: "clothing",
      value: ["لباس"],
      priority: 1,
      translation: [
        CategoryTranslationRes(language: "FA", value: "پوشاک"),
      ],
    ),
    CategoryObjectRes(
      id: "db23905d-b698-4bc9-9455-8bb6632ce885",
      code: "JWCG-db23905d",
      name: "bag-shoe",
      value: ["کيف و کفش"],
      priority: 2,
      translation: [
        CategoryTranslationRes(language: "FA", value: "پوشاک"),
      ],
    ),
    CategoryObjectRes(
      id: "a3599030-3e44-41fd-993e-ad0117fa614f",
      code: "JWCG-a3599030",
      name: "accessory",
      value: ["اکسسوري"],
      priority: 3,
      translation: [
        CategoryTranslationRes(language: "FA", value: "کیف و کفش"),
      ],
    ),
  ],
  subGroup: [],
  size: [],
  gender: [],
  ageGroup: [],
  colorFamily: [],
);
