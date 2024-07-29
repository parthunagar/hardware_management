
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/Utils/app_style.dart';


class TextInputFindOut extends StatelessWidget {
   TextInputFindOut({this.label, this.iconData, this.textInputType,this.onChange,this.controller, this.validator});
   String? label;
   IconData? iconData;
   TextInputType? textInputType;
   var onChange;
   var controller;
   FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final isPassword = textInputType == TextInputType.visiblePassword;
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: vpnGreyopacity, width: 2));
    final hidePasswordNotifier = ValueNotifier(true);
    return ValueListenableBuilder(
      valueListenable: hidePasswordNotifier,
      builder: (context, dynamic value, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          // maxLines: 1,
          // cursorHeight: h * 0.03,

          // textAlignVertical: TextAlignVertical.center,

          keyboardType: textInputType,
          obscureText: isPassword ? value : false,
          style: TextStyle(color: vpnGrey,
            // height: 0.7,fontSize: 15.0,
          ),
          onChanged: onChange,
          // textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            // isDense: true,
            // isCollapsed: true,
            errorMaxLines: 2,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorStyle: AppStyle.textStyleNotoSansRegularGrey11,
            contentPadding: EdgeInsets.only(top: h * 0.02),
            fillColor: cWhite,
            suffixIcon: isPassword
                ? IconButton(
                  onPressed: () => hidePasswordNotifier.value = !hidePasswordNotifier.value,
                  icon: Icon(
                     value ? Icons.visibility : Icons.visibility_off,
                     color: cGrey700,))
               : null,
            enabledBorder: outlineInputBorder,
            hintText: label,

            focusedBorder: outlineInputBorder.copyWith(borderSide: BorderSide(color: vpnGrey, width: 2)),
            hintStyle: TextStyle(color: vpnGreyopacity),
            prefixIcon: Icon(iconData, color: vpnGrey, size: 23),
          ),
        );
      },
    );
  }
}
