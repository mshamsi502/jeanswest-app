// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single-level-card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleLevelCard _$SingleLevelCardFromJson(Map<String, dynamic> json) {
  return SingleLevelCard(
    id: json['id'] as String,
    active: json['active'] as bool,
    title: json['title'] as String,
    engTitle: json['engtitle'] as String,
    perTitle: json['perTitle'] as String,
    image: json['image'] as String,
    membership: json['membership'] as String,
    minPay: json['minPay'] as int,
    maxPay: json['maxPay'] as int,
    text: json['text'] as String,
    percent: json['percent'] as int,
    receiptConditions: json['receiptConditions'] as String,
    subTitles: (json['subTitles'] as List)?.map((e) => e as String)?.toList(),
    descriptions:
        (json['descriptions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SingleLevelCardToJson(SingleLevelCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'title': instance.title,
      'engtitle': instance.engTitle,
      'perTitle': instance.perTitle,
      'image': instance.image,
      'membership': instance.membership,
      'minPay': instance.minPay,
      'maxPay': instance.maxPay,
      'text': instance.text,
      'percent': instance.percent,
      'receiptConditions': instance.receiptConditions,
      'subTitles': instance.subTitles,
      'descriptions': instance.descriptions,
    };
