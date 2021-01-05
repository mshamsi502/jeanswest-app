// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';

abstract class BranchAddressesScreenEvent extends Equatable {
  const BranchAddressesScreenEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'BranchAddressesScreenEvent{}';
  }
}

// Fired just after the app is launched
class GetBranchAddressListEvent extends BranchAddressesScreenEvent {
  @override
  String toString() => 'GetBranchAddressesEvent{}';
}
