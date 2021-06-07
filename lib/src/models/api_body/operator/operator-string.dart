// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

class OperationString {
  String oEQ;
  String oGT;
  String oLT;
  String oGTE;
  String oLTE;
  String oIN;
  String oNOT;
  String oCT;
  //
  Map<String, dynamic> map;

  OperationString({
    this.oEQ,
    this.oGT,
    this.oLT,
    this.oGTE,
    this.oLTE,
    this.oIN,
    this.oNOT,
    this.oCT,
  }) {
    
    this.map = {};
    if (oEQ != null) map["eq"] = oEQ;
    if (oGT != null) map["gt"] = oGT;
    if (oLT != null) map["lt"] = oLT;
    if (oGTE != null) map["gte"] = oGTE;
    if (oLTE != null) map["lte"] = oLTE;
    if (oIN != null) map["in"] = oIN;
    if (oNOT != null) map["not"] = oNOT;
    if (oCT != null) map["ct"] = oCT;
    // print("OperationString mapppp created id : $map");
  }
}
