// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exact-time-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExactTimeRes _$ExactTimeResFromJson(Map<String, dynamic> json) {
  return ExactTimeRes(
    yearOfDate: json['yearOfDate'] as String,
    mouthOfDate: json['mouthOfDate'] as String,
    dayOfDate: json['dayOfDate'] as String,
    hourOfDate: json['hourOfDate'] as String,
    minuteOfDate: json['minuteOfDate'] as String,
    perExplain: json['perExplain'] as String,
  );
}

Map<String, dynamic> _$ExactTimeResToJson(ExactTimeRes instance) =>
    <String, dynamic>{
      'yearOfDate': instance.yearOfDate,
      'mouthOfDate': instance.mouthOfDate,
      'dayOfDate': instance.dayOfDate,
      'hourOfDate': instance.hourOfDate,
      'minuteOfDate': instance.minuteOfDate,
      'perExplain': instance.perExplain,
    };
