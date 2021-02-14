//
import 'package:jeanswest/src/models/api_response/userRes/userInvite/user-invite-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/user-main-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFriends/user-friends-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userPayment/user-payment-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/user-addresses-info-res.dart';
//
import 'package:jeanswest/src/constants/global/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-friends-info.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-payment-info.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-invite-info.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-addresses-info.dart';
//
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';
import 'package:jeanswest/src/models/profile/user/user-friends-info.dart';
import 'package:jeanswest/src/models/profile/user/user-invite-info.dart';
import 'package:jeanswest/src/models/profile/user/user-payment-info.dart';
import 'package:jeanswest/src/models/address/address.dart';
import 'package:jeanswest/src/models/dateTimeOnData/date-time-on-data.dart';
//
import 'package:jeanswest/src/models/profile/gender/gender.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/mockoonApis/rest_client_global.dart';
import 'package:shamsi_date/shamsi_date.dart';

getAllUserInfo({String token}) async {
  UserMainInfoRes userAccount =
      await globalLocator<GlobalRestClient>().getUserMainInfo();
  user = createUserInfo(userAccount);
  print(
      '_=_ get successfully UserMainInfo : ${user.firstName} ${user.lastName}');
  // ! ==> get and create successfully UserMainInfo
  UserFriendsInfoRes userFriendsInfoRes =
      await globalLocator<GlobalRestClient>().getUserFriendsInfo();
  userFriends = createUserFriends(userFriendsInfoRes);
  print(
      '_=_ get successfully UserFriendsInfo: ${userFriends.friends.length}, firstFriend: ${userFriends.friends[0].firstName}');
  // ! ==> get and create successfully UserFriendsInfo
  UserInviteInfoRes userInviteInfoRes =
      await globalLocator<GlobalRestClient>().getUserInviteInfo();
  userInvite = createUserInvites(userInviteInfoRes);
  print('_=_ get successfully UserInviteInfo: ${userInvite.receivedGift}');
  // ! ==> get and create successfully UserInviteInfo
  UserPaymentInfoRes userPaymentInfoRes =
      await globalLocator<GlobalRestClient>().getUserPaymentInfo();
  userPayment =
      new UserPaymentInfo(moneyBuying: userPaymentInfoRes.moneyBuying);
  print(
      '_=_ get successfully UserPaymentInfo: ${userPaymentInfoRes.moneyBuying}');
  // ! ==> get and create successfully UserPaymentInfo
  UserAddressesInfoRes userAddressesInfoRes =
      await globalLocator<GlobalRestClient>().getUserAddressesInfo();
  userAddresses = createuserAddresses(userAddressesInfoRes);
  print(
      '_=_ get successfully userAddresses: ${userAddresses.length}, ${userAddresses[0].title}');
  // ! ==> get and create successfully UserAddressesInfo

  // TODO ==> get and create successfully UserPaymentInfo
  // ! ==> get and create successfully UserAddressesInfo
  // TODO ==> get and create successfully UserInviteInfo
  // ! ==> get and create successfully UserAddressesInfo
  // TODO ==> get and create successfully UserInviteInfo
  // ! ==> get and create successfully UserAddressesInfo
}

// ***

UserInviteInfo createUserInvites(UserInviteInfoRes userInviteInfoRes) {
  return UserInviteInfo(
    receivedGift: userInviteInfoRes.receivedGift,
    someOfInvited: userInviteInfoRes.someOfInvited,
    someOfInstallFromInvited: userInviteInfoRes.someOfInstallFromInvited,
    someOfShoppingFromInvited: userInviteInfoRes.someOfShoppingFromInvited,
  );
}

UserMainInfo createUserInfo(UserMainInfoRes userAccount) {
  Gender gender = userAccount.gender == 'male'
      ? male
      : userAccount.gender == 'female'
          ? female
          : other;
  List<String> date = userAccount.birthDate.split("-");
  Gregorian gregorian =
      new Gregorian(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]));
  Jalali jalali = gregorian.toJalali();

  return UserMainInfo(
    firstName: userAccount.firstName,
    lastName: userAccount.lastName,
    email: userAccount.email,
    gender: gender,
    yearOfBirth: jalali.year.toString(),
    monthOfBirth: jalali.month.toString(),
    dayOfBirth: jalali.day.toString(),
  );
}

UserFriendsInfo createUserFriends(UserFriendsInfoRes userFriendsInfoRes) {
  List<UserMainInfo> friends = new List<UserMainInfo>();
  userFriendsInfoRes.friends.forEach((friend) {
    Gender gender = friend.gender == 'male'
        ? male
        : friend.gender == 'female'
            ? female
            : other;
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

  return UserFriendsInfo(friends: friends);
}

List<Address> createuserAddresses(UserAddressesInfoRes userAddressesInfoRes) {
  List<AddressInfoRes> userAddressesInfo = userAddressesInfoRes.addresses;
  List<Address> addresses = new List<Address>();
  userAddressesInfo.forEach((address) {
    addresses.add(
      Address(
        id: address.id,
        title: address.title,
        recieverFirstName: address.recieverFirstName,
        recieverLastName: address.recieverLastName,
        recieverMobile: address.recieverMobile,
        country: address.country,
        province: address.province,
        city: address.city,
        district: address.district,
        address: address.address,
        houseNumber: address.houseNumber,
        unitNumber: address.unitNumber,
        postalCode: address.postalCode,
        latitude: address.latitude,
        longtitude: address.longtitude,
        active: address.active,
        isUser: address.isUser,
        personId: address.personId,
        datetime: DateTimeOnData(
          createdAt: address.dateTime.createdAt,
          updatedAt: address.dateTime.updatedAt,
          deletedAt: address.dateTime.deletedAt,
        ),
      ),
    );
  });
  return addresses;
}
