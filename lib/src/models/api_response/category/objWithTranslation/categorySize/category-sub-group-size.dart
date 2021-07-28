// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/category-translation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category-sub-group-size.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class CategorySubGroupSizeRes extends Equatable {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  List<String> value;
  @JsonKey(name: 'active')
  bool active;
  @JsonKey(name: 'subGroup')
  String subGroup;
  @JsonKey(name: 'priority')
  int priority;
  @JsonKey(name: 'translation')
  List<CategoryTranslationRes> translation;

  CategorySubGroupSizeRes({
    this.name,
    this.value,
    this.active,
    this.subGroup,
    this.priority,
    this.translation,
  });

  factory CategorySubGroupSizeRes.fromJson(Map<String, dynamic> json) =>
      _$CategorySubGroupSizeResFromJson(json);

  Map<String, dynamic> toJson() => _$CategorySubGroupSizeResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'active': active,
      'name': name,
      'value': value,
      'active': active,
      'subGroup': subGroup,
      'priority': priority,
      'translation': translation,
    };
  }

  @override
  List<Object> get props => [
        name,
        value,
        active,
        subGroup,
        priority,
        translation,
      ];
}
