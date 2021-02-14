import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAddresses/single-address-in-list-widget.dart';

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

  @override
  void initState() {
    scrollController = new ScrollController();
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
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height,
            color: Colors.white,
            child: Column(
              children: [
                AppBarWithBackWidget(title: widget.title),
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
                  padding: EdgeInsets.all(15),
                  child: AvakatanButtonWidget(
                    backgroundColor: MAIN_BLUE_COLOR,
                    textColor: Colors.white,
                    borderColor: MAIN_BLUE_COLOR,
                    hasShadow: false,
                    title: 'افزودن آدرس جدید',
                    height: 40,
                    width: _screenSize.width,
                    icon: Icon(
                      Icons.add_location_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                    fontSize: 18,
                    radius: 4,
                    onTap: () {
                      // ! add new Address
                      print('/*/*// add new address');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
