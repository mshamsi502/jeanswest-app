// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/models/api_body/PagenationFilter/page-filter-req-body.dart';
import 'package:jeanswest/src/models/api_body/PagenationFilter/page-option-req-body.dart';

class PageReqBody {
  PageFilterReqBody filter;
  PageOptionReqBody option;
  //
  Map<String, dynamic> map;

  PageReqBody({
    this.filter,
    this.option,
  }) {
    this.map = {};
    if (filter != null) map["filter"] = filter.map;
    if (option != null) map["option"] = option.map;
    // print("PageReqBody mapppp created id : $map");
  }
}
