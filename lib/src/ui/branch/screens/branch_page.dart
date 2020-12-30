// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/bloc/branch/events/branch_addresses_screen_event.dart';
import 'package:jeanswest/src/bloc/branch/events/selected_branch_event.dart';
import 'package:jeanswest/src/bloc/branch/main/branch_addresses_screen_bloc.dart';
import 'package:jeanswest/src/bloc/branch/main/selected_branch_bloc.dart';
import 'package:jeanswest/src/bloc/branch/states/branch_addresses_screen_state.dart';
import 'package:jeanswest/src/constants/global/size_constants.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/ui/branch/widgets/branches_list_widget.dart';
import 'package:jeanswest/src/ui/branch/widgets/branches_map_widget.dart';
import 'package:jeanswest/src/ui/global/screens/loading_page.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/real_search_appbar_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/search_appbar_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/show_error_widget.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';
import 'package:jeanswest/src/utils/helper/search/helper_search.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BranchPage extends StatefulWidget {
  BranchPage({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  _BranchPageState createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage>
    with AutomaticKeepAliveClientMixin<BranchPage> {
  BranchAddressesScreenBloc _branchAddressesScreenBloc;
  SelectedBranchBloc _selectedBranchBloc;
  PanelController panelController;
  List<Branch> branches;
  List<Branch> searchedBranches;
  CameraPosition userCameraPosition;
  FocusNode inputNode = FocusNode();
  TextEditingController textEditingController;

  Branch selectedBranch;
  bool isSelectedBranch;

  @override
  void initState() {
    super.initState();
    _branchAddressesScreenBloc =
        BlocProvider.of<BranchAddressesScreenBloc>(context);
    _selectedBranchBloc = BlocProvider.of<SelectedBranchBloc>(context);
    _branchAddressesScreenBloc.add(GetBranchAddressListEvent());
    panelController = new PanelController();
    // ignore: deprecated_member_use
    branches = new List<Branch>();
    isSelectedBranch = false;
    textEditingController = new TextEditingController();
    initProvider();
  }

  Future<void> initProvider() async {
    userCameraPosition = await updateUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var screenSize = MediaQuery.of(context).size;

    return BlocConsumer<BranchAddressesScreenBloc, BranchAddressesScreenState>(
      listener: (context, branchAddressesScreenState) {
        print('BranchAddressesScreen state change to % ' +
            branchAddressesScreenState.toString() +
            ' %');
        if (branchAddressesScreenState is BranchAddressesScreenSuccess) {
          setState(() {
            branches = branchAddressesScreenState.branches;
            selectedBranch = getCloserBranch(branches, userCameraPosition);
            searchedBranches = branches;
          });
        } else if (branchAddressesScreenState is BranchAddressesScreenLoading) {
          //

        } else if (branchAddressesScreenState
            is BranchAddressesScreenFailureForGetBarnches) {
          DioError e = branchAddressesScreenState.dioError;
          printErrorMessage(e);
        }
      },
      builder: (context, branchAddressesScreenState) {
        if (branchAddressesScreenState is BranchAddressesScreenInitial) {
          return Container(
            color: Colors.white,
          );
        } else if (branchAddressesScreenState is BranchAddressesScreenLoading) {
          return LoadingPage(
            text: 'لطفا تا بارگذاری کامل نقشه منتظر بمانید',
            widthText: 270,
          );
        } else if (branchAddressesScreenState is BranchAddressesScreenSuccess) {
          return SlidingUpPanel(
              controller: panelController,
              minHeight: 0,
              maxHeight: screenSize.height,
              backdropEnabled: true,
              panel: Column(
                children: [
                  RealSearchAppBarWidget(
                    title: '${"branch_screen.branches_list".tr()} ...',
                    changeListPanelState: changeBranchListPanelState,
                    changeTextFieldSearch: changeTextFieldSearch,
                    inputNode: inputNode,
                    textEditingController: textEditingController,
                  ),
                  BranchListWidget(
                    userCameraPosition: userCameraPosition,
                    branches: searchedBranches,
                    changeBranchListPanelState: changeBranchListPanelState,
                    changeSelectedBranch: changeSelectedBranch,
                  ),
                ],
              ),
              body: Column(children: [
                SearchAppBarWidget(
                  title: "branch_screen.branches_list".tr(),
                  changeBranchListPanelState: changeBranchListPanelState,
                ),
                Expanded(
                  child: BranchesMapWidget(
                    branches: branchAddressesScreenState.branches,
                    selectedBranch: selectedBranch,
                    isSelectedBranch: isSelectedBranch,
                  ),
                ),
                SizedBox(height: BOTTOM_NAVIGATION_BAR_HEIGHT + 20),
              ]));
        } else if (branchAddressesScreenState
            is BranchAddressesScreenFailureForGetBarnches) {
          return ShowErrorWidget(
            errorMsg: branchAddressesScreenState.dioError.response.data,
            tryAgainText: 'تلاش دوباره',
            function: () =>
                _branchAddressesScreenBloc.add(GetBranchAddressListEvent()),
          );
        } else if (branchAddressesScreenState
            is BranchAddressesScreenFailureForCreateMap) {
          return ShowErrorWidget(
            errorMsg: branchAddressesScreenState.dioError.response.data,
            tryAgainText: 'تلاش دوباره',
            function: () =>
                _branchAddressesScreenBloc.add(GetBranchAddressListEvent()),
          );
        } else {
          return ShowErrorWidget(
            errorMsg: 'لطفا دوباره تلاش کنید.',
            tryAgainText: 'تلاش دوباره',
            function: () =>
                _branchAddressesScreenBloc.add(GetBranchAddressListEvent()),
          );
        }
      },
      // ),
    );
  }

  changeBranchListPanelState(bool opt) {
    setState(() {
      if (opt) {
        changeTextFieldSearch('');
        panelController.animatePanelToPosition(1.0,
            duration: Duration(milliseconds: 500));
        // panelController.open();
        FocusScope.of(context).requestFocus(inputNode);
      } else {
        panelController.animatePanelToPosition(0.0,
            duration: Duration(milliseconds: 500));
        // panelController.close();
        if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
      }
    });
  }

  changeSelectedBranch(Branch selectedBranch) async {
    _selectedBranchBloc.add(SetSelectedBranchEvent(selectedBranch));
    setState(() {
      this.isSelectedBranch = false;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      this.selectedBranch = selectedBranch;
      this.isSelectedBranch = true;
    });
  }

  changeTextFieldSearch(String textFieldSearchValue) {
    setState(() {
      if (textFieldSearchValue == null ||
          textFieldSearchValue.isEmpty ||
          textFieldSearchValue == '') {
        textEditingController.clear();
        searchedBranches = branches;
      } else {
        searchedBranches = getListOfObjectsStatic(
                query: textFieldSearchValue,
                objects: branches,
                modelName: 'Branch')
            ?.cast<Branch>();
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
