import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/province/province.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/city/city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/district/district.dart';

// List<Address> userAddresses = [
List<AddressInfoRes> userAddresses = [
  AddressInfoRes(
    code: "",
    title: "",
    recieverFullName: "",
    receiverMobile: "",
    country: "",
    province: Province(name: ''),
    city: City(name: ''),
    district: District(name: ''),
    address: "",
    houseNumber: "",
    unitNumber: "",
    postalCode: "",
    latitude: 35.7447,
    longitude: 51.3340,
    active: true,
    isUser: true,
  ),
];

// int selectedAddress = 0;
//

List<String> provinces = [
  "تهران",
  "شیراز",
  "اصفهان",
];
List<String> tehranCities = [
  "تهران",
  "ورامین",
  "رباط کریم",
  "شهر ری",
];
List<String> shirazCities = [
  "شیراز",
  "جهرم",
  "لار",
  "اوز",
];
List<String> esfahanCities = [
  "اصفهان",
  "نجف آباد",
  "شاهین شهر",
  "کاشان",
];
Map<String, List<String>> provinceCities = {
  provinces[0]: tehranCities,
  provinces[1]: shirazCities,
  provinces[2]: esfahanCities,
};
