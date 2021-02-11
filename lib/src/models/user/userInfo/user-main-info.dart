// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// ignore: must_be_immutable
import '../gender/gender.dart';

class UserMainInfo {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  Gender gender;
  String dayOfBirth;
  String monthOfBirth;
  String yearOfBirth;
  //

  UserMainInfo({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.dayOfBirth,
    this.monthOfBirth,
    this.yearOfBirth,
  });
}
