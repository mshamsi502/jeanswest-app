// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressInfoRes _$AddressInfoResFromJson(Map<String, dynamic> json) {
  return AddressInfoRes(
    id: json['id'] as int,
    title: json['title'] as String,
    recieverFirstName: json['recieverFirstName'] as String,
    recieverLastName: json['recieverLastName'] as String,
    recieverMobile: json['recieverMobile'] as String,
    country: json['country'] as String,
    province: json['province'] as String,
    city: json['city'] as String,
    district: json['district'] as String,
    address: json['address'] as String,
    houseNumber: json['houseNumber'] as String,
    unitNumber: json['unitNumber'] as String,
    postalCode: json['postalCode'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longtitude: (json['longtitude'] as num)?.toDouble(),
    active: json['active'] as bool,
    isUser: json['isUser'] as bool,
    personId: json['personId'] as int,
    dateTime: json['dateTime'] == null
        ? null
        : DateTimeRes.fromJson(json['dateTime'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddressInfoResToJson(AddressInfoRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'recieverFirstName': instance.recieverFirstName,
      'recieverLastName': instance.recieverLastName,
      'recieverMobile': instance.recieverMobile,
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'address': instance.address,
      'houseNumber': instance.houseNumber,
      'unitNumber': instance.unitNumber,
      'postalCode': instance.postalCode,
      'latitude': instance.latitude,
      'longtitude': instance.longtitude,
      'active': instance.active,
      'isUser': instance.isUser,
      'personId': instance.personId,
      'dateTime': instance.dateTime,
    };
