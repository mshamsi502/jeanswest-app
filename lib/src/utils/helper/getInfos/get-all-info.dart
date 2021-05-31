//
// import 'package:flutter/cupertino.dart';

//
import 'package:flutter/cupertino.dart';
import 'package:jeanswest/src/constants/global/globalInstances/invite-friends-faq-data.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-favorites-info.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-res.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getInviteFriendsFaqInfo/get-invite-friends-faq.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getLevelCardsInfo/get-level-cards-info.dart';
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
import 'package:jeanswest/src/utils/helper/getInfos/getReturnPolicyInfo/get-return-policy-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getAboutUsInfo/get-about-us-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-tickets-info.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_main_profile.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-payment-info.dart';

Future<void> getAllUserInfo({@required Function noAuth}) async {
  bool getIsContinued = true;
  UserMainInfoRes userAccountRes;
  print(
      'USER_MAIN_INFO ********************************************************');
  if (getIsContinued)
    userAccountRes = await getUserMainInfo(notAuth: () {
      getIsContinued = false;
      noAuth();
    });
  if (getIsContinued) {
    print(
        'USER_PAYMENT **********************************************************');
    userPayment = await userPaymentInfo();

    print(
        'CREATE_USER_ACCOUNT ***************************************************');

    if (userPayment.tblPosCustomersID != null &&
        userPayment.tblPosCustomersID.length != 0) {
      user = createUser(
          userAccount: userAccountRes.data,
          userTblPosCustRes: userPayment.tblPosCustomersID,
          dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    }

    //
    // await userMainFriends();
    //
    // await userInviteInfo();
    //

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
    userTickets = await getUserTicketsInfo();
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
    print(
        'GLOBAL_RETURN_POLICY ****************************************************');
    await getReturnPolicyInfo();
    //
    print(
        'GLOBAL_ABOUT_US ****************************************************');
    await getAboutUsInfo();
    //
    print('***************************************************************');
    await getLevelCardsInfo();
    //
    print(
        'GLOBAL_INVITE_FRIENDS_FAQ *********************************************');
    inviteFriendsFAQ = await getInviteFriendFAQInfo();
    //
    print(
        '***********************************************************************');
  }
}
// ***
