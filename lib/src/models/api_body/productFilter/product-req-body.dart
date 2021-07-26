// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/models/api_body/productFilter/product-filter-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-option-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-search-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-unique-req-body.dart';

class ProductReqBody {
  ProductFilterReqBody filter;
  ProductOptionReqBody option;
  ProductSearchReqBody search;
  ProductUniqueReqBody unique;
  //
  Map<String, dynamic> map;

  ProductReqBody({
    this.filter,
    this.option,
    this.search,
    this.unique,
  }) {
    this.map = {};
    if (filter != null) map["filter"] = filter.map;
    if (option != null) map["option"] = option.map;
    if (search != null) map["search"] = search.map;
    if (unique != null) map["unique"] = unique.map;
    print("mapppp created id : $map");
  }
}
