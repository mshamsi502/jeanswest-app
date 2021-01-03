// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/models/branch/branch.dart';

abstract class BranchAddressesScreenState extends Equatable {
  const BranchAddressesScreenState();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'BranchAddressesScreenState{}';
  }
}

class BranchAddressesScreenInitial extends BranchAddressesScreenState {
  @override
  String toString() {
    return 'BranchAddressesScreenInitial{}';
  }
}

class BranchAddressesScreenLoading extends BranchAddressesScreenState {
  @override
  String toString() {
    return 'BranchAddressesScreenLoading{}';
  }
}

class BranchAddressesScreenSuccess extends BranchAddressesScreenState {
  final List<Branch> branches;

  BranchAddressesScreenSuccess({@required this.branches});

  @override
  List<Object> get props => [branches];

  @override
  String toString() {
    return 'BranchAddressesScreenSuccess{branches: $branches}';
  }
}

class BranchAddressesScreenFailureForGetBarnches
    extends BranchAddressesScreenState {
  final DioError dioError;

  BranchAddressesScreenFailureForGetBarnches({@required this.dioError});

  @override
  List<Object> get props => [dioError];

  @override
  String toString() {
    return 'BranchAddressesScreenFailureForGetBarnches{dioError: $dioError}';
  }
}

// ignore: must_be_immutable
class BranchAddressesScreenFailureForCreateMap
    extends BranchAddressesScreenState {
  final DioError dioError;

  BranchAddressesScreenFailureForCreateMap({@required this.dioError});

  @override
  List<Object> get props => [dioError];

  @override
  String toString() {
    return 'BranchAddressesScreenFailureForCreateMap{dioError: $dioError}';
  }
}
