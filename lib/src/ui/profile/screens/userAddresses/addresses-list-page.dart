import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAddresses/single-address-in-list-widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAddresses/single-address-detail-widget.dart';

class AddressesListPage extends StatefulWidget {
  final String title;
  AddressesListPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _AddressesListPageState createState() => _AddressesListPageState();
}

class _AddressesListPageState extends State<AddressesListPage> {
  ScrollController scrollController;
  int selectForEdit;
  PanelState mapPanelState;
  PanelController panelController;
  bool isInitial;

  @override
  void initState() {
    scrollController = new ScrollController();
    panelController = new PanelController();
    mapPanelState = PanelState.CLOSED;
    selectForEdit = 0;
    isInitial = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    print('address length : ${userAddresses.length}');
    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: SafeArea(
          child: SlidingUpPanel(
            controller: panelController,
            minHeight: 0,
            maxHeight: _screenSize.height,
            isDraggable: false,
            panel: SingleAddressDetailWidget(
              title: 'جزئیات آدرس',
              screenSize: _screenSize,
              address: userAddresses[selectForEdit],
              indexAddress: selectForEdit,
              mapPanelState: mapPanelState,
              changeSelected: (int selected) {},
              closeEditPanel: () {
                print('closing');
                panelController.close();
              },
              // closeMapPanelState: () {
              //   // if (!mounted)
              //   setState(() {
              //     mapPanelState = PanelState.CLOSED;
              //   });
              //   print('asdsadsadasd asdasdasd');
              // },
              isInitial: isInitial,
              disableIsInitial: () => setState(() {
                isInitial = false;
                print('24165461656 asdasdasd isInitial : $isInitial');
              }),
            ),
            body: Container(
              width: _screenSize.width,
              height: _screenSize.height,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: AppBarWithBackWidget(
                        title: widget.title,
                        onTap: () => Navigator.pop(context),
                      )),
                  Container(
                    height: 5,
                    color: Colors.grey[200],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: userAddresses.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  SingleAddressInListWidget(
                                    address: userAddresses[index],
                                    indexAddress: index,
                                    selected: selectedAddress,
                                    changeSelected: (int seleted) {
                                      setState(() {
                                        selectedAddress = seleted;
                                      });
                                    },
                                    editAddress: (int seleted) {
                                      setState(() {
                                        mapPanelState = PanelState.CLOSED;
                                        selectForEdit = seleted;
                                      });
                                      panelController.open();
                                    },
                                  ),
                                  Divider(
                                    height: 0.05,
                                    thickness: 2,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 25, right: 25, bottom: 25, top: 10),
                    child: AvakatanButtonWidget(
                      backgroundColor: MAIN_BLUE_COLOR,
                      textColor: Colors.white,
                      borderColor: MAIN_BLUE_COLOR,
                      hasShadow: false,
                      title: 'افزودن آدرس جدید',
                      height: 45,
                      width: _screenSize.width,
                      icon: Icon(
                        Icons.add_location_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                      fontSize: 18,
                      radius: 4,
                      onTap: () {
                        setState(() {
                          selectedAddress = 0;
                          isInitial = true;
                          mapPanelState = PanelState.OPEN;
                        });
                        panelController.open();
                        // ! add new Address
                        print('/*/*// add new address');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
