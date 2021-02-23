// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-favorites-info.dart';

class DeletePanelWidget extends StatefulWidget {
  final double height;
  final int selectedProduct;
  final Function() closeDeletePanel;

  const DeletePanelWidget({
    Key key,
    this.closeDeletePanel,
    this.selectedProduct,
    this.height,
  }) : super(key: key);
  @override
  _DeletePanelWidgetState createState() => _DeletePanelWidgetState();
}

class _DeletePanelWidgetState extends State<DeletePanelWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Text(
                'آیا از حذف این کالا از لیست مورد علاقه های خود اطمینان دارید؟',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvakatanButtonWidget(
                  backgroundColor: Colors.white,
                  textColor: MAIN_BLUE_COLOR,
                  borderColor: MAIN_BLUE_COLOR,
                  title: 'خیر',
                  height: 0.0625 * _screenSize.height, //40
                  width: (_screenSize.width / 2) - 30,
                  onTap: () => widget.closeDeletePanel(),
                  radius: 0.008 * _screenSize.height, //5
                  fontSize: 16,
                ),
                SizedBox(width: 15),
                AvakatanButtonWidget(
                  backgroundColor: MAIN_BLUE_COLOR,
                  textColor: Colors.white,
                  borderColor: MAIN_BLUE_COLOR,
                  title: 'بله',
                  height: 0.0625 * _screenSize.height, //40
                  width: (_screenSize.width / 2) - 30,
                  onTap: () {
                    // ! remove selected product from API
                    // *********
                    setState(() {
                      userFavorites.data.result
                          .removeAt(widget.selectedProduct);
                      userFavorites.data.total--;
                    });

                    print(
                        'product deleted : length : ${userFavorites.data.result.length}');
                    // *********
                    widget.closeDeletePanel();
                  },
                  radius: 0.008 * _screenSize.height, //5
                  fontSize: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
    //
  }
}
