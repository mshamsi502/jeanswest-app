// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteProvider {
  Database db;
  String _path;

  Future open({String dbName: 'branches'}) async {
    var databasesPath = await getDatabasesPath();
    _path = join(databasesPath, '$dbName.db');

    db = await openDatabase(_path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
           CREATE TABLE branches (
             DepartmentInfo_ID TEXT PRIMARY KEY,
             DepName TEXT NOT NULL,
             LocationPoint TEXT NOT NULL,
             IsActive INTEGER NOT NULL,
             DepAddress TEXT NOT NULL,
             DepTel TEXT NOT NULL,
             Lat TEXT NOT NULL,
             Lng TEXT NOT NULL,
             Distance INTEGER NOT NULL,
             DistanceDesc TEXT NOT NULL,
             WorkTime TEXT NOT NULL)
         ''');
    });
  }

  Future close() async => db.close();
}
