import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vpn_scanner/Constant/colors.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    //primarySwatch: createMaterialColor(colorPrimary),
    // colorScheme: ColorScheme(
    //   primary: primaryColor,
    //   primaryVariant: createMaterialColor(primaryColor),
    //   secondary: secondaryColor,
    //   secondaryVariant: createMaterialColor(secondaryColor),
    //   surface: Colors.white,
    //   background: Colors.white,
    //   error: Colors.red,
    //   onPrimary: Colors.white,
    //   onSecondary: Colors.white,
    //   onSurface: Colors.white,
    //   onBackground: Colors.black,
    //   onError: Colors.redAccent,
    //   brightness: Brightness.light,
    // ),
    scaffoldBackgroundColor: cWhite,//TODO : CHANGE PRIMARY COLOR
    // scaffoldBackgroundColor:  Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: vpnGrey),
    textTheme: const TextTheme(headline6: TextStyle()),
    // dialogBackgroundColor: Colors.white,
    // unselectedWidgetColor: Colors.black,
    // dividerColor: viewLineColor,
    cardColor: cWhite,
    // dialogTheme: DialogTheme(shape: dialogShape()),
    appBarTheme: const AppBarTheme(
      brightness: Brightness.light,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    // checkboxTheme: CheckboxThemeData(
    //   fillColor: MaterialStateProperty.all(primaryColor),
    //   overlayColor: MaterialStateProperty.all(Color(0xFF5D5F6E)),
    // ),
    // radioTheme: RadioThemeData(
    //   fillColor: MaterialStateProperty.all(primaryColor),
    //   overlayColor: MaterialStateProperty.all(Color(0xFF5D5F6E)),
    // ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  // static final ThemeData darkTheme = ThemeData(
  //   // primarySwatch: createMaterialColor(colorPrimary),
  //   colorScheme: ColorScheme(
  //     primary: Colors.white,
  //     primaryVariant: createMaterialColor(Colors.white),
  //     secondary: Colors.white,
  //     secondaryVariant: createMaterialColor(Colors.white),
  //     surface: scaffoldColorDark,
  //     background: scaffoldColorDark,
  //     error: Colors.red,
  //     onPrimary: Colors.white,
  //     onSecondary: Colors.white,
  //     onSurface: Colors.white,
  //     onBackground: Colors.black,
  //     onError: Colors.redAccent,
  //     brightness: Brightness.light,
  //   ),
  //   primaryColor: primaryColor,
  //   scaffoldBackgroundColor: scaffoldColorDark,
  //   fontFamily: GoogleFonts.poppins().fontFamily,
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: scaffoldSecondaryDark),
  //   iconTheme: IconThemeData(color: Colors.white),
  //   textTheme: TextTheme(headline6: TextStyle(color: textSecondaryColor)),
  //   dialogBackgroundColor: scaffoldSecondaryDark,
  //   unselectedWidgetColor: Colors.white60,
  //   dividerColor: Colors.white12,
  //   cardColor: scaffoldSecondaryDark,
  //
  //   dialogTheme: DialogTheme(shape: dialogShape()),
  //   checkboxTheme: CheckboxThemeData(
  //     fillColor: MaterialStateProperty.all(Colors.white),
  //     checkColor: MaterialStateProperty.all(Colors.black),
  //     overlayColor: MaterialStateProperty.all(Color(0xFF5D5F6E)),
  //   ),
  //   radioTheme: RadioThemeData(
  //     fillColor: MaterialStateProperty.all(Colors.white),
  //     overlayColor: MaterialStateProperty.all(Color(0xFF5D5F6E)),
  //   ),
  //
  //   appBarTheme: AppBarTheme(
  //     brightness: Brightness.dark,
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       statusBarIconBrightness: Brightness.light,
  //       statusBarBrightness: Brightness.dark,
  //     ),
  //   ),
  // ).copyWith(
  //   pageTransitionsTheme: PageTransitionsTheme(
  //     builders: <TargetPlatform, PageTransitionsBuilder>{
  //       TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
  //       TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
  //       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  //     },
  //   ),
  // );
}
