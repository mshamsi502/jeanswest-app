// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:synchronized/synchronized.dart';

import 'branch_provider.dart';

final _lock = Lock();

Future<bool> saveAllBranchesIntoSqLite(List<Branch> serverBranches) async {
// save to SqLite
  return _lock.synchronized(() async {
    var db = new BranchProvider();
    await db.open(dbName: 'branches');
    await db.insertAll(serverBranches);
    await db.close();
    return true;
  });
}

Future<Map<String, dynamic>> getAllBranchesFromSqLite(LatLng latLng) async {
  // load from SQLite
  return _lock.synchronized(() async {
    var db = new BranchProvider();
    await db.open();
    List<Branch> branches = await db.paginate(1);
    await db.close();
    if (branches == null || branches.length == 0) {
      return {
        'res': false,
        'branches': branches,
      };
    } else
      return {
        'res': true,
        'branches': branches,
      };
  });
}
