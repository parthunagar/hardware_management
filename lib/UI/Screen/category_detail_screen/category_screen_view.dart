import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_progressbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_textspan.dart';
import 'package:vpn_scanner/Utils/app_style.dart';

import 'category_screen_controller.dart';

class CategoryDetailScreenWidget extends GetView<CategoryDetailScreenLogic> {
  const CategoryDetailScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<CategoryDetailScreenLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(title: const Text(Const.appBarTitleDetail)),
      appBar: CustomAppBar(
        title: '${controller.categoryTitle!.value} '+Const.appBarTitleDetail,
        // title: Const.appBarTitleDetail,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.backArrow)),
      ),
      body: controller.obx((data) =>
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: w * 0.04, horizontal: w * 0.04),
              child:
                controller.categoryTitle!.value == Const.ctPC ?
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextSpanWidget(title: Const.lblHardwareId, body: 'PC-1'),
                  SizedBox(height: h * 0.02),
                  // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'HP ZZ1Q23'),
                  CustomTextSpanWidget(title: Const.lblCompanyName, body: 'HP'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblModelNo, body: 'ZZ1Q23'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblHardDiskDetails, body: '240GB SSD 500GB HDD'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblRAMDetails, body: '8 GB DDR'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblProcessorAndOS, body: 'i3 Mac'),
                  SizedBox(height: h * 0.02),
                  // CustomTextSpanWidget(title: 'Cables', body: '1.  3 Pi power cable of PC 2. 3 Pin power cable for Monitor 3.HDMI Cable'),
                  CustomTextSpanWidget(title: 'Cables :', body: '',showDash: false),
                  CustomTextSpanWidget(title: '1. 3 Pin power cable of PC', body: '',showDash: false),
                  CustomTextSpanWidget(title: '2. 3 Pin power cable for Monitor', body: '',showDash: false),
                  CustomTextSpanWidget(title: '3. HDMI Cable', body: '',showDash: false),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblKeyboardDetails, body: 'KB-15'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblMouseDetails, body: 'MU-18'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblMonitorDetails, body: 'MT-5 & MT 9 (If dual screen)'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblHeadPhoneDetailsOptional, body: 'HP-2'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblCurrentUserName, body: 'Shailesh'),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblOthers, body: 'Wifi Device, or other details '),
                  SizedBox(height: h * 0.02),
                  CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                ],
              )

                : controller.categoryTitle!.value == Const.ctCPU ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'CPU-1'),
                   SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'Dell CPU23Q/2'),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Dell'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'CPU23Q/2'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hHardDiskTypeWithoutAsterisk, body: 'HDD'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hHardDiskSizeWithoutAsterisk, body: '1 TB'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hRamTypeWithoutAsterisk, body: 'DDR2'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hRamSizeWithoutAsterisk, body: '4 GB'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblProcessor, body: 'i3'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : controller.categoryTitle!.value == Const.ctHardDisk ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'HD-1'),
                   SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'Toshiba 1'),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Toshiba'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'hjr45'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2HD11AA/2HD15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hType, body: 'HDD'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.txtLblSize, body: '1 GB'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : controller.categoryTitle!.value == Const.ctMobileDevices ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'MO-1'),
                   SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'Samsung A21s'),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Samsung'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'A21s'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2HD11AA/2HD15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hRamSizeWithoutAsterisk, body: '4 GB'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hType, body: 'Android'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : controller.categoryTitle!.value == Const.ctMonitors ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'MT-1'),
                   SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'HP ZZ1Q23'),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'HP'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'ZZ1Q23'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hType, body: 'LCD'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.txtLblSize, body: '29 inch'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : controller.categoryTitle!.value == Const.ctKeyBoards ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'KB-1'),
                   SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'Logitech 1'),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Logitech'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'kebq2'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : controller.categoryTitle!.value == Const.ctMouses ?
                Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 CustomTextSpanWidget(title: Const.lblHardwareId, body: 'MU-1'),
                 SizedBox(height: h * 0.02),
                 // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'Dell 1'),
                 CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Dell'),
                 SizedBox(height: h * 0.02),
                 CustomTextSpanWidget(title: Const.lblModelNo, body: 'dl23'),
                 SizedBox(height: h * 0.02),
                 CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                 SizedBox(height: h * 0.02),
                 CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                 SizedBox(height: h * 0.02),
                 CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                 SizedBox(height: h * 0.02),
                 CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                 SizedBox(height: h * 0.02),
                 CustomTextSpanWidget(title: Const.lblHistory, body: ''),
               ],
             )

                : controller.categoryTitle!.value == Const.ctCCTV ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'CC-1'),
                   SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'Eye Spy 1'),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Eye Spy'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'Mas23'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPixel, body: '1080p'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : controller.categoryTitle!.value == Const.ctHeadphones ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'Hp-1'),
                   SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'Sony 1'),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Sony'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'sh450/we'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : controller.categoryTitle!.value == Const.ctPrinters ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'Pr-1'),
                   SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'HP Laserjet Pro M1136 - 1'),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'HP'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'Laserjet Pro M1136 - 1'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : controller.categoryTitle!.value == Const.ctSeller ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hShopNameWithoutAsterisk, body: 'HP/CPS Branch'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: 'Contact No. :', body: '',showDash: false),
                   CustomTextSpanWidget(title: '1. 9834567843', body: '',showDash: false,),
                   CustomTextSpanWidget(title: '2. 8789566745', body: '',showDash: false),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hShopAddressWithoutAsterisk, body: 'A-105, Public Archade, Opp. Private Archade, Dabholi road, Katargam, Surat.'),

                 ],
           )

                : controller.categoryTitle!.value == Const.ctLaptops ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'LP-1'),
                   SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'Dell Lp23Q/2'),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Dell'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'Lp23Q/2'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hHardDiskTypeWithoutAsterisk, body: 'HDD'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hHardDiskSizeWithoutAsterisk, body: '1 TB'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hRamTypeWithoutAsterisk, body: 'DDR2'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.hRamSizeWithoutAsterisk, body: '4 GB'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblProcessor, body: 'i3'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : controller.categoryTitle!.value == Const.ctDeadStock ?
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextSpanWidget(title: Const.lblHardwareId, body: 'LP-1'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblCompanyName, body: 'HP'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblModelNo, body: 'Lp23Q/2'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblDeadStockDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblLastUserName, body: 'Parth Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '01-01-2022'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblSellerName, body: 'S.S.Patel'),
                   SizedBox(height: h * 0.02),
                   CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Guarantee'),
                   // SizedBox(height: h * 0.02),
                   // CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                 ],
               )

                : const SizedBox()
             // Column(
             //    crossAxisAlignment: CrossAxisAlignment.start,
             //    children: [
             //      CustomTextSpanWidget(title: Const.lblHardwareId, body: 'MT-1'),
             //      SizedBox(height: h * 0.02),
             //      // CustomTextSpanWidget(title: 'Company name and Model No. Id', body: 'HP 22yh'),
             //      CustomTextSpanWidget(title: Const.lblCompanyName, body: 'HP'),
             //      SizedBox(height: h * 0.02),
             //      CustomTextSpanWidget(title: Const.lblModelNo, body: '22yh'),
             //      SizedBox(height: h * 0.02),
             //      CustomTextSpanWidget(title: Const.lblSerialNo, body: '2QU11AA/2QU15AA'),
             //      SizedBox(height: h * 0.02),
             //      CustomTextSpanWidget(title: Const.hType, body: 'HD'),
             //      SizedBox(height: h * 0.02),
             //      CustomTextSpanWidget(title: Const.txtLblSize, body: '24 inch'),
             //      SizedBox(height: h * 0.02),
             //      CustomTextSpanWidget(title: Const.lblPurchaseDate, body: '10/08/2021'),
             //      SizedBox(height: h * 0.02),
             //      CustomTextSpanWidget(title: Const.lblSellerName, body: 'ABC'),
             //      SizedBox(height: h * 0.02),
             //      CustomTextSpanWidget(title: Const.lblGW, body: '1 year'),
             //      SizedBox(height: h * 0.02),
             //      CustomTextSpanWidget(title: Const.lblHistory, body: 'Xyz'),
             //      SizedBox(height: h * 0.02),
             //    ],
             //  ),
            ),
          ),
          onLoading: const CustomProgressBar()

      ),
    );
  }
}
