// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageExapndedPanel extends StatefulWidget {
  final SingleProductInfoRes product;
  final int selectedImage;
  final Size screenSize;
  final Function(int) closePanel;
  const ImageExapndedPanel({
    Key key,
    @required this.product,
    @required this.closePanel,
    @required this.screenSize,
    @required this.selectedImage,
  }) : super(key: key);
  @override
  _ImageExapndedPanelState createState() => _ImageExapndedPanelState();
}

class _ImageExapndedPanelState extends State<ImageExapndedPanel> {
  ScrollController scrollController = new ScrollController();
  // CarouselController carouselController = CarouselController();
  ScrollController circleOptCarouselController = new ScrollController();
  ScrollController smallImagescrollController = new ScrollController();

  //
  int selectedImage;
  List<Widget> bigImageItemWidget = [];
  List<String> _imagesOfSelectedProduct;
  // PhotoViewControllerBase<PhotoViewControllerValue> photoViewController =
  //     new PhotoViewController();
  PageController pageController = new PageController();

  @override
  void initState() {
    // selectedImage = 0;
    selectedImage = widget.selectedImage;
    updateImageWidgets();
    super.initState();
  }

  updateImageWidgets({Size screenSize}) {
    setState(() {
      if (screenSize != null) changePage(selectedImage, screenSize);
      _imagesOfSelectedProduct =
          widget.product.banimodeDetails.images.thickboxDefault;
      _imagesOfSelectedProduct.forEach((image) {
        bigImageItemWidget.add(
          Container(
            width: widget.screenSize.width,
            child: PhotoView(
              // controller: photoViewController,
              imageProvider: NetworkImage(
                image ?? EMPTY_IMAGE,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (_imagesOfSelectedProduct.length !=
            widget.product.banimodeDetails.images.thickboxDefault.length ||
        _imagesOfSelectedProduct.first !=
            widget.product.banimodeDetails.images.thickboxDefault.first ||
        selectedImage != widget.selectedImage)
      updateImageWidgets(screenSize: _screenSize);

    if (selectedImage != widget.selectedImage)
      print("isDiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiif");
    return Container(
      // color: Colors.red,
      height: _screenSize.height,
      width: _screenSize.width,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: SizedBox()),
              AppBarWithCloseWidget(
                title: "",
                closeOnTap: () => widget.closePanel(selectedImage),
              ),
            ],
          ),
          Expanded(
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget
                      .product.banimodeDetails.images.thickboxDefault[index]),
                  initialScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained * 2,
                  minScale: PhotoViewComputedScale.contained,
                  // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
                );
              },
              itemCount:
                  widget.product.banimodeDetails.images.thickboxDefault.length,
              loadingBuilder: (context, event) => Center(
                child: Container(
                  width: 0.054 * _screenSize.width, //20

                  height: 0.054 * _screenSize.width, //20

                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes,
                  ),
                ),
              ),
              backgroundDecoration: BoxDecoration(),
              pageController: pageController,
              onPageChanged: (int newValue) {
                setState(() {
                  selectedImage = newValue;
                });
                smallImagescrollController.animateTo(
                  selectedImage.toDouble() *
                      (0.277 * _screenSize.width //100,

                      ),
                  duration: Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              },
            ),
          ),
          Container(
            height: 0.018 * _screenSize.height, //12

            width: _screenSize.width,
            margin: EdgeInsets.symmetric(
              vertical: 0.023 * _screenSize.height, //15
            ),
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
          Container(
            height: 0.2027 * _screenSize.height, //120,

            // color: Colors.amber,
            padding: EdgeInsets.all(
              0.0138 * _screenSize.width, //5,
            ),

            child: ListView.builder(
                itemCount: _imagesOfSelectedProduct.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                controller: smallImagescrollController,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 0.25 * _screenSize.width, //90,

                    margin: EdgeInsets.symmetric(
                      horizontal: 0.0138 * _screenSize.width, //5,
                    ),
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          0.011 * _screenSize.width, //4,
                        ),
                        border: Border.all(
                          width: 0.00555 * _screenSize.width, //2,

                          color: index == selectedImage
                              ? MAIN_BLUE_COLOR
                              : Colors.grey[400],
                        )),
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(
                          0.00277 * _screenSize.width, //1,
                        ),
                        child: Image.network(
                          _imagesOfSelectedProduct[index] ?? EMPTY_IMAGE,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      onTap: () => changePage(index, _screenSize),
                      // setState(() {
                      //       selectedImage = index;
                      //       if (selectedImage > 0)
                      //         pageController.animateToPage(
                      //           selectedImage,
                      //           duration: Duration(milliseconds: 250),
                      //           curve: Curves.linear,
                      //         );
                      //       smallImagescrollController.animateTo(
                      //         index.toDouble() *
                      //             (0.277 * _screenSize.width //100,
                      //             ),
                      //         duration: Duration(milliseconds: 250),
                      //         curve: Curves.linear,
                      //       );
                      //     })
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 0.09375 * _screenSize.height, //60,
          ),
        ],
      ),
    );
  }

  changePage(int index, Size _screenSize) {
    setState(() {
      selectedImage = index;
      if (selectedImage > 0)
        pageController.animateToPage(
          selectedImage,
          duration: Duration(milliseconds: 250),
          curve: Curves.linear,
        );
      smallImagescrollController.animateTo(
        index.toDouble() *
            (0.277 * _screenSize.width //100,
            ),
        duration: Duration(milliseconds: 250),
        curve: Curves.linear,
      );
    });
  }
}
