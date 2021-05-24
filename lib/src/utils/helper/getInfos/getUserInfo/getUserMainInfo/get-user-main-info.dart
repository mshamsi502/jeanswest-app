//

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-data.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-res.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userTblPosCust/user-tbl-pos-cust-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';

Future<UserMainInfo> getUserMainInfo() async {
  UserMainInfoRes userAccountRes = UserMainInfoRes();
  UserTblPosCustRes userTblPosCustRes;
  UserMainInfo user;
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
    }
  }

  //////
  Map<String, String> mobile = {
    "mobile": userAccountRes.data.phoneNumber,
  };
  print('"mobile": ${userAccountRes.data.phoneNumber}');
  try {
    userTblPosCustRes = await globalLocator<GlobalRestClient>()
        .getUserErp(mobile); // ! from real API

  } catch (errorRealAPI) {
    print('Catch Error from getUserErp ** Real API ** !');

    // printErrorMessage(errorRealAPI);
    print('*********************************');
    print('564156465');
    if (MOCK_IS_ENABLE) {
      try {
        userTblPosCustRes = await globalLocator<GlobalRestClient>()
            .getMockUserErp(); // ! from mockoon

      } catch (errorRealAPI) {
        print('Catch Error from getMockUserErp ** Mockoon ** !');
        printErrorMessage(errorRealAPI);
        print('*********************************');
      }
    }
  }

  user = createUser(
      userAccount: userAccountRes.data,
      userTblPosCustRes: (userTblPosCustRes == null ||
              userTblPosCustRes.data == null ||
              userTblPosCustRes.data.length == 0 ||
              userTblPosCustRes.data[0] == null ||
              userTblPosCustRes.data[0].tblPosCustomersID == null)
          ? "11998315"
          : userTblPosCustRes.data[0].tblPosCustomersID,
      dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  return user;
}

Future<UserMainInfo> editUserMainInfo(UserMainInfo newUser) async {
  UserMainInfoRes userAccountRes = UserMainInfoRes();
  UserTblPosCustRes userTblPosCustRes;
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

  //////
  Map<String, String> mobile = {
    "mobile": userAccountRes.data.phoneNumber,
  };
  print('mobile');
  try {
    userTblPosCustRes = await globalLocator<GlobalRestClient>()
        .getUserErp(mobile); // ! from real API

  } catch (errorRealAPI) {
    print('Catch Error from getUserErp ** Real API ** !');

    printErrorMessage(errorRealAPI);
    print('*********************************');
    print('564156465');
    if (MOCK_IS_ENABLE) {
      try {
        userTblPosCustRes = await globalLocator<GlobalRestClient>()
            .getMockUserErp(); // ! from mockoon

      } catch (errorRealAPI) {
        print('Catch Error from getMockUserErp ** Mockoon ** !');
        printErrorMessage(errorRealAPI);
        print('*********************************');
      }
    }
  }

  user = createUser(
      userAccount: userAccountRes.data,
      userTblPosCustRes: (userTblPosCustRes == null ||
              userTblPosCustRes.data == null ||
              userTblPosCustRes.data.length == 0 ||
              userTblPosCustRes.data[0] == null ||
              userTblPosCustRes.data[0].tblPosCustomersID == null)
          ? "11998315"
          : userTblPosCustRes.data[0].tblPosCustomersID,
      dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  return user;
}

createUser({
  @required UserMainInfoData userAccount,
  String userTblPosCustRes,
  String dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
}) {
  DateTime parseDate = new DateFormat(dateFormat).parse(userAccount.birthDate);
  return UserMainInfo(
    code: userAccount.code,
    tblPosCustomersID: userTblPosCustRes,
    firstName: userAccount.firstName,
    lastName: userAccount.lastName,
    email: userAccount.email,
    gender: userAccount.gender,
    phoneNumber: userAccount.phoneNumber,
    yearOfBirthGeo: parseDate.year.toString(),
    monthOfBirthGeo: parseDate.month.toString(),
    dayOfBirthGeo: parseDate.day.toString(),
  );
}
