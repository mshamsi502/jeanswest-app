import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
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
  PanelController editPanelController;
  PanelController mapPanelController;
  bool isInitial;

  @override
  void initState() {
    scrollController = new ScrollController();
    editPanelController = new PanelController();
    mapPanelController = new PanelController();
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
      child: WillPopScope(
        onWillPop: ()
            // => backPanelClose(
            //   // mapPanelState == PanelState.CLOSED
            //   //     ? [editPanelController]
            //   //     :
            //   [mapPanelController, editPanelController],
            //   context,
            // ),
            async {
          if (mapPanelController.isPanelOpen &&
              mapPanelState == PanelState.CLOSED)
            return await backPanelClose([mapPanelController], context);
          if (editPanelController.isPanelOpen)
            return await backPanelClose([editPanelController], context);
          if (mapPanelController.isPanelOpen &&
              mapPanelState == PanelState.OPEN)
            return await backPanelClose([mapPanelController], context);
          return false;
        },
        child: Scaffold(
          body: SafeArea(
            child: SlidingUpPanel(
              controller: editPanelController,
              minHeight: 0,
              maxHeight: _screenSize.height,
              isDraggable: false,
              panel: SingleAddressDetailWidget(
                title: 'جزئیات آدرس',
                address: userAddresses[selectForEdit],
                indexAddress: selectForEdit,
                mapPanelController: mapPanelController,
                mapPanelState: mapPanelState,
                screenSize: _screenSize,
                changeSelected: (int selected) {},
                closeEditPanel: () {
                  print('closing');
                  editPanelController.close();
                },
                // closeMapPanelState: () {
                //   // if (!mounted)
                //   setState(() {
                //     mapPanelState = PanelState.CLOSED;
                //   });
                //   print('asdsadsadasd asdasdasd');
                // },
                // isInitial: isInitial,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0078 * _screenSize.height //5,
                            ),
                        child: AppBarWithBackWidget(
                          title: widget.title,
                          onTap: () => Navigator.pop(context),
                        )),
                    Container(
                      height: 0.0138 * _screenSize.width, //5,
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
                                        editPanelController.open();
                                      },
                                    ),
                                    Divider(
                                      height: 0.0138 * _screenSize.width, //5,
                                      thickness:
                                          0.00555 * _screenSize.width, //2,
                                      color: Colors.grey[300],
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: 0.015 * _screenSize.height, //10,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 0.069 * _screenSize.width, //25,
                        right: 0.069 * _screenSize.width, //25,
                        bottom: 0.039 * _screenSize.height, //25,
                        top: 0.015 * _screenSize.height, //10,
                      ),
                      child: AvakatanButtonWidget(
                        backgroundColor: MAIN_BLUE_COLOR,
                        textColor: Colors.white,
                        borderColor: MAIN_BLUE_COLOR,
                        hasShadow: false,
                        title: 'افزودن آدرس جدید',
                        height: 0.07 * _screenSize.height, //45,
                        width: _screenSize.width,
                        icon: Icon(
                          Icons.add_location_outlined,
                          size: 0.069 * _screenSize.width, //25,
                          color: Colors.white,
                        ),
                        fontSize: 0.05 * _screenSize.width, //18,
                        radius: 0.011 * _screenSize.width, //4,
                        onTap: () {
                          setState(() {
                            selectedAddress = 0;
                            isInitial = true;
                            mapPanelState = PanelState.OPEN;
                          });
                          editPanelController.open();
                          // ! add new Address
                          print('/*/*// add new address');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 0.03125 * _screenSize.height, //20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
