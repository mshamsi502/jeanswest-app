import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/utils/database/branch/sqflite_provider.dart';
import 'package:sqflite/sqflite.dart';

class BranchProvider extends SqfliteProvider {
  String _tableName = 'branches';

  Future<Branch> insert(Branch branch,
      {conflictAlgorithm: ConflictAlgorithm.ignore}) async {
    await db.insert(_tableName, branch.toMap(),
        conflictAlgorithm: conflictAlgorithm);
    return branch;
  }

  Future<bool> insertAll(List<Branch> branches) async {
    await Future.wait(branches.map((branch) async {
      await this.insert(branch);
    }));
    return true;
  }

  Future<List<Branch>> paginate(int page, {int limit: 100}) async {
    List<Map> maps = await db.query(_tableName,
        columns: [
          'DepartmentInfo_ID',
          'DepName',
          'LocationPoint',
          'IsActive',
          'DepAddress',
          'DepTel',
          'Lat',
          'Lng',
          'Distance',
          'DistanceDesc'
        ],
        limit: limit,
        offset: page == 1 ? 0 : ((page - 1) * limit));
    if (maps.length > 0) {
      List<Branch> branches = [];
      maps.forEach((branch) {
        if (branch != null) branches.add(Branch.fromJson(branch));
      });
      return branches;
    }
    return null;
  }
}
