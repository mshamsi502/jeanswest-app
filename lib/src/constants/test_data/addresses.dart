// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/models/user/userAddress/user-address.dart';

import 'package:jeanswest/src/constants/global/userAllInfo.dart';

UserAddress firstAddress = new UserAddress(
  name: "${user.firstName} ${user.lastName}",
  mobilePhoneNumber: user.phoneNumber,
  homePhoneNumber: '021443147209',
  stateAddress: 'تهران',
  cityAddress: 'تهران',
  blockAddress: 'منطقه 5 - پونک',
  postCode: '1469615475',
  postAddress:
      'بلوار اشرفی اصفهانی - خیابان طباطبایی - ساختمان رویال - واحد ۲۱',
  titleAddress: 'آدرس اول',
  explain: ' خودم - دفتر اشرفی',
);
UserAddress secondAddress = new UserAddress(
  name: "${user.firstName} ${user.lastName}",
  mobilePhoneNumber: user.phoneNumber,
  homePhoneNumber: '021443147209',
  stateAddress: 'تهران',
  cityAddress: 'تهران',
  blockAddress: 'منطه 5 - پونک',
  postCode: '1469615475',
  postAddress: 'بلوار سردار جنگل - کوچه شقایق - پلاک 5124',
  titleAddress: 'آدرس دوم',
  explain: ' خودم - خونه شقایق',
);
UserAddress thirdAddress = new UserAddress(
  name: "${user.firstName} ${user.lastName}",
  mobilePhoneNumber: userFriends.friends[0] != null
      ? userFriends.friends[0].phoneNumber
      : user.phoneNumber,
  stateAddress: 'تهران',
  cityAddress: 'تهران',
  blockAddress: 'منطقه 5 - پونک',
  postCode: '1469615475',
  postAddress:
      'بلوار اشرفی اصفهانی - خیابان طباطبایی - ساختمان رویال - واحد ۲۱',
);
List<UserAddress> myAddresses = [
  firstAddress,
  secondAddress,
  thirdAddress,
  firstAddress,
];
UserAddress selectedAddress;
//
//
