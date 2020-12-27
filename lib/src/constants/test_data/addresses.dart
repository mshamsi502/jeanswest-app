import 'package:jeanswest/src/models/user_address/user_address.dart';

import 'friends.dart';
import 'user.dart';

UserAddress firstAddress = new UserAddress(
  name: user.perName,
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
  name: user.perName,
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
  name: firstFriend.perName,
  mobilePhoneNumber: firstFriend.phoneNumber,
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
