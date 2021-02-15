import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/address/address.dart';
//
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_dropdown_button_widget.dart';

class SingleAddressDetailWidget extends StatefulWidget {
  final String title;
  final Address address;
  final int indexAddress;
  final PanelState mapPanelState;
  final Function(int) changeSelected;
  final Function() closeEditPanel;
  SingleAddressDetailWidget({
    Key key,
    this.address,
    this.indexAddress,
    this.changeSelected,
    this.mapPanelState,
    this.title,
    this.closeEditPanel,
  }) : super(key: key);

  @override
  _SingleAddressDetailWidgetState createState() =>
      _SingleAddressDetailWidgetState();
}

class _SingleAddressDetailWidgetState extends State<SingleAddressDetailWidget> {
  ScrollController scrollController;
  PanelController panelController;
  //
  String selectedProvince;
  bool isInitial;
  List<String> availableCities;

  //
  List<String> provinces = [
    "تهران",
    "شیراز",
    "اصفهان",
  ];
  List<String> tehranCities = [
    "تهران",
    "ورامین",
    "رباط کریم",
    "شهر ری",
  ];
  List<String> shirazCities = [
    "شیراز",
    "جهرم",
    "لار",
    "اوز",
  ];
  List<String> esfahanCities = [
    "اصفهان",
    "نجف آباد",
    "شاهین شهر",
    "کاشان",
  ];
  Map<String, List<String>> provinceCities;

  //

  @override
  void initState() {
    scrollController = new ScrollController();
    panelController = new PanelController();
    isInitial = true;
    selectedProvince = widget.address.province ?? "انتخاب استان ...";
    //
    provinceCities = {
      provinces[0]: tehranCities,
      provinces[1]: shirazCities,
      provinces[2]: esfahanCities,
    };
    availableCities = tehranCities;
    print('availableCities : ${availableCities.length}');
    print('availableCities : ${availableCities[0]}, ${availableCities[1]}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (isInitial && widget.mapPanelState == PanelState.OPEN) {
      panelController.open();
      setState(() {
        isInitial = false;
      });
    }
    print('selectedProvince : $selectedProvince');
    return Container(
      child: SlidingUpPanel(
        defaultPanelState: widget.mapPanelState,
        controller: panelController,
        minHeight: 0,
        maxHeight: _screenSize.height,
        backdropEnabled: true,
        panel: Container(
          color: Colors.blue,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: AppBarWithBackWidget(
                title: widget.title,
                onTap: () => widget.closeEditPanel(),
              ),
            ),
            Container(
              height: 3,
              color: Colors.grey[200],
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 500,
                      width: _screenSize.width,
                      color: Colors.amberAccent,
                      child: Column(
                        children: [
                          Container(
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(5)),
                              border: Border.all(
                                color: MAIN_BLUE_COLOR,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomDropdownButtonWidget(
                            title: 'استان *',
                            hintTitle: selectedProvince,
                            options: provinces,
                            mediaQuery: MediaQuery.of(context),
                            selected: (String _selectedProvince) => setState(
                              () {
                                selectedProvince = _selectedProvince;
                                availableCities =
                                    provinceCities[selectedProvince];
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomDropdownButtonWidget(
                            title: 'شهر *',
                            hintTitle:
                                widget.address.province ?? "انتخاب استان ...",
                            options: availableCities,
                            mediaQuery: MediaQuery.of(context),
                            selected: (String _selectedGender) => setState(
                              () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: AvakatanButtonWidget(
                        backgroundColor: MAIN_BLUE_COLOR,
                        textColor: Colors.white,
                        borderColor: MAIN_BLUE_COLOR,
                        hasShadow: false,
                        title: 'ثبت آدرس',
                        height: 40,
                        width: _screenSize.width,
                        fontSize: 18,
                        radius: 4,
                        onTap: () {
                          panelController.open();
                          // ! add new Address
                          print('/*/*// add new address');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
