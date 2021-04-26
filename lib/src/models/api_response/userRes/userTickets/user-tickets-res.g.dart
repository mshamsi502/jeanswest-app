// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-tickets-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTicketsRes _$UserTicketsResFromJson(Map<String, dynamic> json) {
  return UserTicketsRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DataTicket.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserTicketsResToJson(UserTicketsRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
