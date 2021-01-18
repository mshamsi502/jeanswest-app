// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
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
  int moneyBuying;
  //
  int receivedGift;
  int someOfInvited;
  int someOfInstallFromInvited;
  int someOfShoppingFromInvited;
  List<User> friends;
  //

  User({
    this.perName,
    this.engName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.dayOfBirth,
    this.monthOfBirth,
    this.yearOfBirth,
    this.moneyBuying,
    //
    this.receivedGift,
    this.someOfInvited,
    this.someOfInstallFromInvited,
    this.someOfShoppingFromInvited,
    this.friends,
    //
  });
}
