// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/globalRes/time/c-u-d-at-time-res.dart';

part 'address-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class AddressInfoRes extends Equatable {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'recieverFirstName')
  String recieverFirstName;
  @JsonKey(name: 'recieverLastName')
  String recieverLastName;
  @JsonKey(name: 'recieverMobile')
  String recieverMobile;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'province')
  String province;
  @JsonKey(name: 'city')
  String city;
  @JsonKey(name: 'district')
  String district;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'houseNumber')
  String houseNumber;
  @JsonKey(name: 'unitNumber')
  String unitNumber;
  @JsonKey(name: 'postalCode')
  String postalCode;
  @JsonKey(name: 'latitude')
  double latitude;
  @JsonKey(name: 'longtitude')
  double longtitude;
  @JsonKey(name: 'active')
  bool active;
  @JsonKey(name: 'isUser')
  bool isUser;
  @JsonKey(name: 'personId')
  int personId;
  @JsonKey(name: 'dateTime')
  CUDAtTimeRes dateTime;

  AddressInfoRes({
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
    this.latitude,
    this.longtitude,
    this.active,
    this.isUser,
    this.personId,
    this.dateTime,
  });

  factory AddressInfoRes.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$AddressInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'recieverFirstName': recieverFirstName,
      'recieverLastName': recieverLastName,
      'recieverMobile': recieverMobile,
      'country': country,
      'province': province,
      'city': city,
      'district': district,
      'address': address,
      'houseNumber': houseNumber,
      'unitNumber': unitNumber,
      'postalCode': postalCode,
      'latitude': latitude,
      'longtitude': longtitude,
      'active': active,
      'isUser': isUser,
      'personId': personId,
      'dateTime': dateTime,
    };
  }

  @override
  List<Object> get props => [
        id,
        title,
        recieverFirstName,
        recieverLastName,
        recieverMobile,
        country,
        province,
        city,
        district,
        address,
        houseNumber,
        unitNumber,
        postalCode,
        latitude,
        longtitude,
        active,
        isUser,
        personId,
        dateTime,
      ];
}
