// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeanswest/src/bloc/branch/main/branch_addresses_screen_bloc.dart';
import 'package:jeanswest/src/bloc/branch/main/selected_branch_bloc.dart';
import 'package:jeanswest/src/bloc/branch/states/branch_addresses_screen_state.dart';
import 'package:jeanswest/src/bloc/branch/states/selected_branch_state.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/mockoonApis/rest_client_global.dart';

import 'branch_page.dart';

class InitBranchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InitBranchPageState();
}

class _InitBranchPageState extends State<InitBranchPage>
    with AutomaticKeepAliveClientMixin<InitBranchPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<BranchAddressesScreenBloc>(
          create: (BuildContext context) => BranchAddressesScreenBloc(
              BranchAddressesScreenInitial(),
              globalRestClient: globalLocator<GlobalRestClient>()),
        ),
        BlocProvider<SelectedBranchBloc>(
          create: (BuildContext context) => SelectedBranchBloc(
            SelectedBranchInitial(),
          ),
        ),
      ],
      child: BranchPage(),
    );
  }
}
