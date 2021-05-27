// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-06  ,  16:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:jeanswest/src/models/profile/message/single-message.dart';

import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';

class SingleMessagePage extends StatefulWidget {
  final String title;
  final SingleMessage message;

  const SingleMessagePage({Key key, this.message, this.title})
      : super(key: key);
  @override
  _SingleMessagePageState createState() => _SingleMessagePageState();
}

class _SingleMessagePageState extends State<SingleMessagePage> {
  ScrollController scrollController = new ScrollController();

  String categoryText;
  @override
  void initState() {
    categoryText = widget.message.perCategory.length == 1
        ? 'خرید در دسته بندی '
        : 'خرید در دسته بندی های ';
    for (int index = 0; index < widget.message.perCategory.length; index++) {
      categoryText = categoryText + widget.message.perCategory[index];
      if (index != widget.message.perCategory.length - 1)
        categoryText = categoryText + ' - ';
    }
    // widget.message.perCategory.forEach((element) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            height: _screenSize.height,
            child: Column(
              children: [
                AppBarWithCloseWidget(
                  title: widget.title,
                  closeOnTap: () => Navigator.pop(context),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          widget.message.pictureAssets,
                          width: _screenSize.width,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          height: 0.016 * _screenSize.height, //10
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.054 * _screenSize.width, //20
                            vertical: 0.023 * _screenSize.height, //15
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'مشتری عزیز ${widget.message.perSender}',
                                style: TextStyle(
                                  fontSize: 0.038 * _screenSize.width, //14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 0.0156 * _screenSize.height, //10
                              ),
                              Text(
                                widget.message.text,
                                style: TextStyle(
                                  fontSize: 0.038 * _screenSize.width, //14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 0.0156 * _screenSize.height, //10
                              ),
                              widget.message.description.length == 0
                                  ? SizedBox()
                                  : ListView.builder(
                                      itemCount:
                                          widget.message.description.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context,
                                          int conditionsIndex) {
                                        return Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(
                                                0.027 * _screenSize.width, //10,
                                              ),
                                              child: Container(
                                                width: 0.0194 *
                                                    _screenSize.width, //7,
                                                height: 0.0194 *
                                                    _screenSize.width, //7,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    0.138 *
                                                        _screenSize.width, //50,
                                                  ),
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                widget.message.description[
                                                    conditionsIndex],
                                                style: TextStyle(
                                                  fontSize: 0.038 *
                                                      _screenSize.width, //14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                              SizedBox(
                                height: 0.023 * _screenSize.height, //15
                              ),
                              widget.message.price == null ||
                                      widget.message.price == 0
                                  ? SizedBox()
                                  : Column(
                                      children: [
                                        Text(
                                          'مبلغ ${toPriceStyle(widget.message.price)} تومان',
                                          style: TextStyle(
                                            fontSize:
                                                0.038 * _screenSize.width, //14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              0.0078 * _screenSize.height, //5
                                        ),
                                      ],
                                    ),
                              widget.message.minShopping == null ||
                                      widget.message.minShopping == 0
                                  ? SizedBox()
                                  : Column(
                                      children: [
                                        Text(
                                          'قابل استفاده برای خرید های بیش از ${toPriceStyle(widget.message.minShopping)} تومان',
                                          style: TextStyle(
                                            fontSize:
                                                0.038 * _screenSize.width, //14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              0.0078 * _screenSize.height, //5
                                        ),
                                      ],
                                    ),
                              widget.message.perCategory == null ||
                                      widget.message.perCategory.length == 0
                                  ? SizedBox()
                                  : Column(
                                      children: [
                                        Text(
                                          categoryText,
                                          style: TextStyle(
                                            fontSize:
                                                0.038 * _screenSize.width, //14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              0.0078 * _screenSize.height, //5
                                        ),
                                      ],
                                    ),
                              widget.message.price == 0
                                  ? SizedBox()
                                  : Column(
                                      children: [
                                        Text(
                                          'مدت اعتبار از تاریخ ${widget.message.startShamsiYear}/${widget.message.startShamsiMonth}/${widget.message.startShamsiDay} تا تاریخ ${widget.message.endShamsiYear}/${widget.message.endShamsiMonth}/${widget.message.endShamsiDay}',
                                          style: TextStyle(
                                            fontSize:
                                                0.038 * _screenSize.width, //14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              0.0078 * _screenSize.height, //5
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
