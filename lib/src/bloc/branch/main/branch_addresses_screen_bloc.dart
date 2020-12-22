//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    6th October - 06/10/2020     _     12:03:21
//****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/bloc/branch/events/branch_addresses_screen_event.dart';
import 'package:jeanswest/src/bloc/branch/states/branch_addresses_screen_state.dart';
import 'package:jeanswest/src/constants/branch/constants.dart';
import 'package:jeanswest/src/services/branch/rest_client_for_branches_address.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';

import '../states/branch_addresses_screen_state.dart';

class BranchAddressesScreenBloc
    extends Bloc<BranchAddressesScreenEvent, BranchAddressesScreenState> {
  final RestClientForBranchesAddress restClientForBranchesAddress;

  BranchAddressesScreenBloc(BranchAddressesScreenState initialState,
      {@required this.restClientForBranchesAddress})
      : assert(restClientForBranchesAddress != null),
        super(initialState);

  @override
  Stream<BranchAddressesScreenState> mapEventToState(
      BranchAddressesScreenEvent event) async* {
    CameraPosition userCameraPosition;
    if (event is GetBranchAddressListEvent) {
      if (localBranches == null || localBranches.length <= 1) {
        // go on for loading
        // await Future.delayed(Duration(seconds: 2));
        yield BranchAddressesScreenLoading();

        // get userCameraPosition and branches
        userCameraPosition = await updateUserLocation();
        print('+++++ ** get Branches Length:  ${localBranches.length}');
        localBranches = await getBranches(
            userCameraPosition.target, restClientForBranchesAddress);
        localBranches.add(disableBranch);
        isInitLoadingBranchPage = false;
      }
      // go on for show map and load beanches on map
      try {
        yield BranchAddressesScreenSuccess(branches: localBranches);
      } catch (e) {
        printErrorMessage(e);
        yield BranchAddressesScreenFailureForGetBarnches(dioError: e);
      }
      // }
    }
  }
}
