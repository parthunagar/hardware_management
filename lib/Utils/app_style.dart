import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/colors.dart';

double getHorizontalSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.width) / 375);
}

double getFontSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.width) / 375);
}

double getVerticalSize(double px) {
  return px * ((MediaQuery.of(Get.context!).size.height) / 890);
}




class ColorConstant {
  static Color primary_color = fromHex("#A0025C");
  static Color red_400 = fromHex('#e63d54');
  static Color share_back = fromHex('#EBCADD');
  static Color gray_50 = fromHex('#fafafa');
  static Color white_A700_99 = fromHex('#99ffffff');
  static Color white_A700_100 = fromHex('#FFD6D6D6');
  static Color black_900 = fromHex('#000000');
  static Color black_900_29 = fromHex('#29000000');
  static Color pink_800 = fromHex('#a1035c');
  static Color pink_300 = fromHex('#e852a6');
  static Color pink_100 = fromHex('#ff9cd4');
  static Color gray_700 = fromHex('#545454');
  static Color gray_400 = fromHex('#c2bfc7');
  static Color gray_500 = fromHex('#999ca6');
  static Color indigo_50 = fromHex('#dbdbff');
  static Color gray_701 = fromHex('#696969');
  static Color bluegray_100 = fromHex('#c9d4de');
  static Color black_900_0f = fromHex('#0f000000');
  static Color black_900_0d = fromHex('#0d000000');
  static Color gray_100 = fromHex('#f2f5f7');
  static Color bluegray_900 = fromHex('#333333');
  static Color bluegray_700 = fromHex('#3b576e');
  static Color indigo_100 = fromHex('#bdd1e3');
  static Color indigo_A400_33 = fromHex('#334f4de6');
  static Color bluegray_400 = fromHex('#888888');
  static Color bluegray_200 = fromHex('#adb5bf');
  static Color indigo_A400 = fromHex('#4f4de6');
  static Color pink_800_26 = fromHex('#26a1035c');
  static Color white_A700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

const familyMontserratBold = 'Montserrat-Bold';
const familyNotoSansBold = 'NotoSans-Bold';
const familyNotoSansSemiBold= 'NotoSans-SemiBold';
const familyNotoSansBoldItalic = 'NotoSans-BoldItalic';
const familyNotoSansItalic = 'NotoSans-Italic';
const familyNotoSansRegular = 'NotoSans-Regular';


class AppStyle {
  static TextStyle textStyleMontserratBold30 = TextStyle(color: vpnGrey, fontSize: getFontSize(40),fontFamily: familyMontserratBold);
  static TextStyle textStyleNotoSansBold = TextStyle(color: cWhite, fontSize: getFontSize(18),fontFamily: familyNotoSansBold);
  static TextStyle textStyleNotoSansBoldItalic = TextStyle(color: cWhite, fontSize: getFontSize(18),fontFamily: familyNotoSansBoldItalic);
  static TextStyle textStyleNotoSansItalic = TextStyle(color: cWhite, fontSize: getFontSize(18),fontFamily: familyNotoSansItalic);
  static TextStyle textStyleAppBar = TextStyle(color: vpnBlue, fontSize: getFontSize(18),fontFamily: familyNotoSansBold);


  static TextStyle textStyleNotoSansBoldBlue13 = TextStyle(color: vpnBlue, fontSize: getFontSize(13),fontFamily: familyNotoSansBold);
  static TextStyle textStyleNotoSansBoldGrey13 = TextStyle(color: vpnGrey, fontSize: getFontSize(13),fontFamily: familyNotoSansBold);



  static TextStyle textStyleNotoSansBoldWhite15 = TextStyle(color: cWhite, fontSize: getFontSize(15),fontFamily: familyNotoSansBold);
  static TextStyle textStyleNotoSansBoldGrey15 = TextStyle(color: vpnGrey, fontSize: getFontSize(15),fontFamily: familyNotoSansBold);

  static TextStyle textStyleNotoSansRegularGrey15 = TextStyle(color: vpnGrey, fontSize: getFontSize(13),fontFamily: familyNotoSansRegular,fontWeight: FontWeight.w600);
  static TextStyle textStyleNotoSansGreyOpacity15 = TextStyle(color: vpnGreyopacity, fontSize: getFontSize(13),fontFamily: familyNotoSansRegular,fontWeight: FontWeight.w600);
  static TextStyle textStyleNotoSansSemiBoldBlue15 = TextStyle(color: vpnBlue, fontSize: getFontSize(15),fontFamily: familyNotoSansSemiBold );
  static TextStyle textStyleNotoSansSemiBoldGrey15 = TextStyle(color: vpnGrey, fontSize: getFontSize(15),fontFamily: familyNotoSansSemiBold);

  static TextStyle textStyleNotoSansSemiBoldGrey13 = TextStyle(color: vpnGrey, fontSize: getFontSize(13),fontFamily: familyNotoSansSemiBold);
  static TextStyle textStyleNotoSansSemiBoldWhite13 = TextStyle(color: cWhite, fontSize: getFontSize(13),fontFamily: familyNotoSansSemiBold);
  static TextStyle textStyleNotoSansBoldGrey20 = TextStyle(color: vpnGrey, fontSize: getFontSize(20),fontFamily: familyNotoSansBold);


  ///ERROR TEXT MESSAGE
  static TextStyle textStyleNotoSansRegularGrey11 = TextStyle(color: vpnGrey, fontSize: getFontSize(11),fontFamily: familyNotoSansRegular);

  static TextStyle textStyleRobotoblack12 = textStyleRobotoblack12_1.copyWith(color: ColorConstant.bluegray_200, fontSize: getFontSize(12,),);
  static TextStyle textStyleRobotomedium14 = textStyleRobotoregular14_5.copyWith();
  static TextStyle textStyleRobotoregular18 = textStyleRobotoregular14_2.copyWith(fontSize: getFontSize(18,),);
  static TextStyle textStyleRobotobold14 = textStyleRobotoregular14_7.copyWith();
  static TextStyle textStyleRobotobold16 = textStyleRobotobold14_1.copyWith(fontSize: getFontSize(16,),);
  static TextStyle textStyleRobotoregular14 = textStyleRobotoregular14_1.copyWith();
  static TextStyle textStyleRobotoregular12 = textStyleRobotoregular14_2.copyWith(fontSize: getFontSize(12,),);
  static TextStyle textStyleRobotoblack14 = textStyleRobotoregular14_5.copyWith();
  static TextStyle textStyleRobotoregular10 = textStyleRobotoregular14_1.copyWith(fontSize: getFontSize(10,),);
  static TextStyle textStyleRobotoregular14_12 = textStyleRobotoregular14_2.copyWith();
  static TextStyle textStyleRobotoregular14_10 = textStyleRobotoregular14_7.copyWith();
  static TextStyle textStyleRobotoregular14_11 = textStyleRobotoregular14_4.copyWith(color: ColorConstant.white_A700,);
  static TextStyle textStyleRobotobold20 = textStyleRobotobold16_2.copyWith(fontSize: getFontSize(20,),);
  static TextStyle textStyleRobotomedium12_1 = textStyleRobotomedium10.copyWith(fontSize: getFontSize(12,),);
  static TextStyle textStyleRobotomedium12_2 = textStyleRobotomedium12.copyWith(color: ColorConstant.black_900,);
  static TextStyle textStyleRobotoblack12_2 = textStyleRobotobold12_7.copyWith();
  static TextStyle textStyleRobotoblack12_1 = textStyleRobotobold12_6.copyWith();
  static TextStyle textStyleRobotolight10 = TextStyle(color: ColorConstant.gray_701, fontSize: getFontSize(10,),);
  static TextStyle textStyleRobotomedium10_1 = textStyleRobotomedium10.copyWith(color: ColorConstant.bluegray_700,);
  static TextStyle textStyleRobotoregular22_1 = textStyleRobotoregular14_2.copyWith(fontSize: getFontSize(22,),);
  static TextStyle textStyleRobotobold12_3 = textStyleRobotobold12_7.copyWith();
  static TextStyle textStyleRobotobold16_1 = textStyleRobotobold12_7.copyWith(fontSize: getFontSize(16,),);
  static TextStyle textStyleRobotobold12_2 = textStyleRobotobold12_7.copyWith();
  static TextStyle textStyleRobotobold12_1 = textStyleRobotobold12_7.copyWith();
  static TextStyle textStyleRobotobold16_2 = textStyleRobotobold16_1.copyWith(color: ColorConstant.bluegray_900,);
  static TextStyle textStyleRobotoregular14_9 = textStyleRobotoregular14_2.copyWith();
  static TextStyle textStyleRobotobold12_7 = textStyleRobotobold12_6.copyWith(color: ColorConstant.white_A700,);
  static TextStyle textStyleRobotobold12_6 = TextStyle(color: ColorConstant.indigo_A400, fontSize: getFontSize(12,),);
  static TextStyle textStyleRobotobold12_5 = textStyleRobotoregular12_2.copyWith();
  static TextStyle textStyleRobotobold12_4 = textStyleRobotobold12_6.copyWith();
  static TextStyle textStyleRobotobold14_1 = textStyleRobotoregular14_5.copyWith();
  static TextStyle textStyleregular16 = TextStyle(color: ColorConstant.bluegray_400, fontSize: getFontSize(16,),);
  static TextStyle textStyleRobotomedium12 = textStyleRobotomedium10_1.copyWith(fontSize: getFontSize(12,),);
  static TextStyle textStyleRobotomedium10 = TextStyle(color: ColorConstant.bluegray_400, fontSize: getFontSize(10,),);
  static TextStyle textStyleRobotoregular10_1 = textStyleRobotoregular10.copyWith(color: ColorConstant.indigo_A400,);
  static TextStyle textStyleRobotoregular12_1 = textStyleRobotoregular12_2.copyWith(color: ColorConstant.gray_500,);
  static TextStyle textStyleRobotoregular12_2 = textStyleRobotoregular14_7.copyWith(fontSize: getFontSize(12,),);
  static TextStyle textStyleRobotoregular14_5 = textStyleRobotoregular14_4.copyWith(color: ColorConstant.bluegray_700,);
  static TextStyle textStyleRobotoregular18_1 = textStyleRobotoregular22.copyWith(fontSize: getFontSize(18,),);
  static TextStyle textStyleRobotoregular14_6 = textStyleRobotoregular14_4.copyWith(color: ColorConstant.bluegray_100,);
  static TextStyle textStyleRobotoregular14_7 = textStyleRobotoregular14_4.copyWith(color: ColorConstant.pink_800,);
  static TextStyle textStyleRobotoregular14_8 = textStyleRobotoregular14_4.copyWith(color: ColorConstant.red_400,);
  static TextStyle textStyleRobotoregular14_1 = textStyleRobotoregular14_4.copyWith(color: ColorConstant.gray_700,);
  static TextStyle textStyleRobotoregular22 = TextStyle(color: ColorConstant.bluegray_900, fontSize: getFontSize(22,),);
  static TextStyle textStyleRobotoregular14_2 = textStyleRobotoregular14_4.copyWith(color: ColorConstant.bluegray_900,);
  static TextStyle textStyleRobotoregular14_3 = textStyleRobotoregular14_4.copyWith();
  static TextStyle textStyleRobotoregular14_4 = TextStyle(color: ColorConstant.gray_400, fontSize: getFontSize(14,),);
}
