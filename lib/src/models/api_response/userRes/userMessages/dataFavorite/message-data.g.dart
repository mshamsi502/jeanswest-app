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
  )
    ..startGeoYear = json['startGeoYear'] as String
    ..startGeoMonth = json['startGeoMonth'] as String
    ..startGeoDay = json['startGeoDay'] as String
    ..startShamsiDate = (json['startShamsiDate'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    )
    ..startShamsiYear = json['startShamsiYear'] as String
    ..startShamsiMonth = json['startShamsiMonth'] as String
    ..startShamsiDay = json['startShamsiDay'] as String
    ..endGeoYear = json['endGeoYear'] as String
    ..endGeoMonth = json['endGeoMonth'] as String
    ..endGeoDay = json['endGeoDay'] as String
    ..endShamsiDate = (json['endShamsiDate'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    )
    ..endShamsiYear = json['endShamsiYear'] as String
    ..endShamsiMonth = json['endShamsiMonth'] as String
    ..endShamsiDay = json['endShamsiDay'] as String
    ..sendGeoYear = json['sendGeoYear'] as String
    ..sendGeoMonth = json['sendGeoMonth'] as String
    ..sendGeoDay = json['sendGeoDay'] as String
    ..sendShamsiDate = (json['sendShamsiDate'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    )
    ..sendShamsiYear = json['sendShamsiYear'] as String
    ..sendShamsiMonth = json['sendShamsiMonth'] as String
    ..sendShamsiDay = json['sendShamsiDay'] as String
    ..sendHour = json['sendHour'] as String
    ..sendMinute = json['sendMinute'] as String
    ..sendSecond = json['sendSecond'] as String
    ..isReaded = json['isReaded'] as bool;
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
      'startGeoYear': instance.startGeoYear,
      'startGeoMonth': instance.startGeoMonth,
      'startGeoDay': instance.startGeoDay,
      'startShamsiDate': instance.startShamsiDate,
      'startShamsiYear': instance.startShamsiYear,
      'startShamsiMonth': instance.startShamsiMonth,
      'startShamsiDay': instance.startShamsiDay,
      'endDate': instance.endDate,
      'endGeoYear': instance.endGeoYear,
      'endGeoMonth': instance.endGeoMonth,
      'endGeoDay': instance.endGeoDay,
      'endShamsiDate': instance.endShamsiDate,
      'endShamsiYear': instance.endShamsiYear,
      'endShamsiMonth': instance.endShamsiMonth,
      'endShamsiDay': instance.endShamsiDay,
      'sendDate': instance.sendDate,
      'sendGeoYear': instance.sendGeoYear,
      'sendGeoMonth': instance.sendGeoMonth,
      'sendGeoDay': instance.sendGeoDay,
      'sendShamsiDate': instance.sendShamsiDate,
      'sendShamsiYear': instance.sendShamsiYear,
      'sendShamsiMonth': instance.sendShamsiMonth,
      'sendShamsiDay': instance.sendShamsiDay,
      'sendHour': instance.sendHour,
      'sendMinute': instance.sendMinute,
      'sendSecond': instance.sendSecond,
      'isReaded': instance.isReaded,
    };
