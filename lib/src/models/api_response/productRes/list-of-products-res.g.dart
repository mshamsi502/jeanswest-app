// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list-of-products-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfProductsRes _$ListOfProductsResFromJson(Map<String, dynamic> json) {
  return ListOfProductsRes(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SingleProductInfoRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListOfProductsResToJson(ListOfProductsRes instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
