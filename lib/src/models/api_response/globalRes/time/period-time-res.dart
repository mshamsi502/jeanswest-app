// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'period-time-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class PeriodTimeRes extends Equatable {
  @JsonKey(name: 'yearOfDate')
  String yearOfDate;
  @JsonKey(name: 'mouthOfDate')
  String mouthOfDate;
  @JsonKey(name: 'dayOfDate')
  String dayOfDate;
  @JsonKey(name: 'startHourOfDate')
  String startHourOfDate;
  @JsonKey(name: 'endHourOfDate')
  String endHourOfDate;
  @JsonKey(name: 'perExplain')
  String perExplain;

  PeriodTimeRes({
    this.yearOfDate,
    this.mouthOfDate,
    this.dayOfDate,
    this.startHourOfDate,
    this.endHourOfDate,
    this.perExplain,
  });

  factory PeriodTimeRes.fromJson(Map<String, dynamic> json) =>
      _$PeriodTimeResFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$PeriodTimeResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'yearOfDate': yearOfDate,
      'mouthOfDate': mouthOfDate,
      'dayOfDate': dayOfDate,
      'startHourOfDate': startHourOfDate,
      'endHourOfDate': endHourOfDate,
      'perExplain': perExplain,
    };
  }

  @override
  List<Object> get props => [
        yearOfDate,
        mouthOfDate,
        dayOfDate,
        startHourOfDate,
        endHourOfDate,
        perExplain,
      ];
}
