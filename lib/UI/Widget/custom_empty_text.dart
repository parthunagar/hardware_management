
import 'package:flutter/material.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';

class CustomLabelWidget extends StatefulWidget {
  String? title;
  CustomLabelWidget({Key? key,this.title}) : super(key: key);

  @override
  _CustomLabelWidgetState createState() => _CustomLabelWidgetState();
}

class _CustomLabelWidgetState extends State<CustomLabelWidget> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04 ),
        child: Text(widget.title!,
        textAlign: TextAlign.center,),
      ),
    );
  }
}
