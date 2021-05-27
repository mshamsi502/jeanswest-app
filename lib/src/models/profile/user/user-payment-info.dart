// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

class UserPaymentInfo {
  String tblPosCustomersID;
  int payRial;
  int payToman;
  String cusType;
  String cTypeName;
  int priceLevel;
  int priceLevelTo;

  //

  UserPaymentInfo({
    this.tblPosCustomersID,
    this.payRial,
    this.cusType,
    this.cTypeName,
    this.priceLevel,
    this.priceLevelTo,
  }) {
    payToman = payRial == 0 ? 0 : payRial ~/ 10;
  }
}
