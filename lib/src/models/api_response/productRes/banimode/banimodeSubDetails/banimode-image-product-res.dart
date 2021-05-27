// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banimode-image-product-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class BanimodeImageProductRes extends Equatable {
  @JsonKey(name: 'cart_default')
  List<String> cartDefault;
  @JsonKey(name: 'home_default')
  List<String> homeDefault;
  @JsonKey(name: 'large_default')
  List<String> largeDefault;
  @JsonKey(name: 'small_default')
  List<String> smallDefault;
  @JsonKey(name: 'medium_default')
  List<String> mediumDefault;
  @JsonKey(name: 'thickbox_default')
  List<String> thickboxDefault;
  @JsonKey(name: 'thickbox_default2x')
  List<String> thickboxDefault2x;

  BanimodeImageProductRes({
    this.cartDefault,
    this.homeDefault,
    this.largeDefault,
    this.smallDefault,
    this.mediumDefault,
    this.thickboxDefault,
    this.thickboxDefault2x,
  });

  factory BanimodeImageProductRes.fromJson(Map<String, dynamic> json) =>
      _$BanimodeImageProductResFromJson(json);

  Map<String, dynamic> toJson() => _$BanimodeImageProductResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cart_default': cartDefault,
      'home_default': homeDefault,
      'large_default': largeDefault,
      'small_default': smallDefault,
      'medium_default': mediumDefault,
      'thickbox_default': thickboxDefault,
      'thickbox_default2x': thickboxDefault2x,
    };
  }

  @override
  List<Object> get props => [
        cartDefault,
        homeDefault,
        largeDefault,
        smallDefault,
        mediumDefault,
        thickboxDefault,
        thickboxDefault2x,
      ];
}
