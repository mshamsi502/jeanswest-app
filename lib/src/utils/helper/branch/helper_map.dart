//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    5th October - 05/10/2020     _     10:57:27
//****************************************************************************

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/services/branch/rest_client_for_branches_address.dart';
import 'package:jeanswest/src/utils/database/branch/sqflite_helper.dart';

import '../global/helper.dart';

Future<CameraPosition> updateUserLocation() async {
  Position pos =
      // ignore: deprecated_member_use
      await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  // Position(latitude: 35.7553, longitude: 51.3339);
  print('******** user position : ${pos.toString()}');
  if ((pos.latitude - 32.930013).abs() > 30 ||
      (pos.longitude - 52.361063).abs() > 30) {
    pos = Position(latitude: 40, longitude: 30);
    print('******** FAKE user position : ${pos.toString()}');
  }
  CameraPosition currentCameraPosition =
      new CameraPosition(target: LatLng(pos.latitude, pos.longitude), zoom: 16);
  return currentCameraPosition;
}

/// Create Custom Marker JeansWest Branch Icon in [BitmapDescriptor] Format
/// Take Two Parameter [assetsPath] and [size], return one Parameter in [BitmapDescriptor] Format
/// [assetsPath] is Path of your assets image in [String] Format
/// [size] is width or height of Icon in [int] Format (70 is a Good Size)
Future<BitmapDescriptor> createMarkIcon(assetsPath, size) async {
  ByteData data = await rootBundle.load(assetsPath);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: size);
  ui.FrameInfo fi = await codec.getNextFrame();
  return BitmapDescriptor.fromBytes(
    (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List(),
  );
}

Future<Set<Marker>> onCreateMarkList(double dpiSize, List<Branch> _branches,
    Function(bool, Branch) changeSelectedBranch, Branch selectedBranch) async {
  Set<Marker> _markers = {};
  BitmapDescriptor markIcon = await createMarkIcon(
      'assets/images/marker_icon.png', (dpiSize * 23).toInt());

  BitmapDescriptor selectedMarkIcon = await createMarkIcon(
      'assets/images/selected_marker_icon.png', (dpiSize * 30).toInt());

  BitmapDescriptor disableMarkIcon = await createMarkIcon(
      'assets/images/disable_marker_icon.png', (dpiSize * 23).toInt());

  if (_branches != null && _branches.length != 0) {
    _branches.forEach((_branch) {
      Marker _marker = Marker(
          markerId: MarkerId(_branch.departmentInfoID.toString()),
          position:
              LatLng(double.parse(_branch.lat), double.parse(_branch.lng)),
          draggable: false,
          icon: _branch.isActive == 0
              ? disableMarkIcon
              : (selectedBranch != null &&
                      _branch.departmentInfoID ==
                          selectedBranch.departmentInfoID)
                  ? selectedMarkIcon
                  : markIcon,
          //
          // infoWindow: InfoWindow(
          //   title: _branch.depName,
          // ),
          //
          onTap: () {
            changeSelectedBranch(true, _branch);
          });
      _markers.add(_marker);
    });
  }
  return _markers;
}

CameraPosition getCenterCameraPosition(
    List<Branch> _branches, CameraPosition _userCameraPosition) {
  print('===== Branch Length : ${_branches.length}');
  Branch _closerBranch = getCloserBranch(_branches, _userCameraPosition);
  double userLat = _userCameraPosition.target.latitude;
  double userLong = _userCameraPosition.target.longitude;
  double closerBrLat = double.parse(_closerBranch.lat ?? '0');
  double closerBrLng = double.parse(_closerBranch.lng ?? '0');
  print('------------------closerBranchDistance : ${_closerBranch.distance}');
  CameraPosition centerCameraPosition = new CameraPosition(
      target: LatLng(
        _closerBranch.distance < 700000
            ? userLat -
                ((userLat - closerBrLat) / 2) -
                (_closerBranch.distance > 80000 ? 1 : 0.007)
            : 32.930013,
        _closerBranch.distance < 700000
            ? userLong - ((userLong - closerBrLng) / 2)
            : 52.361063,
      ),
      zoom:
          // _closerBranch.distance  > 2000
          //     ? 5
          //     :
          _closerBranch.distance <= 2000
              ? 14
              : _closerBranch.distance <= 3000
                  ? 13.5
                  : _closerBranch.distance <= 8000
                      ? 12
                      : _closerBranch.distance <= 15000
                          ? 11
                          : _closerBranch.distance <= 25000
                              ? 9
                              : _closerBranch.distance <= 80000
                                  ? 8
                                  : _closerBranch.distance <= 700000
                                      ? 6
                                      : 4);
  print(
      '//////////////CenterCameraPosition//latlng : ${centerCameraPosition.target.latitude.toStringAsFixed(6)} , ${centerCameraPosition.target.longitude.toStringAsFixed(6)} ');
  print(
      '//////////////CenterCameraPosition//zooom : ${centerCameraPosition.zoom}');
  return centerCameraPosition;
}

Branch getCloserBranch(
    List<Branch> _branches, CameraPosition _userCameraPosition) {
  Branch _closerBranch = new Branch();
  if (_branches != null && _branches.length != 0) {
    for (var i = 0; i < _branches.length; i++) {
      if (_branches[i].isActive == 1) {
        _closerBranch = _branches[i];
        break;
      }
      _branches.forEach((_branch) {
        if (_branch.isActive == 1 &&
            _branch.distance < _closerBranch.distance) {
          _closerBranch = _branch;
        }
      });
    }
  }
  return _closerBranch;
}

Future<List<Branch>> getBranches(LatLng latLng,
    RestClientForBranchesAddress restClientForBranchesAddress) async {
  if (await checkConnectionInternet()) {
    // ignore: deprecated_member_use
    List<Branch> branches = new List<Branch>();
    print('OoOoOoOoO -- load from Internet');
    branches = await restClientForBranchesAddress.getBranchesAddress(
        latLng.latitude.toString(), latLng.longitude.toString());
    branches.sort((a, b) => a.distance.compareTo(b.distance));
    bool res = await saveAllBranchesIntoSqLite(branches);
    if (res) {
      print('+++++ ** save to sq success');
    } else {
      print('----- ** faild to save to sq');
    }
    return branches;
  } else {
    print('OoOoOoOoO -- load from SQFLite');
    return await getAllBranchesFromSqLite(latLng);
  }
}

printErrorMessage(DioError e) {
  if (e.response != null) {
    print("111111111111111111111111");
    print(e.response.data);
    print(e.response.headers);
    print(e.response.request);
  } else {
    // Something happened in setting up or sending the request that triggered an Error
    print("222222222222222222222222");
    print(e.request);
    print(e.message);
  }
}

String createCoordinatesUrl(double latitude, double longitude, [String label]) {
  var uri;
  if (Platform.isAndroid) {
    label == null
        ? uri = 'geo:0,0?q=$latitude,$longitude'
        : uri = 'geo:0,0?q=$latitude,$longitude($label)';
  } else if (Platform.isIOS) {
// var params = {'ll': '$latitude,$longitude'};
// if (label != null) params['q'] = label;
// uri = Uri.https('maps.apple.com', '/', params);
  } else {
// uri = Uri.https('www.google.com', '/maps/dir',
//     {'api': '1', 'query': '$latitude,$longitude'});
  }
  print(uri?.toString());
  return uri?.toString();
}

// List<Branch> getListOfBranchesStatic({String query, List<Branch> branches}) {
//   List<Branch> data;
//   if (data == null) {
//     data = new List<Branch>();
//   }
//   List<Branch> filterBranches = new List<Branch>();
//   if (!query.endsWith(' ')) {
//     query = query + ' ';
//   }
//   List<String> splitQuery = query.split(' ');
//   List<List<Branch>> branchesForEachWord = new List<List<Branch>>();
//   print('some of words : ${splitQuery.length} , $splitQuery');
//   splitQuery.forEach((word) {
//     branchesForEachWord.add(getListOfBranches(query: word, branches: branches));
//   });
//   print('some of branchesForEachWord : ${branchesForEachWord.length}');
//   for (var x = 0; x < branchesForEachWord.length; x++) {
//     print('results found for word $x : ${branchesForEachWord[x].length}');
//     for (var y = 0; y < branchesForEachWord[x].length; y++) {
//       bool existInQuery = false;
//       for (var a = 0; a < branchesForEachWord.length; a++) {
//         bool existInRow = false;
//         for (var b = 0; b < branchesForEachWord[a].length; b++) {
//           if (branchesForEachWord[x][y].departmentInfoID ==
//               branchesForEachWord[a][b].departmentInfoID) {
//             existInRow = true;
//             break; // for b
//           }
//         }
//         if (!existInRow) {
//           existInQuery = false;
//           break; // for a
//         } else {
//           existInQuery = true;
//         }
//       }
//       if (existInQuery) {
//         bool same = false;
//         filterBranches.forEach((branch) {
//           if (branchesForEachWord[x][y].departmentInfoID ==
//               branch.departmentInfoID) {
//             same = true;
//           }
//         });
//         if (!same) filterBranches.add(branchesForEachWord[x][y]);
//       }
//     }
//   }
//   data = filterBranches;
//   print(' ***  *** ** length of result : ${data.length}');
//   return data;
// }
//
// List<Branch> getListOfBranches({String query, List<Branch> branches}) {
//   List<Branch> data = branches;
//   List<Branch> filterBranches = data.where(
//     (Branch element) {
//       //
//       String _depName = element.depName;
//       String _depAddress = element.depAddress;
//       _depName = arabicToPersianCharacter(_depName);
//       _depAddress = arabicToPersianCharacter(_depAddress);
//       query = arabicToPersianCharacter(query);
//       //
//       bool checkNull = (element.depName != null) &&
//           (element.departmentInfoID != null) &&
//           (element.distanceDesc != null);
//       bool checkQuery = (query == null)
//           ? true
//           : (_depName.toLowerCase().contains(query.toLowerCase()) ||
//               _depAddress.toLowerCase().contains(query.toLowerCase()));
//       return checkNull && checkQuery;
//     },
//   ).toList();
//   data = filterBranches;
//   return data;
// }

///
///
///
///
///
// List<Branch> getListOfBranchesStatic({String query, List<Branch> branches}) {
//   List<Branch> data = branches;
//   // print('00000000000');
//   // print(data.countriesCode.length);
//   List<Branch> filterBranches = data.where(
//         (Branch element) {
//       bool checkNull = (element.depName != null) &&
//           (element.departmentInfoID != null) &&
//           (element.distanceDesc != null);
//       bool checkQuery = (query == null)
//           ? true
//           : (element.depName.toLowerCase().contains(query.toLowerCase()) ||
//           element.depName.toLowerCase().contains(query.toLowerCase()));
//       // print(element.name + " " + checkNull.toString());
//       return checkNull && checkQuery;
//     },
//   ).toList();
//   // // print(filterCountryCode.length);
//   data = filterBranches;
//   return data;
// }
