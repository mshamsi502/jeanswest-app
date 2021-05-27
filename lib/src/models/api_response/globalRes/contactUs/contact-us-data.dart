// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact-us-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ContactUsData extends Equatable {
  @JsonKey(name: 'addresses')
  String addresses;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'fax')
  String fax;

  ContactUsData({
    this.addresses,
    this.phone,
    this.fax,
  });

  factory ContactUsData.fromJson(Map<String, dynamic> json) =>
      _$ContactUsDataFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$ContactUsDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addresses': addresses,
      'phone': phone,
      'fax': fax,
    };
  }

  @override
  List<Object> get props => [
        addresses,
        phone,
        fax,
      ];
}
