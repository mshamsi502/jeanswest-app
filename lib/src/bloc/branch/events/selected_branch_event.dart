//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    6th October - 06/10/2020     _     12:04:14
//****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:jeanswest/src/models/branch/branch.dart';

abstract class SelectedBranchEvent extends Equatable {
  final Branch selectedBranch;
  const SelectedBranchEvent({@required this.selectedBranch});

  @override
  List<Object> get props => [selectedBranch];

  @override
  String toString() {
    return 'SelectedBranchEvent{}';
  }
}

class SetSelectedBranchEvent extends SelectedBranchEvent {
  SetSelectedBranchEvent(Branch selectedBranch)
      : super(selectedBranch: selectedBranch);
}

class FinishSelectedBranchEvent extends SelectedBranchEvent {
  FinishSelectedBranchEvent(Branch selectedBranch)
      : super(selectedBranch: selectedBranch);
}
