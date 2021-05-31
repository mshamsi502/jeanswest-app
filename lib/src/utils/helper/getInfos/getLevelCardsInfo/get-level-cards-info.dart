//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/globalInstances/level-cards-data.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/level-cards-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> getLevelCardsInfo() async {
  try {
    LevelCardsRes levelCardsRes =
        await globalLocator<GlobalRestClient>().getLevelCardsInfo();

    if (levelCardsRes.data != null &&
        levelCardsRes.data[0] != null &&
        levelCardsRes.data[0].id != null) {
      levelCardsData = levelCardsRes.data;
    } else if (HARDCORE_DATA_IS_ENABLE) {
      print("   / use HardCOre DATA contactUsInfo");
      levelCardsData = levelCardsTempData;
    }
  } catch (e) {}
  print('_=_ get successfully levelCardsData: ${levelCardsData.length}');
}
