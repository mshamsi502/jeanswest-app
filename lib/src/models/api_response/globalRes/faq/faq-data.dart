// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faq-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class FAQData extends Equatable {
  @JsonKey(name: 'question')
  String question;
  @JsonKey(name: 'answer')
  String answer;

  FAQData({
    this.question,
    this.answer,
  });

  factory FAQData.fromJson(Map<String, dynamic> json) =>
      _$FAQDataFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$FAQDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
    };
  }

  @override
  List<Object> get props => [
        question,
        answer,
      ];
}
