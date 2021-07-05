import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
// import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/geoPlace/geo-google-place.dart';
// import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';
import 'package:search_map_place/search_map_place.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchPlaceBarWidget extends StatefulWidget {
  final PanelController mapPanelController;
  // final bool isActive;
  final bool isShowingSearchResult;
  final Function(bool) updateMapIsOpen;
  final Function(LatLng) updateMap;
  final Function(bool) changeShowingSearchResult;
  final Function() closeMapPanel;

  const SearchPlaceBarWidget({
    Key key,
    @required this.updateMap,
    @required this.mapPanelController,
    @required this.updateMapIsOpen,
    @required this.changeShowingSearchResult,
    // this.isActive,
    this.isShowingSearchResult,
    this.closeMapPanel,
  }) : super(key: key);
  @override
  _SearchPlaceBarWidgetState createState() => _SearchPlaceBarWidgetState();
}

class _SearchPlaceBarWidgetState extends State<SearchPlaceBarWidget> {
  TextEditingController searchTextEditingController;
  bool saerchBarIsActive;
  List<GeoGooglePlace> resultPlaces = [];

  @override
  void initState() {
    saerchBarIsActive = false;
    searchTextEditingController = TextEditingController();
    searchTextEditingController.addListener(
      () {
        // print("search : ${searchTextEditingController.text}");
        searchPlace(context, searchTextEditingController.text).then(
          (value) => setState(() {
            resultPlaces = value;
          }),
        );
        print("resultPlaces length : ${resultPlaces.length}");
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var _screenSize = MediaQuery.of(context).size;
    return
        // ! 111111111111111111111111111

        //     Container(
        //   color: Colors.white,
        //   // height: 100,
        //   width: _screenSize.width,
        //   height: 60,
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     // mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           Expanded(
        //             child: GestureDetector(
        //               onTap: () {
        //                 if (widget.isShowingSearchResult) {
        //                   widget.changeShowingSearchResult(false);
        //                   FocusScope.of(context).unfocus();
        //                   setState(() {
        //                     saerchBarIsActive = false;
        //                     resultPlaces = [];
        //                   });
        //                 } else
        //                   widget.closeMapPanel();
        //               },
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.only(
        //                     bottomRight: Radius.circular(10),
        //                     topRight: Radius.circular(10),
        //                   ),
        //                   color: F2_BACKGROUND_COLOR,
        //                 ),
        //                 width: 40,
        //                 margin: EdgeInsets.only(
        //                   right: 15,
        //                   bottom: 5,
        //                   top: 5,
        //                 ),
        //                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        //                 child: GlobalSvgImages.rightIcon,
        //               ),
        //             ),
        //           ),
        //           // ),
        //         ],
        //       ),
        //       Container(
        //         child: GestureDetector(
        //           onTap: () {
        //             setState(() {
        //               saerchBarIsActive = true;
        //             });
        //             widget.changeShowingSearchResult(true);
        //           },
        //           child: CustomTextFieldWidget(
        //             textEditingController: searchTextEditingController,
        //             title: "",
        //             titleColor: Colors.black,
        //             lines: 1,
        //             initText: "",
        //             textColor: Colors.black,
        //             hintTextColor: Colors.grey[300],
        //             mediaQuery: MediaQuery.of(context),
        //             width: MediaQuery.of(context).size.width - 55,
        //             isEnable: saerchBarIsActive,
        //             customPadding: EdgeInsets.only(left: 10),
        //             internalIcon: Container(
        //               padding: EdgeInsets.only(left: 10),
        //               child: saerchBarIsActive
        //                   ? GestureDetector(
        //                       onTap: () {
        //                         searchTextEditingController.clear();
        //                         resultPlaces = [];
        //                       },
        //                       child: Container(
        //                         padding: EdgeInsets.all(2),
        //                         decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           borderRadius: BorderRadius.circular(50),
        //                         ),
        //                         child: Icon(
        //                           Icons.close,
        //                           size: 18,
        //                         ),
        //                       ))
        //                   : Icon(
        //                       Icons.search,
        //                       size: 20,
        //                     ),
        //             ),
        //             hasValidation: false,
        //             isValid: true,
        //             validationError: "",
        //           ),
        //         ),
        //       ),

        // ! 111111111111111111111111111

// ! 222222222222222222222222222
        SearchMapPlaceWidget(
            hasClearButton: true,
            placeType: PlaceType.address,
            language: 'fa',
            placeholder: 'محل مورد نظرتان کجاست ؟',
            apiKey: dotenv.env['SEARCH_MAP_PLACE_API'],
            iconColor: MAIN_BLUE_COLOR,
            onSelected: (Place place) {
              place.geolocation.then((newGeolocation) async {
                LatLng newLatLng = newGeolocation.coordinates;
                getAddressFromLatLng(
                  context,
                  newLatLng.latitude,
                  newLatLng.longitude,
                );
                widget.updateMap(newLatLng);
              });
            });
  }

// ! 222222222222222222222222222
  getAddressFromLatLng(context, double lat, double lng) async {
    String _host = dotenv.env['GEOCODE_GOOGLE_API'];
    String apiKey = dotenv.env['GOOGLE_MAP_API'];
    String language = 'fa-IR';
    print(apiKey);
    final url = '$_host?key=$apiKey&language=$language&latlng=$lat,$lng';
    if (lat != null && lng != null) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String _formattedAddress = data["results"][0]["formatted_address"];
        print("response ==== $_formattedAddress");
        return _formattedAddress;
      } else
        return null;
    } else
      return null;
  }
  // ! 222222222222222222222222222
// ! 111111111111111111111111111

  Future<List<GeoGooglePlace>> searchPlace(context, String input) async {
    String _host = dotenv.env['SEARCH_PLACE_GOOGLE_API'];
    String apiKey = dotenv.env['SEARCH_MAP_PLACE_API'];
    String language = 'fa-IR';
    double latCenterIran = 33.210115;
    double lngCenterIran = 54.271766;
    double circleAreaIran = 1500000;
    String fields = "formatted_address,name,geometry";
    print(apiKey);
    final url =
        "$_host/json?input=$input&inputtype=textquery&fields=$fields&language:$language&locationbias=circle:$circleAreaIran@$latCenterIran,$lngCenterIran&key=$apiKey";
    if (input != null) {
      // print("input is not null");
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print("response is 200");
        Map data = jsonDecode(response.body);
        List<GeoGooglePlace> places = [];
        data["candidates"].forEach((element) {
          print("element ==== $element");
          places.add(GeoGooglePlace(
            formattedAddress: element["formatted_address"],
            name: element["name"],
            location: LatLng(element["geometry"]["location"]["lat"],
                element["geometry"]["location"]["lng"]),
          ));
        });
        // print("response.body ==== ${response.body}");
        // print("_formattedAllAddress ==== $_formattedAllAddress");
        // print("places ==== $places");
        // print("places ==== ${places.length}");
        return places;
      } else {
        print("response is NOT 200 : ${response.statusCode}");
        // printErrorMessage(response.statusCode);
        return null;
      }
    } else
      return null;
  }
  // ! 111111111111111111111111111
}
