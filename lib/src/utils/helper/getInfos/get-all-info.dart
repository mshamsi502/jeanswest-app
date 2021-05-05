//
// import 'package:flutter/cupertino.dart';

//
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserMainInfo/get-user-main-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserFriends/get-user-friends-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserInviteInfo/get-user-invite-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserPaymentInfo/get-user-payment-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserFavoritesInfo/get-user-favorites-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserOrdersInfo/get-user-orders-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserTicketsInfo/get-user-tickets-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserMessagesInfo/get-user-messages-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserCouponsInfo/get-user-coupons-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserAddressesInfo/get-user-addresses-info.dart';
//
import 'package:jeanswest/src/utils/helper/getInfos/getContactUsInfo/get-contact-us-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getFaqInfo/get-faq-info.dart';

Future<void> getAllUserInfo() async {
  await userMainInfo();
  //
  await userMainFriends();
  //
  await userInviteInfo();
  //
  await userPaymentInfo();
  //
  await userFavoritesInfo();
  //
  await userOrdersInfo();
  //
  await userTicketsInfo();
  //
  await userMessagesInfo();
  //
  await userCouponsInfo();
  //
  await userAddressesInfo();
  //
  // !
  await getContactUsInfo();
  //
  await getFaqInfo();
  //
}

// ***
