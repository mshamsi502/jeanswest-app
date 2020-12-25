//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    6th October - 06/10/2020     _     12:03:21
//****************************************************************************

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/bloc/branch/events/branch_addresses_screen_event.dart';
import 'package:jeanswest/src/bloc/branch/states/branch_addresses_screen_state.dart';
import 'package:jeanswest/src/constants/branch/constants.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
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
        // ignore: deprecated_member_use
        localBranches = new List<Branch>();
        // go on for loading
        // await Future.delayed(Duration(seconds: 2));
        yield BranchAddressesScreenLoading();

        // get userCameraPosition and branches
        userCameraPosition = await updateUserLocation();
        Map<String, dynamic> myMap = await getBranches(
            userCameraPosition.target, restClientForBranchesAddress);
        if (myMap['res'] as bool) {
          localBranches = myMap['branches'] as List<Branch>;
          localBranches.add(disableBranch);
          // go on for show map and load beanches on map
          try {
            yield BranchAddressesScreenSuccess(branches: localBranches);
          } catch (e) {
            printErrorMessage(e);
            yield BranchAddressesScreenFailureForGetBarnches(dioError: e);
          }
        } else {
          String errorMsg = 'لطفا اینترنت خود را چک کنید!';
          DioError dioError = DioError(response: Response(data: errorMsg));
          printErrorMessage(dioError);
          yield BranchAddressesScreenFailureForGetBarnches(dioError: dioError);
        }
      }
    }
  }
}
