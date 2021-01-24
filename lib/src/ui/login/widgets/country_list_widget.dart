import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/country/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class CountryListWidget extends StatefulWidget {
  // final List<Country> countries;
  final List<Country> countries;
  final Country selectedCountry;
  final Function(bool) changeCountryListPanelState;
  final Function(Country) changeSelectedCountry;

  const CountryListWidget({
    Key key,
    this.countries,
    this.selectedCountry,
    this.changeCountryListPanelState,
    this.changeSelectedCountry,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => CountryListWidgetState();
}

class CountryListWidgetState extends State<CountryListWidget> {
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height - 80,
      width: _screenSize.width,
      child: ListView.separated(
        controller: scrollController,
        primary: true,
        itemCount: widget.countries.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          height: 8,
          thickness: 0.2,
        ),
        itemBuilder: (BuildContext context, int i) {
          return Material(
              color: Colors.white,
              child: InkWell(
                child: ListTile(
                  title: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.countries[i].flag,
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 45,
                        alignment: Alignment.center,
                        child: Text(
                          widget.countries[i].dialCode,
                          textDirection: ltrTextDirection,
                          style: TextStyle(
                            color: MAIN_BLUE_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 25,
                        // color: Colors.grey,
                        child: VerticalDivider(
                          // color: Colors.grey,
                          color: MAIN_BLUE_COLOR,
                          thickness: 1.5,
                          indent: 0,
                          width: 1,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.countries[i].name,
                          // textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: MAIN_BLUE_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      widget.countries[i].code == widget.selectedCountry.code
                          ? GlobalSvgImages.greenTickIcon
                          : Container(),
                    ],
                  ),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    // change selected branch and true is for open info branch panel
                    widget.changeSelectedCountry(widget.countries[i]);
                    // close Branch-List-Widget Panel
                    widget.changeCountryListPanelState(false);
                  },
                ),
              ));
        },
      ),
    );
  }
}
