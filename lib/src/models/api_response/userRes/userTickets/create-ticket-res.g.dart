// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create-ticket-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTicketRes _$CreateTicketResFromJson(Map<String, dynamic> json) {
  return CreateTicketRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : DataTicket.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateTicketResToJson(CreateTicketRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
