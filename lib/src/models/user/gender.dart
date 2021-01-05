// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// ignore: must_be_immutable
class Gender {
  String perName;
  String engName;

  Gender({
    this.perName,
    this.engName,
  });
}

Gender female = new Gender(perName: 'زن', engName: 'Female');
Gender male = new Gender(perName: 'مرد', engName: 'Male');
Gender other = new Gender(perName: 'دیگر', engName: 'Other');
