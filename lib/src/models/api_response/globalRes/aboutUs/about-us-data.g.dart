// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about-us-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsData _$AboutUsDataFromJson(Map<String, dynamic> json) {
  return AboutUsData(
    banner: json['banner'] == null
        ? null
        : CardAboutUsData.fromJson(json['banner'] as Map<String, dynamic>),
    cards: (json['cards'] as List)
        ?.map((e) => e == null
            ? null
            : CardAboutUsData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AboutUsDataToJson(AboutUsData instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'cards': instance.cards,
    };
