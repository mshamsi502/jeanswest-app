// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banimode-features-product-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class BanimodeFeaturesProductRes extends Equatable {
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'value')
  String value;

  BanimodeFeaturesProductRes({
    this.title,
    this.value,
  });

  factory BanimodeFeaturesProductRes.fromJson(Map<String, dynamic> json) =>
      _$BanimodeFeaturesProductResFromJson(json);

  Map<String, dynamic> toJson() => _$BanimodeFeaturesProductResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'value': value,
    };
  }

  @override
  List<Object> get props => [
        title,
        value,
      ];
}
