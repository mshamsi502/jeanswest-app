// Created By : Mohammad Shamsi
// Email : mshamsi502@gmail.com
// --------------------------------
// Project Name : avakatan_branches
// Create Date : 2020-10-03
// Create Time : 10:44 AM
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class Branch extends Equatable {
  @JsonKey(name: 'DepartmentInfo_ID')
  String departmentInfoID;

  @JsonKey(name: 'DepName')
  String depName;

  @JsonKey(name: 'LocationPoint')
  String locationPoint;

  @JsonKey(name: 'IsActive')
  int isActive;

  @JsonKey(name: 'DepAddress')
  String depAddress;

  @JsonKey(name: 'DepTel')
  String depTel;

  @JsonKey(name: 'Lat')
  String lat;

  @JsonKey(name: 'Lng')
  String lng;

  @JsonKey(name: 'Distance')
  int distance;

  @JsonKey(name: 'DistanceDesc')
  String distanceDesc;

  @JsonKey(defaultValue: 'همه روزه از 10 تا 22', name: 'WorkTime')
  String workTime;

  Branch(
      {this.departmentInfoID,
      this.depName,
      this.locationPoint,
      this.isActive,
      this.depAddress,
      this.depTel,
      this.lat,
      this.lng,
      this.distance,
      this.distanceDesc,
      this.workTime});

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'DepartmentInfo_ID': departmentInfoID,
      'DepName': depName,
      'LocationPoint': locationPoint,
      'IsActive': isActive,
      'DepAddress': depAddress,
      'DepTel': depTel,
      'Lat': lat,
      'Lng': lng,
      'Distance': distance,
      'DistanceDesc': distanceDesc,
      'WorkTime': workTime
    };
  }

  @override
  List<Object> get props => [
        departmentInfoID,
        depName,
        locationPoint,
        isActive,
        depAddress,
        depTel,
        lat,
        lng,
        distance,
        distanceDesc,
        workTime
      ];
}
