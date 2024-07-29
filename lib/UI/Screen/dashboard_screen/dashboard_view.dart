import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_empty_text.dart';
import 'package:vpn_scanner/UI/Widget/custom_progressbar.dart';
import 'package:vpn_scanner/UI/Widget/custome_drawer.dart';
import 'package:vpn_scanner/Utils/app_style.dart';
import 'dashboard_controller.dart';

class DashBoardScreenWidget extends GetView<DashBoardScreenLogic> {
  const DashBoardScreenWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<DashBoardScreenLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: Const.appBarTitleDashBoard,
        leading: GestureDetector(
            onTap: () {
              controller.scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
                // color: Colors.red[100],
                // height: h * 0.02,width: w * 0.01,
                padding: EdgeInsets.symmetric(vertical: h * 0.007),
                child: SvgPicture.asset(Assets.iconMenu,))),
        action: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.qrCodeScreen);
            },
            child: Image.asset(Assets.dashboardQrcode))
        ],
      ),
      key: controller.scaffoldKey,
      drawer: CustomDrawer(),

      body: controller.obx((data) =>
          AnimationLimiter(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                // Const.categoryList.length, (int index) {
                controller.moduleList.value.length, (int index) {
                // print('DashBoardScreenWidget => data : $data');
                // print("data['data'].length : ${data['data'].length}");
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    // verticalOffset: h * 0.1,
                    child: FadeInAnimation(
                      child: controller.obx((data) =>
                          Obx(() {
                            return GestureDetector(
                              onTap: () {
                                debugPrint(' ===========> ON TAP MODULE <=========== ');
                                Get.toNamed(AppRoutes.categoryListScreen,
                                    arguments: {
                                      "categoryTitle": '${Const.categoryList[index][1]}',
                                      "totalNoCategory": '${Const.categoryList[index][2]}'
                                    }
                                );
                                // print('controller.selectedIndex.value 1 : ${controller.selectedIndex.value}');
                                controller.selectedIndex.value = index;
                                // print('controller.selectedIndex.value 2 : ${controller.selectedIndex.value}');
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: w * 0.02, horizontal: w * 0.02),
                                decoration: BoxDecoration(
                                    color: cWhite,
                                    // Const.colorList[index % Const.colorList.length ],
                                    border: Border.all(color: controller.selectedIndex.value == index ? vpnBlue : vpnGreyopacity,width: 1),
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  const BoxDecoration(
                                          // color: Colors.red[100],
                                          borderRadius:  BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
                                        child: Image.asset("${Const.categoryList[index][0]}")),
                                    ),
                                    Container(
                                        // alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(color: controller.selectedIndex.value == index ? vpnGrey : vpnBlueOpacity),
                                        height: h * 0.05,
                                        padding: EdgeInsets.symmetric(vertical: w * 0.02, horizontal: w * 0.02),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Text("${Const.categoryList[index][1]}", style: controller.selectedIndex.value == index ? AppStyle.textStyleNotoSansBoldWhite15 : AppStyle.textStyleNotoSansBoldGrey15,),
                                            // Text("${Const.categoryList[index][2]}", style: controller.selectedIndex.value == index ? AppStyle.textStyleNotoSansBoldWhite15 : AppStyle.textStyleNotoSansBoldGrey15),
                                            Text("${controller.moduleList.value[index].name.toString()}", style: controller.selectedIndex.value == index ? AppStyle.textStyleNotoSansBoldWhite15 : AppStyle.textStyleNotoSansBoldGrey15,),
                                            Text("${Const.categoryList[index][2]}", style: controller.selectedIndex.value == index ? AppStyle.textStyleNotoSansBoldWhite15 : AppStyle.textStyleNotoSansBoldGrey15),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }),

                      ),
                    ),
                  ),
                );
              },
              ),
            ),
          ),
        onLoading: const CustomProgressBar(),
        onError: (e) => CustomLabelWidget(title: e),
        onEmpty: CustomLabelWidget(title: Const.lblDataNotFound),
      ),
      // body: controller.obx((data) =>
      //     AnimationLimiter(
      //       child: GridView.count(
      //         crossAxisCount: 2,
      //         children: List.generate(
      //           data['data']['memes'].length, (int index) {
      //           print('data : $data');
      //           // print("data['data'].length : ${data['data'].length}");
      //           return AnimationConfiguration.staggeredList(
      //             position: index,
      //             duration: const Duration(milliseconds: 375),
      //             child: SlideAnimation(
      //               // verticalOffset: h * 0.1,
      //               child: FadeInAnimation(
      //                 child: controller.obx((data) =>
      //                     Obx(() {
      //                       return GestureDetector(
      //                         onTap: () {
      //                           Get.toNamed(AppRoutes.categoryListScreen);
      //                           // print('controller.selectedIndex.value 1 : ${controller.selectedIndex.value}');
      //                           controller.selectedIndex.value = index;
      //                           // print('controller.selectedIndex.value 2 : ${controller.selectedIndex.value}');
      //                         },
      //                         child: Container(
      //                           margin: EdgeInsets.symmetric(vertical: w * 0.02, horizontal: w * 0.02),
      //                           decoration: BoxDecoration(
      //                               color: cWhite,
      //                               // Const.colorList[index % Const.colorList.length ],
      //                               border: Border.all(color: controller.selectedIndex.value == index ? vpnBlue : vpnGreyopacity,width: 1),
      //                               borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
      //                           child: Column(
      //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Container(
      //                                 height: h * 0.18,
      //                                 alignment: Alignment.center,
      //                                 decoration: const BoxDecoration(
      //                                   // color: Colors.red[100],
      //                                   borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
      //                                 child: Image.asset(Assets.dashboardMonitor)),
      //                               Container(
      //                                 // alignment: Alignment.bottomCenter,
      //                                 decoration: BoxDecoration(
      //                                   color: controller.selectedIndex.value == index ? vpnGrey : vpnBlueOpacity),
      //                                   height: h * 0.05,
      //                                   padding: EdgeInsets.symmetric(vertical: w * 0.02, horizontal: w * 0.02),
      //                                   child: Row(
      //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                     children: [
      //                                       Text('Monitor', style: controller.selectedIndex.value == index ? AppStyle.textStyleNotoSansBoldWhite15 : AppStyle.textStyleNotoSansBoldGrey15,),
      //                                       Text('2', style: controller.selectedIndex.value == index ? AppStyle.textStyleNotoSansBoldWhite15 : AppStyle.textStyleNotoSansBoldGrey15),
      //                                     ],
      //                                   )),
      //                             ],
      //                           ),
      //                         ),
      //                       );
      //                     }),
      //
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //         ),
      //       ),
      //     ),
      //     onLoading: const CustomProgressBar()
      // ),

    );
  }
}


