// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/models/api_body/operator/operator-string.dart';

class ProductFilterReqBody {
  OperationString name;
  OperationString nameFA;
  OperationString brand;
  OperationString group;
  OperationString subGroup;
  OperationString styleFA;
  OperationString color;
  OperationString colorFamily;
  OperationString colorCode;
  OperationString size;
  OperationString category;
  OperationString material;
  OperationString gender;
  OperationString seasonCode1;
  OperationString seasonCode2;
  OperationString ageGroup;
  OperationString basePrice;
  OperationString cutting;
  //
  Map<String, dynamic> map;

  ProductFilterReqBody({
    this.name,
    this.nameFA,
    this.brand,
    this.group,
    this.subGroup,
    this.styleFA,
    this.color,
    this.colorFamily,
    this.colorCode,
    this.size,
    this.category,
    this.material,
    this.gender,
    this.seasonCode1,
    this.seasonCode2,
    this.ageGroup,
    this.basePrice,
    this.cutting,
  }) {
    this.map = {};
    if (name != null) map["name"] = name.map;
    if (nameFA != null) map["nameFA"] = nameFA.map;
    if (brand != null) map["brand"] = brand.map;
    if (group != null) map["group"] = group.map;
    if (subGroup != null) map["subGroup"] = subGroup.map;
    if (styleFA != null) map["styleFA"] = styleFA.map;
    if (color != null) map["color"] = color.map;
    if (colorFamily != null) map["colorFamily"] = colorFamily.map;
    if (colorCode != null) map["colorCode"] = colorCode.map;
    if (size != null) map["size"] = size.map;
    if (category != null) map["category"] = category.map;
    if (material != null) map["material"] = material.map;
    if (gender != null) map["gender"] = gender.map;
    if (seasonCode1 != null) map["seasonCode1"] = seasonCode1.map;
    if (seasonCode2 != null) map["seasonCode2"] = seasonCode2.map;
    if (ageGroup != null) map["ageGroup"] = ageGroup.map;
    if (basePrice != null) map["basePrice"] = basePrice.map;
    if (cutting != null) map["cutting"] = cutting.map;
    // print("mapppp created id : $map");
  }
}
