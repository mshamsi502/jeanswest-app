//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    6th October - 06/10/2020     _     12:03:56
//****************************************************************************

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/models/branch/branch.dart';

import 'branch_provider.dart';

Future<bool> saveAllBranchesIntoSqLite(List<Branch> serverBranches) async {
// save to SqLite
  var db = new BranchProvider();
  await db.open(dbName: 'branches');
  await db.insertAll(serverBranches);
  await db.close();
  return true;
}

Future<List<Branch>> getAllBranchesFromSqLite(LatLng latLng) async {
  // load from SQLite
  var db = new BranchProvider();
  await db.open();
  List<Branch> branches = await db.paginate(1);
  await db.close();
  return branches;
}
