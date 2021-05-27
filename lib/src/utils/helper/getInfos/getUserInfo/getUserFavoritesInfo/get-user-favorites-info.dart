//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/general_response.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFavorite/user-favorite-info-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<UserFavoriteInfoRes> userFavoritesInfo(String id) async {
  Map<String, String> tblPosCustomersID = {"tblPosCustomersID": id};
  UserFavoriteInfoRes userFavoritesRes;
  try {
    userFavoritesRes = await globalLocator<GlobalRestClient>()
        .getUserFavoriteInfo(tblPosCustomersID);
  } catch (errorRealAPI) {
    print('Catch Error getUserFavoriteInfo from ** Real API ** !');
    printErrorMessage(errorRealAPI);
    try {
      userFavoritesRes =
          await globalLocator<GlobalRestClient>().getMockUserFavoriteInfo();
    } catch (errorMockoon) {
      print('Catch Error getUserFavoriteInfo from ** Mockoon ** !');
      printErrorMessage(errorMockoon);
    }
  }

  print('_=_ get successfully userFavorite: ${userFavoritesRes.data.length}');
  if (userFavoritesRes.data.length > 0)
    print(
        '_=_ get successfully userFavorite: ${userFavoritesRes.data[0].banimodeDetails.productName}');
  return userFavoritesRes;
}

Future<GeneralRespons> addToUserFavoriteInfo(String barcode) async {
  Map<String, String> mapBarcode = {"barcode": barcode};
  GeneralRespons res;
  try {
    res = await globalLocator<GlobalRestClient>().addToUserFavorite(mapBarcode);
  } catch (errorRealAPI) {
    print('Catch Error getUserFavoriteInfo from ** Real API ** !');
    printErrorMessage(errorRealAPI);
  }

  return res;
}

Future<GeneralRespons> removeFromUserFavoriteInfo(String barcode) async {
  Map<String, String> mapBarcode = {"barcode": barcode};
  GeneralRespons res;
  try {
    res = await globalLocator<GlobalRestClient>()
        .removeFromUserFavorite(mapBarcode);
  } catch (errorRealAPI) {
    print('Catch Error from ** Real API ** !');
    printErrorMessage(errorRealAPI);
  }

  return res;
}
