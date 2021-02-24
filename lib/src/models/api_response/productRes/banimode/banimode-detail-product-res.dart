// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimodeSubDetails/banimode-image-product-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimodeSubDetails/banimode-size-product-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banimode-detail-product-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class BanimodeDetailsProductRes extends Equatable {
  @JsonKey(name: 'product_size_guide')
  List<List<String>> productSizeGuide;
  @JsonKey(name: 'size')
  List<BanimodeSizeProductRes> size;
  @JsonKey(name: 'images')
  BanimodeImageProductRes images;
  @JsonKey(name: 'id_color')
  int idColor;
  @JsonKey(name: 'color_name')
  String colorName;
  @JsonKey(name: 'color_value')
  String colorValue;
  @JsonKey(name: 'product_name')
  String productName;
  @JsonKey(name: 'product_manufacturer_name')
  String productManufacturerName;
  @JsonKey(name: 'product_manufacturer_en_name')
  String productManufacturerEnName;

  BanimodeDetailsProductRes({
    this.productSizeGuide,
    this.size,
    this.images,
    this.idColor,
    this.colorName,
    this.colorValue,
    this.productName,
    this.productManufacturerName,
    this.productManufacturerEnName,
  });

  factory BanimodeDetailsProductRes.fromJson(Map<String, dynamic> json) =>
      _$BanimodeDetailsProductResFromJson(json);

  Map<String, dynamic> toJson() => _$BanimodeDetailsProductResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_size_guide': productSizeGuide,
      'size': size,
      'images': images,
      'id_color': idColor,
      'color_name': colorName,
      'color_value': colorValue,
      'product_name': productName,
      'product_manufacturer_name': productManufacturerName,
      'product_manufacturer_en_name': productManufacturerEnName,
    };
  }

  @override
  List<Object> get props => [
        productSizeGuide,
        size,
        images,
        idColor,
        colorName,
        colorValue,
        productName,
        productManufacturerName,
        productManufacturerEnName,
      ];
}
