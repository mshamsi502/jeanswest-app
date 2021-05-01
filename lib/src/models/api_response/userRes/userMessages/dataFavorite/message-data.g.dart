// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageData _$MessageDataFromJson(Map<String, dynamic> json) {
  return MessageData(
    code: json['code'] as int,
    engTitle: json['engTitle'] as String,
    perTitle: json['perTitle'] as String,
    engSender: json['engSender'] as String,
    perSender: json['perSender'] as String,
    pictureAssets: json['pictureAssets'] as String,
    text: json['text'] as String,
    description:
        (json['description'] as List)?.map((e) => e as String)?.toList(),
    price: json['price'] as int,
    minShopping: json['minShopping'] as int,
    engCategory:
        (json['engCategory'] as List)?.map((e) => e as String)?.toList(),
    perCategory:
        (json['perCategory'] as List)?.map((e) => e as String)?.toList(),
    startDate: json['startDate'] as String,
    endDate: json['endDate'] as String,
    sendDate: json['sendDate'] as String,
  );
}

Map<String, dynamic> _$MessageDataToJson(MessageData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'engTitle': instance.engTitle,
      'perTitle': instance.perTitle,
      'engSender': instance.engSender,
      'perSender': instance.perSender,
      'pictureAssets': instance.pictureAssets,
      'text': instance.text,
      'description': instance.description,
      'price': instance.price,
      'minShopping': instance.minShopping,
      'perCategory': instance.perCategory,
      'engCategory': instance.engCategory,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'sendDate': instance.sendDate,
    };
