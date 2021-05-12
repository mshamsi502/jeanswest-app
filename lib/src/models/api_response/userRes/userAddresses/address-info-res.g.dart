// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressInfoRes _$AddressInfoResFromJson(Map<String, dynamic> json) {
  return AddressInfoRes(
    code: json['code'] as String,
    title: json['title'] as String,
    recieverFullName: json['recieverFullName'] as String,
    receiverMobile: json['receiverMobile'] as String,
    country: json['country'] as String,
    province: json['province'] == null
        ? null
        : Province.fromJson(json['province'] as Map<String, dynamic>),
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    district: json['district'] == null
        ? null
        : District.fromJson(json['district'] as Map<String, dynamic>),
    address: json['address'] as String,
    houseNumber: json['houseNumber'] as String,
    unitNumber: json['unitNumber'] as String,
    postalCode: json['postalCode'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    active: json['active'] as bool,
    isUser: json['isUser'] as bool,
  );
}

Map<String, dynamic> _$AddressInfoResToJson(AddressInfoRes instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'recieverFullName': instance.recieverFullName,
      'receiverMobile': instance.receiverMobile,
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'address': instance.address,
      'houseNumber': instance.houseNumber,
      'unitNumber': instance.unitNumber,
      'postalCode': instance.postalCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'active': instance.active,
      'isUser': instance.isUser,
    };
