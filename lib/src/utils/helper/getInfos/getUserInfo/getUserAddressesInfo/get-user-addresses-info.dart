//

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/general_response.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/user-addresses-info-res.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<void> userAddressesInfo() async {
  // userAddresses

  UserAddressesInfoRes addRes = await globalLocator<GlobalRestClient>()
      .getUserAddressesInfo(); // ! from real API
  // !
  // await globalLocator<GlobalRestClient>()
  //     .getMockUserAddressesInfo(); // ! from Mockoon
  // !
  if (addRes.statusCode == 200) {
    userAddresses = addRes.data;
  } else {
    print(addRes.message);
  }

  print('***************************************************************');
  print('_=_ get successfully, userAddresses length: ${userAddresses.length}');
  print(
      '_=_ get successfully, userAddresses first: ${userAddresses[0].address}');
}

Future<bool> addToUserAddressesInfo(AddressInfoRes userAdress) async {
  // userAddresses

  Map<String, dynamic> address = {
    "receiverFirstName": userAdress.receiverFirstName,
    "receiverLastName": userAdress.receiverLastName,
    "receiverMobile": userAdress.receiverMobile,
    "country": userAdress.country,
    // "province": {"name": userAdress.province.name},
    // "city": {"name": userAdress.city.name},
    // "district": {"name": userAdress.district.name},
    "province": userAdress.province,
    "city": userAdress.city,
    "district": userAdress.district,
    //
    "address": userAdress.address,
    "houseNumber": userAdress.houseNumber,
    "unitNumber": userAdress.unitNumber,
    "postalCode": userAdress.postalCode,
    "latitude": userAdress.latitude,
    "longitude": userAdress.longitude,
    "isUser": userAdress.isUser,
    "title": userAdress.title
  };
  try {
    GeneralRespons gRes = await globalLocator<GlobalRestClient>()
        .addToUserAddressesInfo(address); // ! from real API
    // !
    // await globalLocator<GlobalRestClient>()
    //     .getMockUserAddressesInfo(); // ! from Mockoon
    // !
    if (gRes.statusCode == 200) {
      userAddressesInfo();
      print('***************************************************************');
      print(
          '_=_ add successfully, userAddresses length: ${userAddresses.length}');
      return true;
    } else {
      print(gRes.message);
      return false;
    }
  } catch (e) {
    printErrorMessage(e);
    return false;
  }
}
