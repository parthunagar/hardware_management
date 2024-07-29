import 'package:flutter/material.dart';
import 'package:vpn_scanner/Utils/app_style.dart';

class CustomTextSpanWidget extends StatefulWidget {
  String? title,body;
  var style;
  var onTap;
  bool? showDash;
  CustomTextSpanWidget({Key? key,this.title,this.body,this.style,this.onTap,this.showDash}) : super(key: key);

  @override
  _CustomTextSpanWidgetState createState() => _CustomTextSpanWidgetState();
}

class _CustomTextSpanWidgetState extends State<CustomTextSpanWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? (){},
      child: RichText(
          text:  TextSpan(
              children: [
                TextSpan(text: widget.showDash == false ? "${widget.title}" : "${widget.title} - "  , style: AppStyle.textStyleNotoSansBoldGrey15),
                TextSpan(text: '${widget.body}', style:widget.style ?? AppStyle.textStyleNotoSansSemiBoldGrey15)
              ]
          )
      ),
    );
  }
}
