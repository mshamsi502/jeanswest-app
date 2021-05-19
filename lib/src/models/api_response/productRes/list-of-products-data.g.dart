// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list-of-products-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfProductsData _$ListOfProductsDataFromJson(Map<String, dynamic> json) {
  return ListOfProductsData(
    result: (json['result'] as List)
        ?.map((e) => e == null
            ? null
            : SingleProductInfoRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    page: json['page'] as int,
    perPage: json['perPage'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$ListOfProductsDataToJson(ListOfProductsData instance) =>
    <String, dynamic>{
      'result': instance.result,
      'page': instance.page,
      'perPage': instance.perPage,
      'total': instance.total,
    };
