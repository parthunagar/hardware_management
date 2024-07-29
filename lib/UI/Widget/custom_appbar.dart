import 'package:flutter/material.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/Utils/app_style.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final bool? centerTitle;
  final String? titleFamily;
  final onTap;
  final icon;
  double? elevation;
  final leading;
  final List<Widget>? action;

  @override
  final Size preferredSize;

  CustomAppBar({Key? key, this.title, this.centerTitle, this.titleFamily, this.onTap, this.icon, this.elevation, this.leading, this.action})
      : preferredSize = const Size.fromHeight(56.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: cWhite,
      automaticallyImplyLeading: false,
      leading: Container(margin: EdgeInsets.only(left: w * 0.03, top: h * 0.02,bottom: h * 0.02),child: leading),
      leadingWidth: w * 0.1,
      titleSpacing: 0,//w * 0.025,
      elevation: elevation ?? 0,
      centerTitle: centerTitle ?? true,
      title: Text(title ?? '',textAlign: TextAlign.center, style: AppStyle.textStyleAppBar),
      actions: action ?? [],
      // iconTheme: IconThemeData(color: Colors.green),
    );
  }
}