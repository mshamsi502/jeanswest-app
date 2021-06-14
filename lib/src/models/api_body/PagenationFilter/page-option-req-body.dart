// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/models/api_body/operator/operator-int.dart';

class PageOptionReqBody {
  OperationInt page;
  OperationInt limit;
  //
  Map<String, dynamic> map;

  PageOptionReqBody({
    this.page,
    this.limit,
  }) {
    this.map = {};
    if (page != null) map["page"] = page.map;
    if (limit != null) map["limit"] = limit.map;
    // print("PageOptionReqBody mapppp created id : $map");
  }
}
