// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_profile
// *   Created Date & Time :  2020-11-25  ,  02:36 PM
// ****************************************************************************

// ignore: must_be_immutable
import 'gender.dart';

class User {
  String perName;
  String engName;
  String email;
  String phoneNumber;
  Gender gender;
  String dayOfBirth;
  String monthOfBirth;
  String yearOfBirth;

  User({
    this.perName,
    this.engName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.dayOfBirth,
    this.monthOfBirth,
    this.yearOfBirth,
  });
}
