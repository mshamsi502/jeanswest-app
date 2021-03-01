// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'erp-detail-product-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ErpDetailsProductRes extends Equatable {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'size')
  String size;
  @JsonKey(name: 'brand')
  String brand;
  @JsonKey(name: 'color')
  String color;
  @JsonKey(name: 'group')
  String group;
  @JsonKey(name: 'gender')
  String gender;
  @JsonKey(name: 'nameFA')
  String nameFA;
  @JsonKey(name: 'cutting')
  String cutting;
  @JsonKey(name: 'styleFA')
  String styleFA;
  @JsonKey(name: 'ageGroup')
  String ageGroup;
  @JsonKey(name: 'category')
  String category;
  @JsonKey(name: 'material')
  String material;
  @JsonKey(name: 'subGroup')
  String subGroup;
  @JsonKey(name: 'colorCode')
  String colorCode;
  @JsonKey(name: 'colorFamily')
  String colorFamily;
  @JsonKey(name: 'seasonCode1')
  String seasonCode1;
  @JsonKey(name: 'seasonCode2')
  String seasonCode2;

  ErpDetailsProductRes({
    this.name,
    this.size,
    this.brand,
    this.color,
    this.group,
    this.gender,
    this.nameFA,
    this.cutting,
    this.styleFA,
    this.ageGroup,
    this.category,
    this.material,
    this.subGroup,
    this.colorCode,
    this.colorFamily,
    this.seasonCode1,
    this.seasonCode2,
  });

  factory ErpDetailsProductRes.fromJson(Map<String, dynamic> json) =>
      _$ErpDetailsProductResFromJson(json);

  Map<String, dynamic> toJson() => _$ErpDetailsProductResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'size': size,
      'brand': brand,
      'color': color,
      'group': group,
      'gender': gender,
      'nameFA': nameFA,
      'cutting': cutting,
      'styleFA': styleFA,
      'ageGroup': ageGroup,
      'category': category,
      'material': material,
      'subGroup': subGroup,
      'colorCode': colorCode,
      'longtitude': colorFamily,
      'seasonCode1': seasonCode1,
      'seasonCode2': seasonCode2,
    };
  }

  @override
  List<Object> get props => [
        name,
        size,
        brand,
        color,
        group,
        gender,
        nameFA,
        cutting,
        styleFA,
        ageGroup,
        category,
        material,
        subGroup,
        colorCode,
        colorFamily,
        seasonCode1,
        seasonCode2,
      ];
}
