//
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-favorites-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-jeanpoints-info.dart';
import 'package:jeanswest/src/models/api_response/userRes/userInvite/user-invite-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/user-jeanpoints-response.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/user-main-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFriends/user-friends-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userPayment/user-payment-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/user-addresses-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/user-tickets-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMessages/user-messages-info-res.dart';

//
import 'package:jeanswest/src/models/api_response/globalRes/contactUs/contact-us-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/faq/faq-res.dart';
//
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-friends-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-payment-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-invite-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-order-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-tickets-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-message-info.dart';
import 'package:jeanswest/src/models/coupon/coupon.dart';
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
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:shamsi_date/shamsi_date.dart';

Future<void> getAllUserInfo({String token}) async {
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
  userAddresses = createUserAddresses(userAddressesInfoRes);
  print(
      '_=_ get successfully userAddresses: ${userAddresses.length}, ${userAddresses[0].title}');
  // ! ==> get and create successfully UserAddressesInfo

  userFavorites = await globalLocator<GlobalRestClient>().getUserFavoriteInfo();
  print('_=_ get successfully userFavorite: ${userFavorites.data.perPage}');
  print(
      '_=_ get successfully userFavorite: ${userFavorites.data.result[0].banimodeDetails.productName}');
  // ! ==> get and create successfully UserFavoriteInfo

  userOrders = await globalLocator<GlobalRestClient>().getUserOrdersInfo();
  print('***************************************************************');
  print(
      '_=_ get successfully, offlineOrders length: ${userOrders.data.offlineOrders.length}');
  print(
      '_=_ get successfully, inProgressOrders length: ${userOrders.data.inProgressOrders.length}');
  print(
      '_=_ get successfully, compeletedOrders length: ${userOrders.data.compeletedOrders.length}');
  print(
      '_=_ get successfully, returnedOrders length: ${userOrders.data.returnedOrders.length}');
  print(
      '_=_ first offlineOrders code: ${userOrders.data.offlineOrders[0].code}');
  // ! ==> get and create successfully UserFavoriteInfo
  //
  UserTicketsRes userTicketsRes =
      await globalLocator<GlobalRestClient>().getUserTicketsInfo();
  userTickets = userTicketsRes.data;
  print('***************************************************************');
  print('_=_ get successfully, userTickets length: ${userTickets.length}');
  print('_=_ get successfully, first userTickets code: ${userTickets[0].code}');

  // ! ==> get and create successfully UserFavoriteInfo
  UserMessagesInfoRes res =
      await globalLocator<GlobalRestClient>().getUserMessagesInfo();
 userMessages = res.data;
  userTickets = userTicketsRes.data;
  print('***************************************************************');
  print('_=_ get successfully, userMessages length: ${userMessages.length}');
  print(
      '_=_ get successfully, first userMessages code: ${userMessages[0].code}');

  // ! ==> get and create successfully UserFavoriteInfo
  //

  UserJeanpointsResponse userJeanpointBonsRes =
      await globalLocator<GlobalRestClient>().getUserJeanpointBonsInfo();
  // ignore: deprecated_member_use
  userJeanpointBons = new List<Coupon>();
  userJeanpointBonsRes.data.forEach((element) {
    userJeanpointBons.add(
      Coupon(
        code: element.code,
        engName: element.engName,
        perName: element.perName,
        description: element.description,
        price: element.price,
        minShopping: element.minShopping,
        startDate: element.startDate,
        endDate: element.endDate,
      ),
    );
  });
  print(
      '_=_ get successfully userJeanpointBons length: ${userJeanpointBons.length}');
  print('_=_  first userJeanpointBons code: ${userJeanpointBons[0].code}');
  // ! ==> get and create successfully UserFavoriteInfo
  //
  // List<String>

  ContactUsRes contactUsRes =
      await globalLocator<GlobalRestClient>().getContactUsInfo();
  contactUsInfo = contactUsRes.data;

  print('_=_ get successfully contactUsInfo phone: ${contactUsInfo.phone}');
  // ! ==> get and create successfully UserFavoriteInfo

  FAQRes faqRes = await globalLocator<GlobalRestClient>().getFAQInfo();
  faqData = faqRes.data;

  print('_=_ get successfully contactUsInfo phone: ${contactUsInfo.phone}');
  // ! ==> get and create successfully UserFavoriteInfo
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
          : null;
  List<String> date = userAccount.birthDate.split("-");
  Gregorian gregorian =
      new Gregorian(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]));
  Jalali jalali = gregorian.toJalali();

  return UserMainInfo(
    firstName: userAccount.firstName,
    lastName: userAccount.lastName,
    email: userAccount.email,
    gender: gender,
    phoneNumber: userAccount.phoneNumber,
    yearOfBirth: jalali.year.toString(),
    monthOfBirth: jalali.month.toString(),
    dayOfBirth: jalali.day.toString(),
  );
}

UserFriendsInfo createUserFriends(UserFriendsInfoRes userFriendsInfoRes) {
  // ignore: deprecated_member_use
  List<UserMainInfo> friends = new List<UserMainInfo>();
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

  return UserFriendsInfo(friends: friends);
}

List<Address> createUserAddresses(UserAddressesInfoRes userAddressesInfoRes) {
  List<AddressInfoRes> userAddressesInfo = userAddressesInfoRes.addresses;
  // ignore: deprecated_member_use
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
