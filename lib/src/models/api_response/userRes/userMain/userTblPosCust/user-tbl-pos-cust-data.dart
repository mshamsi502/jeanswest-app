// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user-tbl-pos-cust-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserTblPosCustData extends Equatable {
  @JsonKey(name: 'tblPosCustomers_ID')
  String tblPosCustomersID;
  //
  // @JsonKey(name: 'PartnerShipCode')
  // String partnerShipCode;
  // @JsonKey(name: 'Mobile')
  // String mobile;
  // @JsonKey(name: 'Name')
  // String name;
  // @JsonKey(name: 'FamilyName')
  // String familyName;
  // @JsonKey(name: 'Gender')
  // int gender;
  // @JsonKey(name: 'CusType')
  // String cusType;
  // @JsonKey(name: 'Email')
  // String email;
  // @JsonKey(name: 'BirthDate')
  // String birthDate;
  // @JsonKey(name: 'TSCodeID')
  // String tSCodeID;
  // @JsonKey(name: 'UpdateDate')
  // String updateDate;

  //
  UserTblPosCustData({
    this.tblPosCustomersID,
    //
    // this.partnerShipCode,
    // this.mobile,
    // this.name,
    // this.familyName,
    // this.gender,
    // this.cusType,
    // this.email,
    // this.birthDate,
    // this.tSCodeID,
    // this.updateDate,
  });

  factory UserTblPosCustData.fromJson(Map<String, dynamic> json) =>
      _$UserTblPosCustDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserTblPosCustDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tblPosCustomers_ID': tblPosCustomersID,
      //
      // 'PartnerShipCode': partnerShipCode,
      // 'Mobile': mobile,
      // 'Name': name,
      // 'FamilyName': familyName,
      // 'Gender': gender,
      // 'CusType': cusType,
      // 'Email': email,
      // 'BirthDate': birthDate,
      // 'TSCodeID': tSCodeID,
      // 'UpdateDate': updateDate,
    };
  }

  @override
  List<Object> get props => [
        tblPosCustomersID,
        //
        // partnerShipCode,
        // mobile,
        // name,
        // familyName,
        // gender,
        // cusType,
        // email,
        // birthDate,
        // tSCodeID,
        // updateDate,
        //
      ];
}
