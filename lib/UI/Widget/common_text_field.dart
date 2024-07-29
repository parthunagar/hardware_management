
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/Utils/app_style.dart';


class CommonTextField extends StatelessWidget {
  CommonTextField({
    this.label, this.iconData, this.textInputType,this.maxLines,
    this.textInputAction,this.maxLength,this.onTap,this.readOnly,
    this.controller,
    this.validator,
    this.inputFormatters,this.onChange,this.suffixText
  });
  String? label;
  IconData? iconData;
  TextInputType? textInputType;
  int? maxLines;
  TextInputAction? textInputAction;
  int? maxLength;
  var onTap,onChange;
  bool? readOnly;
  var controller;
  String? suffixText;
  FormFieldValidator<String>? validator;
  List<TextInputFormatter>? inputFormatters;



  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    // debugPrint('CommonTextField => validator : ${validator}');
    // final isPassword = textInputType == TextInputType.visiblePassword;
    final outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        // borderSide: BorderSide(color: cGrey100!, width: 2)
        borderSide: BorderSide(color: cTransparent, width: 2)
    );
    final hidePasswordNotifier = ValueNotifier(true);
    return ValueListenableBuilder(
      valueListenable: hidePasswordNotifier,
      builder: (context, dynamic value, child) {
        return TextFormField(
          controller: controller,
          onTap: onTap,
          onChanged: onChange,
          maxLength: maxLength,
          keyboardType: textInputType,
          readOnly: readOnly ?? false,
          validator: validator,
          inputFormatters: inputFormatters,//<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          // obscureText: isPassword ? value : false,
          style: AppStyle.textStyleNotoSansRegularGrey15,//TextStyle(color: cBlack),
          maxLines: maxLines,
          textInputAction: textInputAction ?? TextInputAction.done,
          decoration: InputDecoration(
           suffixText: suffixText ,
            filled: true,
            fillColor: vpnBlueOpacity,
            errorMaxLines: 2,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorStyle: AppStyle.textStyleNotoSansRegularGrey11,
            counterText: "",
            // contentPadding: EdgeInsets.only(top: h * 0.02,left: w * 0.04,right: w * 0.04),
            // suffixIcon: isPassword
            //     ? IconButton(
            //     onPressed: () => hidePasswordNotifier.value = !hidePasswordNotifier.value,
            //     icon: Icon(
            //       value ? Icons.visibility : Icons.visibility_off,
            //       color: Colors.grey[700],))
            //     : null,
            enabledBorder: outlineInputBorder,
            hintText: label,
            focusedBorder: outlineInputBorder.copyWith(borderSide: BorderSide(color: vpnGreyopacity, width: 1)),
            hintStyle: AppStyle.textStyleNotoSansGreyOpacity15,// TextStyle(color: cGrey),
            // prefixIcon: Icon(iconData, color: Colors.pinkAccent, size: 18),
          ),
        );
      },
    );
  }
}
