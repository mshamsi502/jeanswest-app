//
// import 'package:flutter/cupertino.dart';

//
import 'package:flutter/cupertino.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/category.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/invite-friends-faq-data.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-favorites-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-message-info.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_body/PagenationFilter/page-filter-req-body.dart';
import 'package:jeanswest/src/models/api_body/PagenationFilter/page-option-req-body.dart';
import 'package:jeanswest/src/models/api_body/PagenationFilter/page-req-body.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-int.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-string.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMessage/user-message-result.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getCategory/get-categoty-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getInviteFriendsFaqInfo/get-invite-friends-faq.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getLevelCardsInfo/get-level-cards-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserCouponsInfo/get-user-coupons-info.dart';
// import 'package:jeanswest/src/utils/helper/getInfos/getLevelCardsInfo/get-level-cards-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserMainInfo/get-user-main-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserMessagesInfo/get-user-messages-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserPaymentInfo/get-user-payment-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserFavoritesInfo/get-user-favorites-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserOrdersInfo/get-user-orders-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserTicketsInfo/get-user-tickets-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserAddressesInfo/get-user-addresses-info.dart';
//
import 'package:jeanswest/src/utils/helper/getInfos/getContactUsInfo/get-contact-us-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getFaqInfo/get-faq-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getReturnPolicyInfo/get-return-policy-info.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getAboutUsInfo/get-about-us-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-tickets-info.dart';

import 'package:jeanswest/src/utils/helper/profile/helper_main_profile.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-payment-info.dart';

Future<void> getAllUserInfo({@required Function() noAuth}) async {
  bool getIsContinued = true;
  UserMainInfoRes userAccountRes;

  // if (!MOCK_IS_ENABLE &&
  //     (sharedPrefs.getString(TOKEN) == null ||
  //         sharedPrefs.getString(TOKEN) == "")) {
  //   noAuth();
  // }
  print(
      'USER_MAIN_INFO ********************************************************');
  if (getIsContinued)
    userAccountRes = await getUserMainInfo(notAuth: () {
      getIsContinued = false;
      print('getIsContinued : $getIsContinued');
      tryToGetAllUserInfo = -1;
      noAuth();
    });
  // print('getIsContinued : $getIsContinued');

  if (getIsContinued) {
    print(
        'USER_PAYMENT **********************************************************');
    userPayment = await userPaymentInfo();

    // print("userPayment : ${userPayment.tblPosCustomersID}");
    print(
        'CREATE_USER_ACCOUNT ***************************************************');

    if (userPayment.tblPosCustomersID != null &&
        // userPayment.tblPosCustomersID.length != 0) {
        userPayment.tblPosCustomersID != "") {
      user = createUser(
          userAccount: userAccountRes.data,
          userTblPosCustRes: userPayment.tblPosCustomersID,
          // dateFormat: STANDARD_DATE_FORMAT);
          dateFormat: SMALL_JUST_DATE_FORMAT);
    }

    // await userInviteInfo();
    //

    //
    print(
        'USER_ADDRESSES ********************************************************');
    userAddresses = await userAddressesInfo();
    // print("userAddresses : ${userAddresses}");
    print(
        'USER_FAVORITES ********************************************************');
    userFavorites = await userFavoritesInfo(user.tblPosCustomersID);

    print(
        'USER_ORDERS ***********************************************************');
    await userOrdersInfo();

    print(
        'USER_TICKETS **********************************************************');
    userTickets = await getUserTicketsInfo();

    print(
        'USER_MESSAGES *********************************************************');
    PageReqBody body = PageReqBody(
        filter: PageFilterReqBody(
            createdAt: OperationString(oGT: "2021-01-01 00:00:00")),
        option: PageOptionReqBody(
            page: OperationInt(oEQ: 1),
            limit: OperationInt(oEQ: SOME_OF_IN_PAGENATION_LIST)));

    // ignore: deprecated_member_use
    userNotifs = new List<UserMessageResult>();
    Map<String, dynamic> result = await userMessagesInfo(body: body.map);
    userNotifs = result["messages"];
    print(
        'USER_COPOUNS **********************************************************');
    await userCouponsInfo();
  }

  // !
  print(
      'GLOBAL_CONTACT_US *****************************************************');

  await getContactUsInfo();
  //
  print(
      'GLOBAL_SUPPORT_FAQ ****************************************************');
  await getFaqInfo();

  print(
      'GLOBAL_RETURN_POLICY ****************************************************');
  await getReturnPolicyInfo();
  //
  print('GLOBAL_ABOUT_US ****************************************************');
  await getAboutUsInfo();
  //
  print(
      'GLOBAL_LEVEL_CARDS ****************************************************');
  await getLevelCardsInfo();
  //
  print(
      'GLOBAL_INVITE_FRIENDS_FAQ *********************************************');
  inviteFriendsFAQ = await getInviteFriendFAQInfo();
  print('GLOBAL_CATEGORY *********************************************');
  await getCategoryInfo();

  //
  print(
      '***********************************************************************');
}
// ***
