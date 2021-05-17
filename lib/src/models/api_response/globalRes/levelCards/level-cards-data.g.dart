// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level-cards-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelCardsData _$LevelCardsDataFromJson(Map<String, dynamic> json) {
  return LevelCardsData(
    bluePlusCardInfo: json['bluePlusCardInfo'] == null
        ? null
        : SingleLevelCard.fromJson(
            json['bluePlusCardInfo'] as Map<String, dynamic>),
    blue2PlusCardInfo: json['blue2PlusCardInfo'] == null
        ? null
        : SingleLevelCard.fromJson(
            json['blue2PlusCardInfo'] as Map<String, dynamic>),
    silverCardInfo: json['silverCardInfo'] == null
        ? null
        : SingleLevelCard.fromJson(
            json['silverCardInfo'] as Map<String, dynamic>),
    goldCardInfo: json['goldCardInfo'] == null
        ? null
        : SingleLevelCard.fromJson(
            json['goldCardInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LevelCardsDataToJson(LevelCardsData instance) =>
    <String, dynamic>{
      'bluePlusCardInfo': instance.bluePlusCardInfo,
      'blue2PlusCardInfo': instance.blue2PlusCardInfo,
      'silverCardInfo': instance.silverCardInfo,
      'goldCardInfo': instance.goldCardInfo,
    };
