// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/models/api_body/operator/operator-string.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-filter-req-body.dart';

class ProductOptionReqBody {
  ProductFilterReqBody ascent;
  OperationString sort;
  //
  Map<String, dynamic> map;

  ProductOptionReqBody({
    this.ascent,
    this.sort,
  }) {
    this.map = {};
    if (ascent != null) map["ascent"] = ascent.map;
    if (sort != null) map["sort"] = sort.map;
    // print("mapppp created id : $map");
  }
}
