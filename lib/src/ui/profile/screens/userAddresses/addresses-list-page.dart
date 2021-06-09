import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';
import 'package:jeanswest/src/ui/profile/widgets/favoritesList/delete-panel-widget.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserAddressesInfo/get-user-addresses-info.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
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
  ScrollController singleChildScrollController;
  int selectForEdit;
  int selectForDelete;
  PanelState mapPanelState;
  PanelController editPanelController;
  PanelController deletePanelController;
  PanelController mapPanelController;
  Size _screenSize;
  bool wasClose = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    scrollController = new ScrollController();
    singleChildScrollController = new ScrollController();
    editPanelController = new PanelController();
    mapPanelController = new PanelController();
    deletePanelController = new PanelController();
    mapPanelState = PanelState.CLOSED;
    selectForEdit = 0;
    selectForDelete = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    print('address length : ${userAddresses.length}');
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            // if (mapPanelController.isPanelOpen &&
            //     mapPanelState ==
            //         PanelState.CLOSED) // ! is Editing and map is Open
            //   return await backPanelClose([mapPanelController], context);
            // if (editPanelController.isPanelOpen)
            //   return await backPanelClose([editPanelController], context);
            // if (mapPanelController.isPanelOpen &&
            //     mapPanelState ==
            //         PanelState.OPEN) //! is Creating and map is Open
            //   return await backPanelClose([mapPanelController], context);
            // return false;
            return await backPanelClose(
                [mapPanelController, editPanelController], context);
          },
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: true,
            body: Container(
              width: _screenSize.width,
              height: _screenSize.height,
              child: SlidingUpPanel(
                controller: deletePanelController,
                minHeight: 0,
                maxHeight: 0.3 * _screenSize.height,
                isDraggable: true,
                backdropEnabled: true,
                color: Colors.transparent,
                panel: DeletePanelWidget(
                  height: 0.3 * _screenSize.height,
                  closeDeletePanel: () => deletePanelController.close(),
                  selectedProduct: selectForDelete,
                  deleteFunction: (int selected) async {
                    bool res = await deleteUserAddresses(
                        code: userAddresses[selected].code);

                    if (res) {
                      List<AddressInfoRes> addRes = await userAddressesInfo();
                      setState(() {
                        userAddresses = addRes;
                      });
                      print('delete success');
                    } else
                      print('delete not success ');
                  },
                ),
                body: SlidingUpPanel(
                  controller: editPanelController,
                  minHeight: 0,
                  maxHeight: _screenSize.height,
                  isDraggable: false,
                  onPanelClosed: () => setState(() {
                    wasClose = false;
                  }),
                  panel: SingleAddressDetailWidget(
                    title: 'جزئیات آدرس',
                    address: userAddresses[selectForEdit],
                    updateAdresses: (List<AddressInfoRes> newAddress) =>
                        setState(() {
                      userAddresses = newAddress;
                    }),
                    indexAddress: selectForEdit,
                    mapPanelController: mapPanelController,
                    editPanelController: editPanelController,
                    wasClose: wasClose,
                    changeWasClose: (bool newWasClose) => setState(() {
                      wasClose = newWasClose;
                    }),
                    mapPanelState: mapPanelState,
                    screenSize: _screenSize,
                    closeEditPanel: () {
                      editPanelController.close();
                    },
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        SingleAddressInListWidget(
                                          address: userAddresses[index],
                                          indexAddress: index,
                                          selected: selectForEdit,
                                          editAddress: (int seleted) {
                                            setState(() {
                                              mapPanelState = PanelState.CLOSED;

                                              selectForEdit = seleted;
                                            });
                                            editPanelController.open();
                                          },
                                          deleteAddress: (int selected) {
                                            setState(() {
                                              selectForDelete = selected;
                                            });
                                            deletePanelController.open();
                                          },
                                        ),
                                        Divider(
                                          height:
                                              0.0138 * _screenSize.width, //5,
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
                                selectForEdit = 0;
                                mapPanelState = PanelState.OPEN;
                              });

                              editPanelController.open();
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
        ),
      ),
      // ),
    );
  }
}
