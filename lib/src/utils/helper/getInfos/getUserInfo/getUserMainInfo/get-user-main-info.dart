//

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-data.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-res.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userTblPosCust/user-tbl-pos-cust-res.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';

Future<UserMainInfo> userMainInfo() async {
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

  try {
    userTblPosCustRes = await globalLocator<GlobalRestClient>()
        .getUserErp(mobile); // ! from real API

  } catch (errorRealAPI) {
    print('Catch Error from getUserErp ** Real API ** !');
    printErrorMessage(errorRealAPI);
    print('*********************************');
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

//
  // user = createUser(
  //   userAccount: userAccountRes.data,
  //   userTblPosCustRes: userTblPosCustRes.data[0].tblPosCustomersID,
  //   dateFormat: "yyyy-MM-dd",
  // );
  // }
  user = createUser(
      userAccount: userAccountRes.data,
      userTblPosCustRes: userTblPosCustRes.data[0].tblPosCustomersID,
      dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  // print(
  //     '_=_ get successfully UserMainInfo : ${user.firstName} ${user.lastName}');
  return user;
}

createUser({
  @required UserMainInfoData userAccount,
  String userTblPosCustRes,
  String dateFormat = "yyyy-MM-dd",
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
