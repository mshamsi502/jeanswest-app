//

import 'package:flutter/cupertino.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-res.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';

import 'package:jeanswest/src/models/profile/user/user-payment-info.dart';

import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_main_profile.dart';

Future<UserMainInfoRes> getUserMainInfo({@required Function notAuth}) async {
  UserMainInfoRes userAccountRes = UserMainInfoRes();
  // UserTblPosCustRes userTblPosCustRes;
  // UserMainInfo user;
  try {
    userAccountRes = await globalLocator<GlobalRestClient>()
        .getUserMainInfo(); // ! from real API
  } catch (errorRealAPI) {
    print('Catch Error from getUserMainInfo ** Real API ** !');
    printErrorMessage(errorRealAPI);
    print('*********************************');
    if (MOCK_IS_ENABLE) {
      try {
        userAccountRes = await globalLocator<GlobalRestClient>()
            .getMockUserMainInfo(); // ! from mockoon

      } catch (errorMockoon) {
        print('*********************************');
        print('Catch Error from getMockUserMainInfo ** Mockoon ** !');
        printErrorMessage(errorMockoon);
        print('*********************************');
      }
    } else if (errorRealAPI.response.statusCode == 401) {
      print('Token is Expired');
      notAuth();
      tryToGetAllUserInfo = -1;
    }
  }

  // //////
  // Map<String, String> mobile = {
  //   "mobile": userAccountRes.data.phoneNumber,
  // };
  // print('"mobile": ${userAccountRes.data.phoneNumber}');
  // try {
  //   userTblPosCustRes = await globalLocator<GlobalRestClient>()
  //       .getUserErp(mobile); // ! from real API

  // } catch (errorRealAPI) {
  //   print('Catch Error from getUserErp ** Real API ** !');

  //   // printErrorMessage(errorRealAPI);
  //   print('*********************************');
  //   print('564156465');
  //   if (MOCK_IS_ENABLE) {
  //     try {
  //       userTblPosCustRes = await globalLocator<GlobalRestClient>()
  //           .getMockUserErp(); // ! from mockoon

  //     } catch (errorRealAPI) {
  //       print('Catch Error from getMockUserErp ** Mockoon ** !');
  //       printErrorMessage(errorRealAPI);
  //       print('*********************************');
  //     }
  //   }
  // }

  return userAccountRes;
}

Future<UserMainInfo> editUserMainInfo(
    UserMainInfo newUser, UserPaymentInfo userPayment) async {
  UserMainInfoRes userAccountRes = UserMainInfoRes();

  UserMainInfo user;
  Map<String, dynamic> newUserMap = {
    "firstName": newUser.firstName,
    "lastName": newUser.lastName,
    "gender": newUser.gender,
    "birthDate":
        "${newUser.yearOfBirthGeo}-${newUser.monthOfBirthGeo}-${newUser.dayOfBirthGeo}T${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}.${DateTime.now().millisecond}Z",
    // "${newUser.yearOfBirthGeo}-${newUser.monthOfBirthGeo}-${newUser.dayOfBirthGeo}",
    "email": newUser.email,
  };
  print(newUserMap);
  try {
    userAccountRes = await globalLocator<GlobalRestClient>()
        .updateUserMainInfo(newUserMap); // ! from real API
  } catch (errorRealAPI) {
    print('Catch Error from editUserMainInfo ** Real API ** !');
    printErrorMessage(errorRealAPI);
    print('*********************************');
  }

  // //////
  // Map<String, String> mobile = {
  //   "mobile": userAccountRes.data.phoneNumber,
  // };
  // print('mobile');
  // try {
  //   userTblPosCustRes = await globalLocator<GlobalRestClient>()
  //       .getUserErp(mobile); // ! from real API

  // } catch (errorRealAPI) {
  //   print('Catch Error from getUserErp ** Real API ** !');

  //   printErrorMessage(errorRealAPI);
  //   print('*********************************');
  //   print('564156465');
  //   if (MOCK_IS_ENABLE) {
  //     try {
  //       userTblPosCustRes = await globalLocator<GlobalRestClient>()
  //           .getMockUserErp(); // ! from mockoon

  //     } catch (errorRealAPI) {
  //       print('Catch Error from getMockUserErp ** Mockoon ** !');
  //       printErrorMessage(errorRealAPI);
  //       print('*********************************');
  //     }
  //   }
  // }

  if (userPayment.tblPosCustomersID != null &&
      userPayment.tblPosCustomersID.length != 0) {
    user = createUser(
        userAccount: userAccountRes.data,
        userTblPosCustRes: userPayment.tblPosCustomersID,
        dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
  }

  return user;
}
