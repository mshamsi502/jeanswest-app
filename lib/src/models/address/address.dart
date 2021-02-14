// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// ignore: must_be_immutable

import 'package:jeanswest/src/models/dateTimeOnData/date-time-on-data.dart';

class Address {
  final int id;
  final String title;
//
  final String recieverFirstName;
  final String recieverLastName;
  final String recieverMobile;
  //
  final String country;
  final String province;
  final String city;
  final String district;
  final String address;
  final String houseNumber;
  final String unitNumber;
  final String postalCode;
  final double longtitude;
  final double latitude;
  //
  final bool active;
  final bool isUser;
  final int personId;
//
  final DateTimeOnData datetime;

  Address({
    this.id,
    this.title,
    this.recieverFirstName,
    this.recieverLastName,
    this.recieverMobile,
    this.country,
    this.province,
    this.city,
    this.district,
    this.address,
    this.houseNumber,
    this.unitNumber,
    this.postalCode,
    this.longtitude,
    this.latitude,
    this.active,
    this.isUser,
    this.personId,
    this.datetime,
  });
}
