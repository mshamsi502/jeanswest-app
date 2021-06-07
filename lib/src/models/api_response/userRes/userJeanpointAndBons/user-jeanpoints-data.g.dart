// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-jeanpoints-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJeanpointsData _$UserJeanpointsDataFromJson(Map<String, dynamic> json) {
  return UserJeanpointsData(
    code: json['code'] as String,
    startDate: json['startDate'] as String,
    expirationDate: json['expirationDate'] as String,
    price: json['price'] as int,
    promotionPoint: json['promotionPoint'] == null
        ? null
        : PromotionPointData.fromJson(
            json['promotionPoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserJeanpointsDataToJson(UserJeanpointsData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'startDate': instance.startDate,
      'expirationDate': instance.expirationDate,
      'price': instance.price,
      'promotionPoint': instance.promotionPoint,
    };
