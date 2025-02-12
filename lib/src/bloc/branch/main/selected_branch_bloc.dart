// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeanswest/src/bloc/branch/events/selected_branch_event.dart';
import 'package:jeanswest/src/bloc/branch/states/selected_branch_state.dart';

class SelectedBranchBloc
    extends Bloc<SelectedBranchEvent, SelectedBranchState> {
  // final Branch selectedBranch;
  SelectedBranchBloc(
    SelectedBranchState initialState,
    // this.selectedBranch,
  ) : super(initialState);

  @override
  Stream<SelectedBranchState> mapEventToState(
      SelectedBranchEvent event) async* {
    if (event is SetSelectedBranchEvent) {
      print('IS UPDATING STATE ...');
      print('event.selectedBranch : ${event.selectedBranch.depName}');
      yield SelectedBranchUpdating(selectedBranch: event.selectedBranch);
      // yield SelectedBranchStable(selectedBranch: event.selectedBranch);
    } else if (event is FinishSelectedBranchEvent) {
      print('IS STABLE STATE ...');
      // yield SelectedBranchUpdating(selectedBranch: event.selectedBranch);
      yield SelectedBranchStable(selectedBranch: event.selectedBranch);
    }
  }
}
