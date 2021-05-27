//
// import 'package:flutter/cupertino.dart';

//
import 'package:jeanswest/src/constants/global/globalInstances/invite-friends-faq-data.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-favorites-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getInviteFriendsFaqInfo/get-invite-friends-faq.dart';
// import 'package:jeanswest/src/utils/helper/getInfos/getLevelCardsInfo/get-level-cards-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserMainInfo/get-user-main-info.dart';
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
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-payment-info.dart';

Future<void> getAllUserInfo() async {
  print(
      'USER_MAIN_INFO ********************************************************');
  user = await getUserMainInfo();
  //
  // await userMainFriends();
  //
  // await userInviteInfo();
  //
  print(
      'USER_PAYMENT **********************************************************');
  userPayment = await userPaymentInfo(user.tblPosCustomersID);

  //
  print(
      'USER_ADDRESSES ********************************************************');
  userAddresses = await userAddressesInfo();
  //
  print(
      'USER_FAVORITES ********************************************************');
  userFavorites = await userFavoritesInfo(user.tblPosCustomersID);
  //
  print(
      'USER_ORDERS ***********************************************************');
  await userOrdersInfo();
  //
  print(
      'USER_TICKETS **********************************************************');
  await userTicketsInfo();
  //
  print(
      'USER_MESSAGES *********************************************************');
  await userMessagesInfo();
  //
  print(
      'USER_COPOUNS **********************************************************');
  await userCouponsInfo();

  //

  //
  // !
  print(
      'GLOBAL_CONTACT_US *****************************************************');
  await getContactUsInfo();
  //
  print(
      'GLOBAL_SUPPORT_FAQ ****************************************************');
  await getFaqInfo();
  //
  // print('***************************************************************');
  // await getLevelCardsInfo();
  //
  print(
      'GLOBAL_INVITE_FRIENDS_FAQ *********************************************');
  inviteFriendsFAQ = await getInviteFriendFAQInfo();
  //
  print(
      '***********************************************************************');
}

// ***
