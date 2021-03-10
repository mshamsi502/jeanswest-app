// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
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
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/ui/branch/widgets/branches_list_widget.dart';
import 'package:jeanswest/src/ui/branch/widgets/branches_map_widget.dart';
import 'package:jeanswest/src/ui/global/screens/loading_page.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/real_search_appbar_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/search_appbar_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/show_error_widget.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/utils/helper/search/helper_search.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BranchPage extends StatefulWidget {
  final String title;
  final PanelController searchPanelController;
  BranchPage({
    Key key,
    this.title,
    this.searchPanelController,
  }) : super(key: key);

  @override
  _BranchPageState createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage>
    with AutomaticKeepAliveClientMixin<BranchPage> {
  BranchAddressesScreenBloc _branchAddressesScreenBloc;
  SelectedBranchBloc _selectedBranchBloc;
  // PanelController panelController;
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
    // panelController = new PanelController();
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
            widthText: 0.75,
          );
        } else if (branchAddressesScreenState is BranchAddressesScreenSuccess) {
          return
              // Scaffold(
              //   body: WillPopScope(
              //     onWillPop: () async {
              //       if (panelController.isPanelOpen) {
              //         panelController.close();
              //         return true;
              //       } else {
              //         Navigator.pop(context);
              //         return false;
              //       }
              //     },
              //     child: Scaffold(
              //       body:
              SlidingUpPanel(
            controller: widget.searchPanelController,
            minHeight: 0,
            maxHeight: screenSize.height,
            backdropEnabled: true,
            panel: Column(
              children: [
                RealSearchAppBarWidget(
                  title: '${"branch_screen.branches_list".tr()} ...',
                  changeListPanelState: changeBranchListPanelState,
                  haveSearchInText: true,
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
                icon: GlobalSvgImages.searchIcon,
                onTapIcon: () {},
                openRealSearchPanel: changeBranchListPanelState,
              ),
              Expanded(
                child: BranchesMapWidget(
                  branches: branchAddressesScreenState.branches,
                  selectedBranch: selectedBranch,
                  isSelectedBranch: isSelectedBranch,
                ),
              ),
              SizedBox(height: BOTTOM_NAVIGATION_BAR_HEIGHT + 20),
            ]),
            // ),
            //   ),
            // ),
          );
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
    );
  }

  changeBranchListPanelState(bool opt, BuildContext context) {
    setState(() {
      if (opt) {
        changeTextFieldSearch('');
        widget.searchPanelController
            .animatePanelToPosition(1.0, duration: Duration(milliseconds: 500));
        FocusScope.of(context).requestFocus(inputNode);
      } else {
        widget.searchPanelController
            .animatePanelToPosition(0.0, duration: Duration(milliseconds: 500));
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
