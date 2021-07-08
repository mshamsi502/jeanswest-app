//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/productRes/erp/exist-in-branches-list-res.dart';
import 'package:jeanswest/src/models/branch/branch-for-product.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<List<BranchForProduct>> getAvailableInBranches(String bracode) async {
  Map<String, String> _map = {"barcode": bracode};
  List<BranchForProduct> listOfBranches = [];
  try {
    ExistInBranchesListRes branches =
        await globalLocator<GlobalRestClient>().getExistInBranches(_map);
    if (branches.data != null &&
        branches.data.length > 0 &&
        branches.data[0] != null &&
        branches.data[0].kBarcode != null) {
      listOfBranches = branches.data;
    }
  } catch (errorRealAPI) {
    // if (ERROR_404_HANDLE_FOR_EMPTY_DATA && errorRealAPI.response == 404)
    //   return UserFavoriteInfoRes(data: []);
    // else {
    print('Catch Error ExistInBranchesListRes from ** Real API ** !');
    printErrorMessage(errorRealAPI);
    // if (HARDCORE_DATA_IS_ENABLE) {
    //   print("   / use HardCOre DATA ExistInBranchesListRes");
    // }
  }
  if (listOfBranches != null)
    print('listOfBranches.length :${listOfBranches.length}');
  return listOfBranches ?? [];
}
