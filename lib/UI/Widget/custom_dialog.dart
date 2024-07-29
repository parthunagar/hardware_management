
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';

///DATE PICKER

Future datePickerDialog(BuildContext context) async {
 return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // firstDate: DateTime(2019, 1),
      // lastDate: DateTime(2021,12),
      firstDate: DateTime(2000),
      lastDate: DateTime(3040),
      builder: (context,picker){
        return Theme(
          data: ThemeData.dark().copyWith(
              colorScheme:  ColorScheme.dark(
                  primary: vpnGrey,
                  onPrimary: vpnBlue,
                  surface: vpnBlueOpacity,
                  onSurface: vpnGrey),
              dialogBackgroundColor: cWhite),
          child: picker!,);
      });
  //    .then((selectedDate) {
  //   if(selectedDate!=null) {
  //     print('selectedDate : $selectedDate');
  //     String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
  //     print('formattedDate : $formattedDate');
  //   }
  // });
}

YYDialog dialogWithDivider(
    BuildContext c,
    String header,
    String btn1Title,
    String btn2Title,
    dynamic onTapCancel,
    dynamic onTapDelete) {
  var h = MediaQuery.of(c).size.height;
  var w = MediaQuery.of(c).size.width;
  return YYDialog().build(c)
    ..width = w * 0.9
    // ..height = h * 0.5
    ..borderRadius = 4.0
    ..borderRadius = 10.0
    ..widget(
      Padding(
        padding: const EdgeInsets.only(top: 21),
        child: Image.asset(Assets.categoryDelete, color: vpnRed, height: h * 0.05, fit: BoxFit.contain)))
  // ..widget(Icon(FontAwesome.))
    ..text(
      padding: const EdgeInsets.all(25.0),
      alignment: Alignment.center,
      text: header,
      color: vpnGrey,
      fontSize: 14.0,
      fontWeight: FontWeight.w500)
    // ..divider()
    ..doubleButton(
      padding: const EdgeInsets.only(top: 10.0),
      gravity: Gravity.center,
      // withDivider: true,
      text1: btn1Title,
      color1: vpnGrey,
      fontSize1: 14.0,
      fontWeight1: FontWeight.bold,
      onTap1: onTapCancel,
      text2: btn2Title,
      color2: vpnRed,
      fontSize2: 14.0,
      fontWeight2: FontWeight.bold,
      onTap2: onTapDelete)
    ..duration = const Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(child: child, scale: Tween(begin: 0.0, end: 1.0).animate(animation));
    }
    ..show();
}