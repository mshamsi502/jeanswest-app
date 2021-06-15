// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list-of-category.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ListOfCategory extends Equatable {
  @JsonKey(name: 'group')
  List<String> group;
  @JsonKey(name: 'subGroup') // !
  Map<String, List<String>> subGroup;
  @JsonKey(name: 'size') // !
  Map<String, List<String>> size;
  @JsonKey(name: 'gender')
  List<String> gender;
  @JsonKey(name: 'ageGroup')
  List<String> ageGroup;
  @JsonKey(name: 'colorFamily')
  List<String> colorFamily;

  ListOfCategory({
    this.group,
    this.subGroup,
    this.size,
    this.gender,
    this.ageGroup,
    this.colorFamily,
  });

  factory ListOfCategory.fromJson(Map<String, dynamic> json) =>
      _$ListOfCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfCategoryToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'active': active,
      'group': group,
      'subGroup': subGroup,
      'size': size,
      'gender': gender,
      'ageGroup': ageGroup,
      'colorFamily': colorFamily,
    };
  }

  @override
  List<Object> get props => [
        group,
        subGroup,
        size,
        gender,
        ageGroup,
        colorFamily,
      ];
}
