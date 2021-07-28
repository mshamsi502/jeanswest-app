// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-favorites-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/models/api_response/globalRes/general_response.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFavorite/user-favorite-info-res.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserFavoritesInfo/get-user-favorites-info.dart';

import 'package:jeanswest/src/utils/helper/global/helper.dart';

class SingleProductImageInBodyWidget extends StatefulWidget {
  final List<String> images;
  final String linkProductForShare;
  final String productSKU;
  final bool isFave;
  final Function(int) changeSelectedImage;
  final Function(bool) changeFave;
  final Function() openImageExpandedPanel;
  final Size screenSize;
  final CarouselController carouselController;
  const SingleProductImageInBodyWidget({
    Key key,
    @required this.screenSize,
    @required this.images,
    @required this.linkProductForShare,
    @required this.isFave,
    @required this.changeFave,
    @required this.changeSelectedImage,
    @required this.openImageExpandedPanel,
    @required this.productSKU,
    @required this.carouselController,
  }) : super(key: key);
  @override
  _SingleProductImageInBodyWidgetState createState() =>
      _SingleProductImageInBodyWidgetState();
}

class _SingleProductImageInBodyWidgetState
    extends State<SingleProductImageInBodyWidget> {
  ScrollController scrollController = new ScrollController();
  ScrollController circleOptCarouselController = new ScrollController();
  // CarouselController carouselController = CarouselController();
  List<Widget> imageItemWidget = [];
  //
  int selectedImage = 0;
  bool tempIsFav;
  //
  List<String> _imagesOfSelectedProduct;

  @override
  void initState() {
    tempIsFav = widget.isFave;
    _imagesOfSelectedProduct = widget.images;
    updateImageWidgets();
    super.initState();
  }

  updateImageWidgets() {
    setState(() {
      imageItemWidget = [];
      _imagesOfSelectedProduct = widget.images;

      // if (selectedImage != 0) {
      //   selectedImage = 0;
      //   widget.carouselController.jumpToPage(selectedImage);
      // }
      _imagesOfSelectedProduct.forEach((image) {
        imageItemWidget.add(GestureDetector(
          child: Container(
            width: widget.screenSize.width,
            // color: Colors.amber,
            child: Image.network(
              image ?? EMPTY_IMAGE,
              fit: BoxFit.fitWidth,
            ),
          ),
          onTap: () => widget.openImageExpandedPanel(),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (_imagesOfSelectedProduct.length != widget.images.length ||
        _imagesOfSelectedProduct.first != widget.images.first)
      updateImageWidgets();
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: CarouselSlider(
                  carouselController: widget.carouselController,
                  options: CarouselOptions(
                    height: 0.72635 * _screenSize.height, //430
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      widget.changeSelectedImage(index);
                      setState(() {
                        selectedImage = index;
                      });
                    },
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 6),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: imageItemWidget,
                ),
              ),
              Positioned(
                bottom: 0.041 * _screenSize.width, //15,

                right: 0.041 * _screenSize.width, //15,

                child: GestureDetector(
                    child: Container(
                      width: 0.11666 * _screenSize.width, //42,

                      height: 0.11666 * _screenSize.width, //42,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            0.138 * _screenSize.width, //50,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.0138 * _screenSize.width, //5,

                              spreadRadius:
                                  0.0000555 * _screenSize.width, //0.02,

                              color: Colors.grey[300],
                            )
                          ]),
                      padding: EdgeInsets.all(
                        0.025 * _screenSize.width, //9,
                      ),
                      child: SvgPicture.asset(
                        tempIsFav
                            ? 'assets/images/svg_images/global/new/heart-fill.svg'
                            : 'assets/images/svg_images/global/new/heart.svg',
                        color: tempIsFav ? MAIN_BLUE_COLOR : Colors.grey,
                        width: 0.06667 * _screenSize.width, //24,

                        height: 0.06667 * _screenSize.width, //24,
                      ),
                    ),
                    onTap: () async {
                      setState(() {
                        tempIsFav = !tempIsFav;
                      });
                      GeneralRespons res =
                          await addToUserFavoriteInfo(widget.productSKU);
                      if (res != null && res.statusCode == 200) {
                        widget.changeFave(tempIsFav);
                        UserFavoriteInfoRes userFavoritesRes =
                            await userFavoritesInfo(user.tblPosCustomersID);
                        setState(() {
                          userFavorites = userFavoritesRes;
                        });
                      } else
                        setState(() {
                          tempIsFav = !tempIsFav;
                        });
                    }),
              ),
              Positioned(
                bottom: 0.1093 * _screenSize.height, //70,

                right: 0.041 * _screenSize.width, //15,

                child: GestureDetector(
                  child: Container(
                    width: 0.11666 * _screenSize.width, //42,

                    height: 0.11666 * _screenSize.width, //42,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          0.138 * _screenSize.width, //50,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0138 * _screenSize.width, //5,

                            spreadRadius: 0.0000555 * _screenSize.width, //0.02,

                            color: Colors.grey[300],
                          )
                        ]),
                    padding: EdgeInsets.all(
                      0.03 * _screenSize.width, //11
                    ),
                    child: SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-rr-share.svg',
                      color: Colors.grey,
                      width: 0.054 * _screenSize.width, //20

                      height: 0.054 * _screenSize.width, //20
                    ),
                  ),
                  onTap: () => shareATextLink(widget.linkProductForShare),
                ),
              ),
              Positioned(
                bottom: 0.023 * _screenSize.height, //15

                child: Container(
                  height: 0.018 * _screenSize.height, //12

                  width: _screenSize.width,
                  // color: Colors.red,
                  alignment: Alignment.center,
                  child: ListView.builder(
                      itemCount: _imagesOfSelectedProduct.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      controller: circleOptCarouselController,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: selectedImage == index
                              ? 0.022 * _screenSize.width //8

                              : selectedImage - index == 1 ||
                                      index - selectedImage == 1
                                  ? 0.01527 * _screenSize.width //5.5

                                  : 0.011 * _screenSize.width, //4,

                          height: selectedImage == index
                              ? 0.0125 * _screenSize.height //8,

                              : selectedImage - index == 1 ||
                                      index - selectedImage == 1
                                  ? 0.00859 * _screenSize.height //5.5,

                                  : 0.00625 * _screenSize.height, //4,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              0.138 * _screenSize.width, //50,
                            ),
                            color: selectedImage == index
                                ? Colors.grey[700]
                                : selectedImage - index == 1 ||
                                        index - selectedImage == 1
                                    ? Colors.black26
                                    : Colors.black12,
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 0.009722 * _screenSize.width, //3.5,

                              vertical: selectedImage == index
                                  ? 0.003125 * _screenSize.height //2,

                                  : selectedImage - index == 1 ||
                                          index - selectedImage == 1
                                      ? 0.005078 * _screenSize.height //3.25,

                                      : 0.00625 * _screenSize.height //4,

                              ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
