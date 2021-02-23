// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add-to-card-product-detail-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCardProductDetailRes _$AddToCardProductDetailResFromJson(
    Map<String, dynamic> json) {
  return AddToCardProductDetailRes(
    sizeGuid: (json['sizeGuid'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
    allColorsBanimodeDetails: (json['allColor'] as List)
        ?.map((e) => e == null
            ? null
            : BanimodeDetailsProductRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AddToCardProductDetailResToJson(
        AddToCardProductDetailRes instance) =>
    <String, dynamic>{
      'sizeGuid': instance.sizeGuid,
      'allColor': instance.allColorsBanimodeDetails,
    };
