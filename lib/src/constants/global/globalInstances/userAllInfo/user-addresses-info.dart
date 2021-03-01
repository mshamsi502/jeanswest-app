import 'package:jeanswest/src/models/dateTimeOnData/date-time-on-data.dart';
import 'package:jeanswest/src/models/address/address.dart';

List<Address> userAddresses = [
  Address(
    id: 0,
    title: "",
    recieverFirstName: "",
    recieverLastName: "",
    recieverMobile: "",
    country: "",
    province: "",
    city: "",
    district: "",
    address: "",
    houseNumber: "",
    unitNumber: "",
    postalCode: "",
    latitude: 35.7447,
    longtitude: 51.3340,
    active: true,
    isUser: true,
    personId: 2517,
    datetime: DateTimeOnData(
      createdAt: "2021-02-02T11:16:43.531Z",
      updatedAt: "2021-02-02T11:16:43.531Z",
      deletedAt: "2021-02-02T11:16:43.531Z",
    ),
  ),
];

int selectedAddress = 0;
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
