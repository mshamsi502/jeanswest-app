//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/constants/test_data/department.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_dropdown_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';

class SendNewTicketWidget extends StatefulWidget {
  final Size screenSize;
  final Function() closePanel;
  final Function(String, String, String) sendMessage;

  const SendNewTicketWidget({
    Key key,
    this.closePanel,
    this.sendMessage,
    this.screenSize,
  }) : super(key: key);
  State<StatefulWidget> createState() => _SendNewTicketWidgetState();
}

class _SendNewTicketWidgetState extends State<SendNewTicketWidget> {
  TextEditingController titleEditingController;
  TextEditingController textEditingController;
  String selectedDep;
  int initSelectDep;
  @override
  void initState() {
    titleEditingController = new TextEditingController();
    textEditingController = new TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ارسال پیام'),
              GestureDetector(
                child: Container(
                  width: 30,
                  height: 30,
                  child: GlobalSvgImages.closeIcon,
                ),
                onTap: () => widget.closePanel(),
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomDropdownButtonWidget(
              title: 'دپارتمان',
              options: departments,
              screenSize: widget.screenSize,
              selected: (String department) => setState(() {
                    selectedDep = department;
                  })),
          SizedBox(height: 10),
          CustomTextFieldWidget(
            title: 'عنوان',
            textEditingController: titleEditingController,
          ),
          SizedBox(height: 10),
          CustomTextFieldWidget(
            title: 'متن',
            textEditingController: textEditingController,
            lines: 4,
          ),
          SizedBox(height: 20),
          AvakatanButtonWidget(
            title: 'ثبت پیام',
            backgroundColor: MAIN_BLUE_COLOR,
            textColor: Colors.white,
            borderColor: MAIN_BLUE_COLOR,
            height: 40,
            width: widget.screenSize.width - 70,
            radius: 4,
            fontSize: 15,
            onTap: () async {
              if (selectedDep != null) {
                widget.sendMessage(selectedDep, titleEditingController.text,
                    textEditingController.text);
                widget.closePanel();
                titleEditingController.clear();
                textEditingController.clear();
                FocusScope.of(context).unfocus();
              }
            },
          ),
        ],
      ),
    );
  }
}
