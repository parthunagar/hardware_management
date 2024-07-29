import 'package:flutter/material.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/Utils/app_style.dart';

class CustomButton extends StatefulWidget {
  String? title;
  Color? backgroundColor;
  Color? primary;
  var onPressed;
  CustomButton({Key? key,this.title,this.backgroundColor,this.primary,this.onPressed}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w * 0.65,
      child: TextButton(
          onPressed: widget.onPressed ?? () {
            debugPrint(' ======> ON CLICK TEXT BUTTON <====== ');
            // resizeNotifier.value = false;
            // Get.offNamed(AppRoutes.dashBoardScreen);
          },
          style: TextButton.styleFrom(
              primary: widget.primary ?? cWhite,
              padding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: widget.backgroundColor ?? vpnGrey),
          child: Text(widget.title!, style: AppStyle.textStyleNotoSansBold)),
    );
  }
}


