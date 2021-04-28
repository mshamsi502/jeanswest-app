// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single-ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleTicket _$SingleTicketFromJson(Map<String, dynamic> json) {
  return SingleTicket(
    owner: json['owner'] as String,
    text: json['text'] as String,
    createdAt: json['created_at'] as String,
  );
}

Map<String, dynamic> _$SingleTicketToJson(SingleTicket instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'text': instance.text,
      'created_at': instance.createdAt,
    };
