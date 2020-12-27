//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/bottom_navigation_bar_svg_images.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

class ContactUsWidget extends StatefulWidget {
  State<StatefulWidget> createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  GoogleMapController mapController;

  onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomNavigationBarSvgImages.enableBranchIcon,
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    'تهران - جنت آباد مرکزی - خیابان دانش - خیابان عابدی - خیابان شهید محمد نوروزی - پلاک 5',
                    style: TextStyle(color: MAIN_BLUE_COLOR, fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
              height: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.phone,
                  color: MAIN_BLUE_COLOR,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '02191070544',
                  style: TextStyle(fontSize: 12, color: MAIN_BLUE_COLOR),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.email_outlined,
                  color: MAIN_BLUE_COLOR,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'info@banimode.com',
                  style: TextStyle(fontSize: 12, color: MAIN_BLUE_COLOR),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.apartment_outlined,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '1475614566',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
              height: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalSvgImages.greyTimeIcon,
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    'میزبان صدای گرمتان هستیم... 7 روز هفته 24 ساعته',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
