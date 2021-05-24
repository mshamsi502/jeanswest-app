//
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-invite-info.dart';
import 'package:jeanswest/src/models/api_response/userRes/userInvite/user-invite-info-res.dart';
import 'package:jeanswest/src/models/profile/user/user-invite-info.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> userInviteInfo() async {
  UserInviteInfoRes userInviteInfoRes =
      await globalLocator<GlobalRestClient>().getUserInviteInfo();
  userInvite = UserInviteInfo(
    receivedGift: userInviteInfoRes.receivedGift,
    someOfInvited: userInviteInfoRes.someOfInvited,
    someOfInstallFromInvited: userInviteInfoRes.someOfInstallFromInvited,
    someOfShoppingFromInvited: userInviteInfoRes.someOfShoppingFromInvited,
  );
  print('_=_ get successfully UserInviteInfo: ${userInvite.receivedGift}');
  // ! ==> get and create successfully UserInviteInfo
}
