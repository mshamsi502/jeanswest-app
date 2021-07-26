import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/models/categoryColor/category-color.dart';

// List<CategoryColor> catColors = [];

// //

//!       "آبي و سرمه اي"
CategoryColor blueGroupColor = CategoryColor(
  engName: "blue",
  perName: "آبي و سرمه اي",
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/blue_group_color.svg',
    width: 60,
    height: 60,
  ),
  priority: 1,
);

//!       "نارنجي و قرمز و زرشكي",
CategoryColor redGroupColor = CategoryColor(
  engName: "orange",
  perName: "نارنجي و قرمز و زرشكي",
  priority: 2,
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/red_group_color.svg',
    width: 60,
    height: 60,
  ),
);
//!       "زرد و خردلي",
CategoryColor yellowGroupColor = CategoryColor(
  engName: "yellow",
  perName: "زرد و خردلي",
  priority: 3,
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/yellow_group_color.svg',
    width: 60,
    height: 60,
  ),
);
//!      "طوسي و مشكي",
CategoryColor greyGroupColor = CategoryColor(
  engName: "black",
  perName: "طوسي و مشكي",
  priority: 4,
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/grey_group_color.svg',
    width: 60,
    height: 60,
  ),
);
//!       "سفيد و شيري و بژ",
CategoryColor whiteGroupColor = CategoryColor(
  engName: "white",
  perName: "سفيد و شيري و بژ",
  priority: 5,
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/white_group_color.svg',
    width: 60,
    height: 60,
  ),
);

//!       "صورتي و بنفش",
CategoryColor purpleGroupColor = CategoryColor(
  engName: "pink",
  perName: "صورتي و بنفش",
  priority: 6,
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/purple_group_color.svg',
    width: 60,
    height: 60,
  ),
);
//!       "قهوه اي و خاكي",
CategoryColor brownGroupColor = CategoryColor(
  engName: "brown",
  perName: "قهوه اي و خاكي",
  priority: 7,
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/brown_group_color.svg',
    width: 60,
    height: 60,
  ),
);

//!       "تركيبي",
CategoryColor mixtureGroupColor = CategoryColor(
  engName: "mix",
  perName: "تركيبي",
  priority: 8,
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/mixture_group_color.svg',
    width: 60,
    height: 60,
  ),
);

//!       "سبز و شكاري نظامي" and "زيتوني و جيد"
CategoryColor greenGroupColor = CategoryColor(
  engName: "green - olive",
  perName: "سبز و شكاري نظامي - زيتوني و جيد",
  priority: 9,
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/green_group_color.svg',
    width: 60,
    height: 60,
  ),
);
//!       "سبزآبي و فيروزه اي",
CategoryColor lightBlueGroupColor = CategoryColor(
  engName: "green-blue",
  perName: "سبزآبي و فيروزه اي",
  priority: 10,
  image: SvgPicture.asset(
    'assets/images/svg_images/store/category/color/light_blue_group_color.svg',
    width: 60,
    height: 60,
  ),
);
//
// ! temp hardcore data
List<CategoryColor> tempCatColors = [
  blueGroupColor,
  redGroupColor,
  yellowGroupColor,
  greyGroupColor,
  whiteGroupColor,
  purpleGroupColor,
  brownGroupColor,
  mixtureGroupColor,
  greenGroupColor,
  lightBlueGroupColor,
];
