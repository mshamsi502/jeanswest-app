// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/models/api_body/operator/operator-string.dart';

class PageFilterReqBody {
  OperationString createdAt;
  // OperationString updatedAt;
  //
  Map<String, dynamic> map;

  PageFilterReqBody({
    this.createdAt,
  }) {
    this.map = {};
    if (createdAt != null) map["created_at"] = createdAt.map;
    // if (updatedAt != null) map["updated_at"] = updatedAt;
    // print("PageFilterReqBody mapppp created id : $map");
  }
}
