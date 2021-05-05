//

import 'package:jeanswest/src/models/api_response/userRes/userMain/user-main-info-res.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';
import 'package:jeanswest/src/models/profile/gender/gender.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:shamsi_date/shamsi_date.dart';

Future<void> userMainInfo() async {
  UserMainInfoRes userAccount =
      await globalLocator<GlobalRestClient>().getUserMainInfo();

//
  Gender gender = userAccount.gender == 'male'
      ? male
      : userAccount.gender == 'female'
          ? female
          : null;
  List<String> date = userAccount.birthDate.split("-");
  Gregorian gregorian =
      new Gregorian(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]));
  Jalali jalali = gregorian.toJalali();

  user = UserMainInfo(
    firstName: userAccount.firstName,
    lastName: userAccount.lastName,
    email: userAccount.email,
    gender: gender,
    phoneNumber: userAccount.phoneNumber,
    yearOfBirth: jalali.year.toString(),
    monthOfBirth: jalali.month.toString(),
    dayOfBirth: jalali.day.toString(),
  );

  print(
      '_=_ get successfully UserMainInfo : ${user.firstName} ${user.lastName}');
  // ! ==> get and create successfully UserMainInfo
}
