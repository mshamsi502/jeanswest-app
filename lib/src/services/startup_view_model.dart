// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/constValues/route_names.dart';
// import 'package:jeanswest/src/services/authentication_service.dart';
import 'package:jeanswest/src/services/base_model.dart';
import 'package:jeanswest/src/services/dynamic_link_services.dart';
import 'package:jeanswest/src/services/navigation_service.dart';
import 'package:jeanswest/src/services/push_notification_service.dart';

class StartUpViewModel extends BaseModel {
  // final AuthenticationService _authenticationService =
  //     globalLocator<AuthenticationService>();
  final NavigationService _navigationService =
      globalLocator<NavigationService>();
  final PushNotificationService _pushNotificationService =
      globalLocator<PushNotificationService>();
  final DynamicLinkService _dynamicLinkService =
      globalLocator<DynamicLinkService>();

  Future handleStartUpLogic() async {
    await _dynamicLinkService.handleDynamicLinks();

    // Register for push notifications
    await _pushNotificationService.initialise();

    // var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    var hasLoggedInUser = userIsAuth;

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}
