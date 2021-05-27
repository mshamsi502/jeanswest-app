// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/models/branch/branch.dart';

abstract class SelectedBranchState extends Equatable {
  const SelectedBranchState();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'SelectedBranchState{}';
  }
}

class SelectedBranchInitial extends SelectedBranchState {
  @override
  String toString() {
    return 'SelectedBranchInitial{}';
  }
}

class SelectedBranchStable extends SelectedBranchState {
  final Branch selectedBranch;
  SelectedBranchStable({@required this.selectedBranch});

  @override
  List<Object> get props => [selectedBranch];

  @override
  String toString() {
    return 'SelectedBranchStable{}';
  }
}

class SelectedBranchUpdating extends SelectedBranchState {
  final Branch selectedBranch;

  SelectedBranchUpdating({@required this.selectedBranch});

  @override
  List<Object> get props => [selectedBranch];

  @override
  String toString() {
    return 'SelectedBranchUpdating{selectedBranch: $selectedBranch';
  }
}
