// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period-time-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodTimeRes _$PeriodTimeResFromJson(Map<String, dynamic> json) {
  return PeriodTimeRes(
    yearOfDate: json['yearOfDate'] as String,
    mouthOfDate: json['mouthOfDate'] as String,
    dayOfDate: json['dayOfDate'] as String,
    startHourOfDate: json['startHourOfDate'] as String,
    endHourOfDate: json['endHourOfDate'] as String,
    perExplain: json['perExplain'] as String,
  );
}

Map<String, dynamic> _$PeriodTimeResToJson(PeriodTimeRes instance) =>
    <String, dynamic>{
      'yearOfDate': instance.yearOfDate,
      'mouthOfDate': instance.mouthOfDate,
      'dayOfDate': instance.dayOfDate,
      'startHourOfDate': instance.startHourOfDate,
      'endHourOfDate': instance.endHourOfDate,
      'perExplain': instance.perExplain,
    };
