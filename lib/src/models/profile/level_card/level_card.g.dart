// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelCard _$LevelCardFromJson(Map<String, dynamic> json) {
  return LevelCard(
    membership: json['Membership'] as String,
    title: json['Title'] as String,
    perTitle: json['PerTitle'] as String,
    minPay: json['MinPay'] as String,
    maxPay: json['MaxPay'] as String,
    percent: json['Percent'] as int,
    receiptConditions: json['ReceiptConditions'] as String,
    subtitles: (json['Subtitles'] as List)?.map((e) => e as String)?.toList(),
    descriptions:
        (json['descriptions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LevelCardToJson(LevelCard instance) => <String, dynamic>{
      'Membership': instance.membership,
      'Title': instance.title,
      'PerTitle': instance.perTitle,
      'MinPay': instance.minPay,
      'MaxPay': instance.maxPay,
      'Percent': instance.percent,
      'ReceiptConditions': instance.receiptConditions,
      'Subtitles': instance.subtitles,
      'descriptions': instance.descriptions,
    };
