// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data-favorites-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataFavoriteInfoRes _$DataFavoriteInfoResFromJson(Map<String, dynamic> json) {
  return DataFavoriteInfoRes(
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

Map<String, dynamic> _$DataFavoriteInfoResToJson(
        DataFavoriteInfoRes instance) =>
    <String, dynamic>{
      'result': instance.result,
      'page': instance.page,
      'perPage': instance.perPage,
      'total': instance.total,
    };
