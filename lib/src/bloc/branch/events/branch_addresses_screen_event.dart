//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    6th October - 06/10/2020     _     12:04:14
//****************************************************************************

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
