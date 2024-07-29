import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:vpn_scanner/UI/Screen/suggest_textfield/database/databasehelper.dart';
import 'package:vpn_scanner/Utils/SqfLite/Database/Helper.dart';
///TODO : BIT BUCKET LINK : https://bitbucket.org/flutter-demo-parth/hardware_asset_management/src/master/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper helper = DatabaseHelper();

  Database? db;
  db = await helper.getDB();
  debugPrint('db : $db');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: cBlue),
      // getPages: [
      //   GetPage(name: "/", page: () => LoginScreenWidget(), binding: LoginScreenBinding()),
      // ],
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.loginScreen,
    );
  }
}



