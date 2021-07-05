// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

class OperationString {
  List<String> oEQL;
  String oEQ;
  String oGT;
  String oLT;
  String oGTE;
  String oLTE;
  String oIN;
  String oNOT;
  List<String> oCT;
  //
  Map<String, dynamic> map;

  OperationString({
    this.oEQL,
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
    if (oEQL != null && oEQL.length > 0) map["eq"] = oEQL;
    if (oEQ != null) map["eq"] = oEQ;
    if (oGT != null) map["gt"] = oGT;
    if (oLT != null) map["lt"] = oLT;
    if (oGTE != null) map["gte"] = oGTE;
    if (oLTE != null) map["lte"] = oLTE;
    if (oIN != null) map["in"] = oIN;
    if (oNOT != null) map["not"] = oNOT;
    if (oCT != null && oCT.length > 0) map["ct"] = oCT;
    // print("OperationString mapppp created id : $map");
  }
}
