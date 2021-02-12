// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'global-response-jdata.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class GlobalResponseJData extends Equatable {
  @JsonKey(name: 'data')
  String data;

  GlobalResponseJData({
    this.data,
  });

  factory GlobalResponseJData.fromJson(Map<String, dynamic> json) =>
      _$GlobalResponseJDataFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalResponseJDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  @override
  List<Object> get props => [
        data,
      ];
}
