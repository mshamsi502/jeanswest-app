// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'return-policy-description.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ReturnPolicyDescription extends Equatable {
  @JsonKey(name: 'header')
  String header;
  @JsonKey(name: 'picture')
  String picture;
  @JsonKey(name: 'phoneNumber')
  String phoneNumber;
  @JsonKey(name: 'terms')
  List<String> terms;

  ReturnPolicyDescription({
    this.header,
    this.picture,
    this.phoneNumber,
    this.terms,
  });

  factory ReturnPolicyDescription.fromJson(Map<String, dynamic> json) =>
      _$ReturnPolicyDescriptionFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$ReturnPolicyDescriptionToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header,
      'picture': picture,
      'phoneNumber': phoneNumber,
      'terms': terms,
    };
  }

  @override
  List<Object> get props => [
        header,
        picture,
        phoneNumber,
        terms,
      ];
}
