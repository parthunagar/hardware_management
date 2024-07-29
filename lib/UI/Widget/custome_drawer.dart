import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/UI/Screen/suggetion_api/suggetion_api_view.dart';
import 'package:vpn_scanner/Utils/app_style.dart';


class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);


  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    // logic.changeval(DrawerEnum.home);
    return Drawer(

      child: Column(
        children: [
          SizedBox(height: h * 0.04),
          CircleAvatar(backgroundImage: AssetImage(Assets.appIcon), radius: 50,),
          SizedBox(height: h * 0.04),
          Text('Admin', style: AppStyle.textStyleNotoSansRegularGrey15),
          SizedBox(height: h * 0.04),
          Column(
            children: [
              DrawerTag(
                icon: Assets.backArrow,
                bodyText: "Demo",
                onTap: () {
                  debugPrint(' =========> ON CLICK ADD MODULE <========= ');
                  Get.back();
                  Get.toNamed(AppRoutes.addModuleScreen);
                },
              ),
              SizedBox(height: h * 0.03),
              DrawerTag(
                icon: Assets.backArrow,
                bodyText: "Update View",
                onTap: () {
                  debugPrint(' =========> ON CLICK UPDATE MODULE <========= ');
                  Get.back();
                  Get.toNamed(AppRoutes.updateDynamicViewModuleScreen);
                },
              ),
              SizedBox(height: h * 0.03),
              DrawerTag(
                icon: Assets.backArrow,
                bodyText: "Upgrade Map Form",
                onTap: () {
                  debugPrint(' =========> ON CLICK DYNAMIC MAP MODULE <========= ');
                  Get.back();
                  Get.toNamed(AppRoutes.dynamicMapScreen);
                },
              ),
              SizedBox(height: h * 0.03),
              DrawerTag(
                icon: Assets.backArrow,
                bodyText: "Auto TextField",
                onTap: () {
                  //TODO: AUTO SEARCH TEXT FIELD
                  debugPrint(' =========> ON CLICK AUTO TEXT FIELD <========= ');
                  Get.back();
                  Get.toNamed(AppRoutes.autoSuggestTextField);
                },
              ),
              SizedBox(height: h * 0.03),
              DrawerTag(
                icon: Assets.backArrow,
                bodyText: "Suggest API",
                onTap: () {
                  //TODO: AUTO SEARCH TEXT FIELD
                  debugPrint(' =========> ON CLICK SUGGEST API <========= ');
                   Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SuggetionApiPage()));
                },
              ),
            ],
          ),
          // const Spacer(),
          // GestureDetector(
          //   onTap: () {},
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Logout",
          //         style: AppStyle.textStyleNotoSansBoldGrey15,
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: getVerticalSize(30))
        ],
      ),
    );
  }
}


class DrawerTag extends StatelessWidget {
  DrawerTag({
    Key? key,
    required this.icon,
    required this.bodyText,
    this.onTap
  }) : super(key: key);

  final String icon, bodyText;
  var onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () { },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: getHorizontalSize(5),
            height: getVerticalSize(25),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
          ),
          SizedBox(
            width: getHorizontalSize(20),
          ),
          Container(
            width: getHorizontalSize(20),
            height: getHorizontalSize(20),
            child: Image.asset(
                icon,
                fit: BoxFit.contain
            ),
          ),
          SizedBox(
            width: getHorizontalSize(20),
          ),
          Text(
              bodyText,
              style: AppStyle.textStyleNotoSansBoldGrey15
          ),
        ],
      ),
    );
  }
}
