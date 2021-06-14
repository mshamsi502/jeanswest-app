// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/single-level-card.dart';
part 'level-cards-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class LevelCardsData extends Equatable {
  // @JsonKey(name: 'blueCardInfo')
  // SingleLevelCard blueCardInfo;
  @JsonKey(name: 'bluePlusCardInfo')
  SingleLevelCard bluePlusCardInfo;
  @JsonKey(name: 'blue2PlusCardInfo')
  SingleLevelCard blue2PlusCardInfo;
  @JsonKey(name: 'silverCardInfo')
  SingleLevelCard silverCardInfo;
  @JsonKey(name: 'goldCardInfo')
  SingleLevelCard goldCardInfo;

  LevelCardsData({
    // this.blueCardInfo,
    this.bluePlusCardInfo,
    this.blue2PlusCardInfo,
    this.silverCardInfo,
    this.goldCardInfo,
  });

  factory LevelCardsData.fromJson(Map<String, dynamic> json) =>
      _$LevelCardsDataFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$LevelCardsDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'blueCardInfo': blueCardInfo,
      'bluePlusCardInfo': bluePlusCardInfo,
      'blue2PlusCardInfo': blue2PlusCardInfo,
      'silverCardInfo': silverCardInfo,
      'goldCardInfo': goldCardInfo,
    };
  }

  @override
  List<Object> get props => [
        // blueCardInfo,
        bluePlusCardInfo,
        blue2PlusCardInfo,
        silverCardInfo,
        goldCardInfo,
      ];
}
