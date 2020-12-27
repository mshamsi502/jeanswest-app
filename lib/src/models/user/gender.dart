// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_profile
// *   Created Date & Time :  2020-11-25  ,  02:36 PM
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
