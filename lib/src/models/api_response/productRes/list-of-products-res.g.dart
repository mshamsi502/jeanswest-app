// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list-of-products-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfProductsRes _$ListOfProductsResFromJson(Map<String, dynamic> json) {
  return ListOfProductsRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : ListOfProductsData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListOfProductsResToJson(ListOfProductsRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
