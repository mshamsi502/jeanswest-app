// // *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// // *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// // *   Created Date & Time:  2021-01-01  ,  10:00 AM
// // ****************************************************************************

// import 'package:jeanswest/constants/route_names.dart';
// import 'package:jeanswest/locator.dart';
// import 'package:jeanswest/services/authentication_service.dart';
// import 'package:jeanswest/services/dynamic_link_service.dart';
// import 'package:jeanswest/services/navigation_service.dart';
// import 'package:jeanswest/services/push_notification_service.dart';
// import 'package:jeanswest/viewmodels/base_model.dart';

// class StartUpViewModel extends BaseModel {
//   final AuthenticationService _authenticationService =
//       locator<AuthenticationService>();
//   final NavigationService _navigationService = locator<NavigationService>();
//   final PushNotificationService _pushNotificationService =
//       locator<PushNotificationService>();
//   final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();

//   Future handleStartUpLogic() async {
//     await _dynamicLinkService.handleDynamicLinks();

//     // Register for push notifications
//     await _pushNotificationService.initialise();

//     var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

//     if (hasLoggedInUser) {
//       _navigationService.navigateTo(HomeViewRoute);
//     } else {
//       _navigationService.navigateTo(LoginViewRoute);
//     }
//   }
// }
