//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class InfoWidget extends StatefulWidget {
  State<StatefulWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نام و نام خانوادگی',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              user.firstName,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 0.5,
          height: 2,
        ),
        SizedBox(height: 10),
        Text(
          'ایمیل',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              user.email,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 0.5,
          height: 2,
        ),
        SizedBox(height: 10),
        Text(
          'شماره تماس',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              user.phoneNumber,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 0.5,
          height: 2,
        ),
        SizedBox(height: 10),
        Text(
          'جنسیت',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              user.gender.perName,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 0.5,
          height: 2,
        ),
        SizedBox(height: 10),
        Text(
          'تاریخ تولد',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(width: 10),
            Text(
              '${user.yearOfBirth}/${user.monthOfBirth}/${user.dayOfBirth}',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
