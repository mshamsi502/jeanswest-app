// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class GeoGooglePlace {
  @JsonKey(name: 'formatted_address')
  String formattedAddress;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'location')
  LatLng location;

  GeoGooglePlace({
    this.formattedAddress,
    this.name,
    this.location,
  });
}
