//

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-favorites-info.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';

Future<void> userFavoritesInfo() async {
  userFavorites = await globalLocator<GlobalRestClient>().getUserFavoriteInfo();
  print('_=_ get successfully userFavorite: ${userFavorites.data.perPage}');
  print(
      '_=_ get successfully userFavorite: ${userFavorites.data.result[0].banimodeDetails.productName}');
  // ! ==> get and create successfully UserFavoriteInfo
}
