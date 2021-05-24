// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single-level-card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleLevelCard _$SingleLevelCardFromJson(Map<String, dynamic> json) {
  return SingleLevelCard(
    membership: json['membership'] as String,
    engtitle: json['engtitle'] as String,
    perTitle: json['perTitle'] as String,
    minPay: json['minPay'] as int,
    maxPay: json['maxPay'] as int,
    receiptConditions: json['receiptConditions'] as String,
    subTitles: (json['subTitles'] as List)?.map((e) => e as String)?.toList(),
    descriptions:
        (json['descriptions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SingleLevelCardToJson(SingleLevelCard instance) =>
    <String, dynamic>{
      'membership': instance.membership,
      'engtitle': instance.engtitle,
      'perTitle': instance.perTitle,
      'minPay': instance.minPay,
      'maxPay': instance.maxPay,
      'receiptConditions': instance.receiptConditions,
      'subTitles': instance.subTitles,
      'descriptions': instance.descriptions,
    };
