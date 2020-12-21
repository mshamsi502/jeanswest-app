// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return Branch(
    departmentInfoID: json['DepartmentInfo_ID'] as String,
    depName: json['DepName'] as String,
    locationPoint: json['LocationPoint'] as String,
    isActive: json['IsActive'] as int,
    depAddress: json['DepAddress'] as String,
    depTel: json['DepTel'] as String,
    lat: json['Lat'] as String,
    lng: json['Lng'] as String,
    distance: json['Distance'] as int,
    distanceDesc: json['DistanceDesc'] as String,
    workTime: json['WorkTime'] as String ?? 'همه روزه از 10 تا 22',
  );
}

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'DepartmentInfo_ID': instance.departmentInfoID,
      'DepName': instance.depName,
      'LocationPoint': instance.locationPoint,
      'IsActive': instance.isActive,
      'DepAddress': instance.depAddress,
      'DepTel': instance.depTel,
      'Lat': instance.lat,
      'Lng': instance.lng,
      'Distance': instance.distance,
      'DistanceDesc': instance.distanceDesc,
      'WorkTime': instance.workTime,
    };
