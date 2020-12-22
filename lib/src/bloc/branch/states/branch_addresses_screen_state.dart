//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    6th October - 06/10/2020     _     12:04:03
//****************************************************************************

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

class BranchAddressesScreenFailureForCreateMap
    extends BranchAddressesScreenState {
  @override
  String toString() {
    return 'BranchAddressesScreenFailureForCreateMap{}';
  }
}
