// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/globalRes/time/c-u-d-at-time-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-message-result.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserMessageResult extends Equatable {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'active')
  bool active;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'body')
  String body;
  @JsonKey(name: 'image')
  String image;
  @JsonKey(name: 'version')
  int version;
  @JsonKey(name: 'datetime')
  CUDAtTimeRes datetime;

  UserMessageResult({
    this.id,
    this.active,
    this.title,
    this.body,
    this.image,
    this.version,
    this.datetime,
  });

  factory UserMessageResult.fromJson(Map<String, dynamic> json) =>
      _$UserMessageResultFromJson(json);

  Map<String, dynamic> toJson() => _$UserMessageResultToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'active': active,
      'title': title,
      'body': body,
      'image': image,
      'version': version,
      'datetime': datetime,
    };
  }

  @override
  List<Object> get props => [
        id,
        active,
        title,
        body,
        image,
        version,
        datetime,
      ];
}
