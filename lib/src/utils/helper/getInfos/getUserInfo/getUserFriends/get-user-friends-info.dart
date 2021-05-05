//

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-friends-info.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFriends/user-friends-info-res.dart';
import 'package:jeanswest/src/models/profile/user/user-friends-info.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';
import 'package:jeanswest/src/models/profile/gender/gender.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:shamsi_date/shamsi_date.dart';

Future<void> userMainFriends() async {
  UserFriendsInfoRes userFriendsInfoRes =
      await globalLocator<GlobalRestClient>().getUserFriendsInfo();
  // ignore: deprecated_member_use
  List<UserMainInfo> friends = List<UserMainInfo>();
  userFriendsInfoRes.friends.forEach((friend) {
    Gender gender = friend.gender == 'male'
        ? male
        : friend.gender == 'female'
            ? female
            : null;
    List<String> date = friend.birthDate.split("-");
    Gregorian gregorian = new Gregorian(
        int.parse(date[0]), int.parse(date[1]), int.parse(date[2]));
    Jalali jalali = gregorian.toJalali();
    friends.add(UserMainInfo(
      firstName: friend.firstName,
      lastName: friend.lastName,
      email: friend.email,
      gender: gender,
      yearOfBirth: jalali.year.toString(),
      monthOfBirth: jalali.month.toString(),
      dayOfBirth: jalali.day.toString(),
    ));
  });

  userFriends = UserFriendsInfo(friends: friends);
  print(
      '_=_ get successfully UserFriendsInfo: ${userFriends.friends.length}, firstFriend: ${userFriends.friends[0].firstName}');
  // ! ==> get and create successfully UserFriendsInfo
}
