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
    receiptConditions: json['ReceiptConditions'] as String,
    subTitleOne: json['SubTitleOne'] as String,
    descriptionOne: json['DescriptionOne'] as String,
    subTitleTwo: json['SubTitleTwo'] as String,
    descriptionTwo: json['DescriptionTwo'] as String,
    subTitleThree: json['SubTitleThree'] as String,
    descriptionThree: json['DescriptionThree'] as String,
    subTitleFour: json['SubTitleFour'] as String,
    descriptionFour: json['DescriptionFour'] as String,
  );
}

Map<String, dynamic> _$LevelCardToJson(LevelCard instance) => <String, dynamic>{
      'Membership': instance.membership,
      'Title': instance.title,
      'PerTitle': instance.perTitle,
      'MinPay': instance.minPay,
      'MaxPay': instance.maxPay,
      'ReceiptConditions': instance.receiptConditions,
      'SubTitleOne': instance.subTitleOne,
      'DescriptionOne': instance.descriptionOne,
      'SubTitleTwo': instance.subTitleTwo,
      'DescriptionTwo': instance.descriptionTwo,
      'SubTitleThree': instance.subTitleThree,
      'DescriptionThree': instance.descriptionThree,
      'SubTitleFour': instance.subTitleFour,
      'DescriptionFour': instance.descriptionFour,
    };
