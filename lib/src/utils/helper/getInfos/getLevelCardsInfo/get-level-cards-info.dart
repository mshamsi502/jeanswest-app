//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/level-cards-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> getLevelCardsInfo() async {
  LevelCardsRes levelCards =
      await globalLocator<GlobalRestClient>().getLevelCardsInfo();
}
