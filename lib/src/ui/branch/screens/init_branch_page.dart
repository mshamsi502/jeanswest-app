import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeanswest/src/bloc/branch/main/branch_addresses_screen_bloc.dart';
import 'package:jeanswest/src/bloc/branch/states/branch_addresses_screen_state.dart';
import 'package:jeanswest/src/services/branch/rest_client_for_branches_address.dart';
import 'package:jeanswest/src/utils/service_locator.dart';

import 'branch_page.dart';

class InitBranchPage extends StatefulWidget {
  final Function(bool) changeShowButtonNavigationBar;
  const InitBranchPage({
    Key key,
    this.changeShowButtonNavigationBar,
  }) : super(key: key);
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
              restClientForBranchesAddress:
                  locator<RestClientForBranchesAddress>()),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Branch Test',
        theme: ThemeData(
          fontFamily: 'IRANSans',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BranchPage(
          changeShowButtonNavigationBar: widget.changeShowButtonNavigationBar,
        ),
      ),
    );
  }
}
