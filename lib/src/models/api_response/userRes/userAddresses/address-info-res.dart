// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/city/city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/district/district.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/province/province.dart';

part 'address-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class AddressInfoRes extends Equatable {
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'recieverFullName')
  String recieverFullName;
  // @JsonKey(name: 'receiverLastName')
  // String receiverLastName;
  @JsonKey(name: 'receiverMobile')
  String receiverMobile;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'province')
  Province province;
  @JsonKey(name: 'city')
  City city;
  @JsonKey(name: 'district')
  District district;
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
  @JsonKey(name: 'longitude')
  double longitude;
  @JsonKey(name: 'active')
  bool active;
  @JsonKey(name: 'isUser')
  bool isUser;

  AddressInfoRes({
    this.code,
    this.title,
    this.recieverFullName,
    // this.receiverLastName,
    this.receiverMobile,
    this.country,
    this.province,
    this.city,
    this.district,
    this.address,
    this.houseNumber,
    this.unitNumber,
    this.postalCode,
    this.latitude,
    this.longitude,
    this.active,
    this.isUser,
  });

  factory AddressInfoRes.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$AddressInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'title': title,
      'recieverFullName': recieverFullName,
      // 'receiverLastName': receiverLastName,
      'receiverMobile': receiverMobile,
      'country': country,
      'province': province,
      'city': city,
      'district': district,
      'address': address,
      'houseNumber': houseNumber,
      'unitNumber': unitNumber,
      'postalCode': postalCode,
      'latitude': latitude,
      'longitude': longitude,
      'active': active,
      'isUser': isUser,
    };
  }

  @override
  List<Object> get props => [
        code,
        title,
        recieverFullName,
        // receiverLastName,
        receiverMobile,
        country,
        province,
        city,
        district,
        address,
        houseNumber,
        unitNumber,
        postalCode,
        latitude,
        longitude,
        active,
        isUser,
      ];
}
