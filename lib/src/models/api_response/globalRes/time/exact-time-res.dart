// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exact-time-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ExactTimeRes extends Equatable {
  @JsonKey(name: 'yearOfDate')
  String yearOfDate;
  @JsonKey(name: 'mouthOfDate')
  String mouthOfDate;
  @JsonKey(name: 'dayOfDate')
  String dayOfDate;
  @JsonKey(name: 'hourOfDate')
  String hourOfDate;
  @JsonKey(name: 'minuteOfDate')
  String minuteOfDate;
  @JsonKey(name: 'perExplain')
  String perExplain;

  ExactTimeRes({
    this.yearOfDate,
    this.mouthOfDate,
    this.dayOfDate,
    this.hourOfDate,
    this.minuteOfDate,
    this.perExplain,
  });

  factory ExactTimeRes.fromJson(Map<String, dynamic> json) =>
      _$ExactTimeResFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$ExactTimeResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'yearOfDate': yearOfDate,
      'mouthOfDate': mouthOfDate,
      'dayOfDate': dayOfDate,
      'hourOfDate': hourOfDate,
      'minuteOfDate': minuteOfDate,
      'perExplain': perExplain,
    };
  }

  @override
  List<Object> get props => [
        yearOfDate,
        mouthOfDate,
        dayOfDate,
        hourOfDate,
        minuteOfDate,
        perExplain,
      ];
}
