// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data-ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataTicket _$DataTicketFromJson(Map<String, dynamic> json) {
  return DataTicket(
    ticketCode: json['ticketCode'] as String,
    title: json['title'] as String,
    context: (json['context'] as List)
        ?.map((e) =>
            e == null ? null : SingleTicket.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$DataTicketToJson(DataTicket instance) =>
    <String, dynamic>{
      'ticketCode': instance.ticketCode,
      'title': instance.title,
      'context': instance.context,
      'status': instance.status,
    };
