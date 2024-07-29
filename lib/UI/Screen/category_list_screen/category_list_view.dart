import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_dialog.dart';
import 'package:vpn_scanner/UI/Widget/custom_progressbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_textspan.dart';
import 'package:vpn_scanner/UI/Widget/text_button.dart';
import 'package:vpn_scanner/UI/Widget/text_input_filed.dart';
import 'package:vpn_scanner/Utils/app_style.dart';

import 'category_list_controller.dart';

class CategoryListWidget extends GetView<CategoryListLogic> {
  const CategoryListWidget({Key? key}) : super(key: key);

  void _showBottomSheet(BuildContext c, var h, var w) {
    showModalBottomSheet(
      context: c,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return controller.obx((data) =>
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 0.75,
              builder: (_, controller1) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  decoration: BoxDecoration(color: cWhite, borderRadius: const BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        controller: controller1,
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: h * 0.08,),
                            Text(Const.hType, style: AppStyle.textStyleNotoSansBoldGrey20),
                            SizedBox(height: h * 0.01),
                            Container(
                              height: h * 0.07,
                              padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.01),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                controller: controller1,
                                itemCount: Const.monitorTypeList.length,
                                itemBuilder: (_, index) {
                                  return Obx(() {
                                    return Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              controller.selectedTypeIndex.value = index;
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                                                decoration: BoxDecoration(
                                                    color: controller.selectedTypeIndex.value == index ? vpnGrey : vpnBlueOpacity,
                                                    border: Border.all(color: controller.selectedTypeIndex.value == index ? vpnGrey : vpnBlue),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Text("${Const.monitorTypeList[index]}",
                                                    style: controller.selectedTypeIndex.value == index
                                                        ? AppStyle.textStyleNotoSansSemiBoldWhite13
                                                        : AppStyle.textStyleNotoSansSemiBoldGrey13))),
                                        SizedBox(width: w * 0.02)
                                      ],
                                    );
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            Text(Const.txtLblSize, style: AppStyle.textStyleNotoSansBoldGrey20),
                            SizedBox(height: h * 0.01),
                            Container(
                              height: h * 0.07,
                              padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.01),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                controller: controller1,
                                itemCount: Const.sizeList.length,
                                itemBuilder: (_, index) {
                                  return Obx(() {
                                    return Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              controller.selectedSizeIndex.value = index;
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                                                decoration: BoxDecoration(
                                                    color: controller.selectedSizeIndex.value == index ? vpnGrey : vpnBlueOpacity,
                                                    border: Border.all(color: controller.selectedSizeIndex.value == index ? vpnGrey : vpnBlue),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Text("${Const.sizeList[index]} inch",
                                                  style: controller.selectedSizeIndex.value == index
                                                      ? AppStyle.textStyleNotoSansSemiBoldWhite13
                                                      : AppStyle.textStyleNotoSansSemiBoldGrey13,))),
                                        SizedBox(width: w * 0.02)
                                      ],
                                    );
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            Text(Const.txtLblCompanyName, style: AppStyle.textStyleNotoSansBoldGrey20),
                            SizedBox(height: h * 0.01),
                            Container(
                              height: h * 0.07,
                              padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.01),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                controller: controller1,
                                itemCount: Const.monitorCompanyList.length,
                                itemBuilder: (_, index) {
                                  return Obx(() {
                                    return Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              controller.selectedMonitorCompanyIndex.value = index;
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                                                decoration: BoxDecoration(
                                                    color: controller.selectedMonitorCompanyIndex.value == index ? vpnGrey : vpnBlueOpacity,
                                                    border: Border.all(color: controller.selectedMonitorCompanyIndex.value == index ? vpnGrey : vpnBlue),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Text("${Const.monitorCompanyList[index]}",
                                                  style: controller.selectedMonitorCompanyIndex.value == index
                                                      ? AppStyle.textStyleNotoSansSemiBoldWhite13
                                                      : AppStyle.textStyleNotoSansSemiBoldGrey13,))),
                                        SizedBox(width: w * 0.02)
                                      ],
                                    );
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: h * 0.1),
                            // SizedBox(height: h * 0.5),
                          ],
                        ),
                      ),
                      Container(
                          height: h * 0.06,
                          decoration: BoxDecoration(color: cWhite, borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8))),
                          child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(Icons.remove, color: vpnGrey, size: 20)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                        onTap: () {  Get.back();  },
                                        child: const Icon(Icons.close)))
                              ])),
                      // SizedBox(height: h * 0.1),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.center,
                          color: cWhite,
                          height: h * 0.1,
                          child: CustomButton(
                            title: Const.btnLblApply,
                            onPressed: () {
                              debugPrint(' ======> ON CLICK ADD CATEGORY <====== ');
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<CategoryListLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: " ${controller.categoryTitle}",
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.backArrow)),
        action: [
          GestureDetector(
              onTap: () {
                _showBottomSheet(context, h, w);
                // Get.toNamed(AppRoutes.qrCodeScreen);
              },
              child: Image.asset(Assets.categoryFilter))
        ],
      ),
      floatingActionButton:
      controller.categoryTitle!.value == Const.ctDeadStock  ||
          // controller.categoryTitle!.value == Const.ctDataCable  ||
          controller.categoryTitle!.value == Const.ctPC
          ? const SizedBox()
          : FloatingActionButton(
        // elevation: 0.0,
          child: const Icon(Icons.add),
          backgroundColor: vpnGrey,
          onPressed: () {
            Get.toNamed(AppRoutes.addCategoryScreen, arguments: {
              "categoryTitle": '${controller.categoryTitle}',
              "totalNoCategory": '${controller.totalNoCategory}'
            });
          }
      ),
      body: controller.obx((data) =>
          Padding(
            padding: EdgeInsets.only(top: w * 0.04,left: w * 0.04, right: w * 0.04),
            child: AnimationLimiter(
              child: Column(
                children: [
                  TextInputFindOut(
                    label: Const.txtLblSearch,
                    iconData: FontAwesome.search,
                    textInputType: TextInputType.text,
                    onChange: (searchString) {
                      debugPrint('searchString : $searchString');
                    },
                  ),
                  SizedBox(height: h * 0.02),
                  Expanded(
                    child: ListView.builder(
                      // separatorBuilder: (BuildContext context, int index) {
                      //   return const SizedBox();
                      // },
                      // crossAxisCount: 3,
                      // itemCount: controller.categoryTitle!.value == Const.ctDataCable ? 1 : data['data']['memes'].length,
                      itemCount: controller.categoryTitle!.value == Const.ctDataCable ? 1 : controller.trx.data!.memes!.length,
                      itemBuilder: (BuildContext context, int index) {
                        // ${controller.trx.data!.memes![index].id}
                        // debugPrint('CategoryListWidget => data : $data');
                        // debugPrint('controller.totalNoCategory => ${controller.totalNoCategory}');
                        // debugPrint("data['data'].length : ${data['data'].length}");
                        // debugPrint("controller.trx.data!.memes!.length : ${controller.trx.data!.memes!.length}");
                        debugPrint('controller.categoryTitle => ${controller.categoryTitle}');
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            // verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: controller.obx((data) =>
                                  Slidable(
                                    key: const ValueKey(0),
                                    enabled: controller.categoryTitle!.value == Const.ctDataCable || controller.categoryTitle!.value == Const.ctDeadStock ? false : true,
                                    endActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                            onPressed: controller.onClickEdit,
                                            backgroundColor: vpnGreen, foregroundColor: cWhite, icon: Icons.edit, label: Const.btnLblEdit),
                                        SlidableAction(onPressed: controller.onClickDelete, backgroundColor: vpnRed, foregroundColor: cWhite, icon: Icons.delete, label: Const.btnLblDelete),
                                      ],
                                    ),
                                    child: Obx(() {
                                      return GestureDetector(
                                        onTap: () {
                                          debugPrint('on click category ==> : ${controller.categoryTitle}');
                                          controller.no.value = index;
                                          controller.dashBoardApi(controller.no.value);
                                          if(controller.categoryTitle!.value != 'PC' && controller.categoryTitle!.value != Const.ctDataCable)
                                          {
                                            Get.toNamed(
                                                AppRoutes.categoryDetailScreen,
                                                arguments: {
                                                  "categoryTitle": controller.categoryTitle!.value,
                                                  "totalNoCategory": controller.totalNoCategory!.value
                                                });
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                                width: w,
                                                padding: EdgeInsets.symmetric(vertical: w * 0.02, horizontal: w * 0.02),
                                                decoration: BoxDecoration(
                                                    // color: Const.colorList[index % Const.colorList.length],
                                                    color: cWhite,
                                                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                                    border: Border.all(color: vpnGreyopacity)),
                                                child:

                                                controller.categoryTitle!.value == Const.ctCPU ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'CPU-${index+1}'),
                                                    // CustomTextSpanWidget(title: Const.lblHardwareId, body: 'PC-${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    // Expanded(child: ListView.builder(
                                                    //   shrinkWrap: true,
                                                    //     physics: const NeverScrollableScrollPhysics(),
                                                    //     itemCount: controller.hardDiskTypeList.length,
                                                    //     itemBuilder: (diskContext, diskIndex){
                                                    //       return CustomTextSpanWidget(title: '${index+1}. ${controller.hardDiskTypeList[index]}', body: '',showDash: false,);
                                                    //     }),),
                                                    CustomTextSpanWidget(title: 'Hard disk Type :', body: '',showDash: false),
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        itemCount: controller.hardDiskTypeList.length,
                                                        itemBuilder: (diskContext, diskIndex) {
                                                          return CustomTextSpanWidget(title: '${diskIndex+1}. ${controller.hardDiskTypeList[diskIndex]}', body: '',showDash: false,);
                                                        }),



                                                    // CustomTextSpanWidget(title: '1. SSD', body: '',showDash: false,),
                                                    // CustomTextSpanWidget(title: '2. HDD', body: '',showDash: false),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblSellerName, body: 'C.C.Patel'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Warranty'),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctPC ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'PC-${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblCompanyName, body: 'HP'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblModelNo, body: 'ZZ1Q23'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblHardDiskDetails, body: '240GB SSD 500GB HDD',
                                                        onTap: () {
                                                          Get.toNamed(
                                                              AppRoutes.categoryDetailScreen,
                                                              arguments: {
                                                                "categoryTitle": controller.categoryTitle!.value = "Hard Disk",
                                                                "totalNoCategory": controller.totalNoCategory!.value
                                                              });
                                                        }),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblRAMDetails, body: '8 GB DDR1'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblProcessorAndOS, body: 'i3 Mac'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: 'Cables :', body: '',showDash: false),

                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        itemCount: controller.cableTypeList.length,
                                                        itemBuilder: (diskContext, cableIndex){
                                                          return CustomTextSpanWidget(title: '${cableIndex+1}. ${controller.cableTypeList[cableIndex]}', body: '',showDash: false,);
                                                        }),
                                                    // CustomTextSpanWidget(title: '1. 3 Pin power cable of PC', body: '',showDash: false),
                                                    // CustomTextSpanWidget(title: '2. 3 Pin power cable for Monitor', body: '',showDash: false),
                                                    // CustomTextSpanWidget(title: '3. HDMI Cable', body: '',showDash: false),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblKeyboardDetails, body: 'KB-15',onTap: (){
                                                      Get.toNamed(
                                                          AppRoutes.categoryDetailScreen,
                                                          arguments: {
                                                            "categoryTitle": controller.categoryTitle!.value = "Keyboard",
                                                            "totalNoCategory": controller.totalNoCategory!.value
                                                          });
                                                    },),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblMouseDetails, body: 'MU-18',onTap: (){
                                                      Get.toNamed(
                                                          AppRoutes.categoryDetailScreen,
                                                          arguments: {
                                                            "categoryTitle": controller.categoryTitle!.value = "Mouses",
                                                            "totalNoCategory": controller.totalNoCategory!.value
                                                          });
                                                    },),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblMonitorDetails, body: 'MT-5 & MT 9 (If dual screen)',
                                                      onTap: (){
                                                        Get.toNamed(
                                                            AppRoutes.categoryDetailScreen,
                                                            arguments: {
                                                              "categoryTitle": controller.categoryTitle!.value = "Moniters",
                                                              "totalNoCategory": controller.totalNoCategory!.value
                                                            });
                                                      },),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblHeadPhoneDetailsOptional, body: 'HP-2',
                                                        onTap: () {
                                                          Get.toNamed(
                                                              AppRoutes.categoryDetailScreen,
                                                              arguments: {
                                                                "categoryTitle": controller.categoryTitle!.value = "Headphones",
                                                                "totalNoCategory": controller.totalNoCategory!.value
                                                              });
                                                        }),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblCurrentUserName, body: 'Shailesh'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblOthers, body: 'Wifi Device, or other details '),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblHistory, body: ''),

                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctLaptops ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'LP-${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblHardDiskDetails, body: '240GB SSD 500GB HDD',
                                                        onTap: () {
                                                          Get.toNamed(
                                                              AppRoutes.categoryDetailScreen,
                                                              arguments: {
                                                                "categoryTitle": controller.categoryTitle!.value = "Hard Disk",
                                                                "totalNoCategory": controller.totalNoCategory!.value
                                                              });
                                                        }),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblRAMDetails, body: '8 GB DDR1'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblProcessorAndOS, body: 'i3 Mac'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblMouseDetails, body: 'MU-18',onTap: (){
                                                      Get.toNamed(
                                                          AppRoutes.categoryDetailScreen,
                                                          arguments: {
                                                            "categoryTitle": controller.categoryTitle!.value = "Mouses",
                                                            "totalNoCategory": controller.totalNoCategory!.value
                                                          });
                                                    },),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblMonitorDetails, body: 'MT-5 & MT 9 (If dual screen)',
                                                      onTap: (){
                                                        Get.toNamed(
                                                            AppRoutes.categoryDetailScreen,
                                                            arguments: {
                                                              "categoryTitle": controller.categoryTitle!.value = "Moniters",
                                                              "totalNoCategory": controller.totalNoCategory!.value
                                                            });
                                                      },),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblHeadPhoneDetailsOptional, body: 'HP-2',
                                                        onTap: () {
                                                          Get.toNamed(
                                                              AppRoutes.categoryDetailScreen,
                                                              arguments: {
                                                                "categoryTitle": controller.categoryTitle!.value = "Headphones",
                                                                "totalNoCategory": controller.totalNoCategory!.value
                                                              });
                                                        }),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblOthers, body: 'Wifi Device, or other details '),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblHistory, body: ''),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctHardDisk ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'HD - ${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Toshiba'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.hType, body: 'HDD'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.hSizeWithoutAsterisk, body: '1 TB'),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctMobileDevices ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'MO - ${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Samsung'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblModelNo, body: 'A21s'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.hType, body: 'Android'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.hVersionWithoutAsterisk, body: '11'),

                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctKeyBoards ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'KB - ${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    // CustomTextSpanWidget(title: Const.lblSellerName', body: 'P.V.Patel'),
                                                    CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Logitech'),
                                                    SizedBox(height: h * 0.02),
                                                    // CustomTextSpanWidget(title: 'Serial No', body: 'Key1245b2'),
                                                    CustomTextSpanWidget(title: Const.lblUserName, body: 'Arjun Patel'),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctMouses ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // CustomTextSpanWidget(title: 'Dell', body: '${index+1}'),
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'MU - ${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Dell'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblUserName, body: 'Arjun Patel'),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctCCTV ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'CC - ${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblLocation, body: 'HR Cabin'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblPixel, body: '1080p'),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctHeadphones ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'hp - ${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Sony'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblModelNo, body: 'HP12/45b2'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblUserName, body: 'Parth Patel'),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctPrinters ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // CustomTextSpanWidget(title: 'HP Laserjet Pro M1136', body: '${index+1}'),
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'PR - ${index+1}'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblCompanyName, body: 'HP'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblModelNo, body: 'Laserjet Pro M1136'),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctDataCable ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblVGACable, body: '10'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblHDMICable, body: '3'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblSataCable, body: '2'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblPowerCable3Pin, body: '1'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblPowerCable2Pin, body: '6'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblHarddiskCableForMotherboard, body: '12'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblAndroidCableUniversal, body: '7'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblAndroidCableCType, body: '8'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblIOSCable, body: '6'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblHdmiVGA, body: '6'),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctSeller ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblSellerName, body: 'A.A.Patel'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.hShopNameWithoutAsterisk, body: 'HP/CPS Branch'),
                                                  ],
                                                )

                                                : controller.categoryTitle!.value == Const.ctDeadStock ?
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: 'PC - 1'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblDeadStockDate, body: '01-01-2022'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblLastUserName, body: 'Parth Patel'),
                                                    SizedBox(height: h * 0.02),
                                                    CustomTextSpanWidget(title: Const.lblDeadStockReason, body: 'Damaged Motherboard'),
                                                  ],
                                                )

                                                : Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  // mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    //Hardware Id
                                                    CustomTextSpanWidget(title: Const.lblHardwareId, body: ' MT - ${index + 1}', style: AppStyle.textStyleNotoSansSemiBoldBlue15,),
                                                    // CustomTextSpanWidget(title: 'MT', body: ' HP - ${index + 1}', style: AppStyle.textStyleNotoSansSemiBoldBlue15,),
                                                    SizedBox(height: h * 0.01),
                                                    CustomTextSpanWidget(title: Const.hSizeWithoutAsterisk, body: '24 inch'),
                                                    SizedBox(height: h * 0.01),
                                                    CustomTextSpanWidget(title: Const.hType, body: 'LCD'),
                                                    SizedBox(height: h * 0.01),
                                                    CustomTextSpanWidget(title: Const.lblUserName, body: 'XYZ')
                                                  ],
                                                )

                                              // child: Column(
                                              //   children: [
                                              //     Row(
                                              //       children: [
                                              //         Container(
                                              //           width: w * 0.45,
                                              //           // color: Colors.red[100],
                                              //           child: Text(
                                              //             'Name : ${data['data']['memes'][index]['name']}',
                                              //             overflow: TextOverflow.ellipsis),
                                              //         ),
                                              //         SizedBox(width: w * 0.01),
                                              //         Container(
                                              //             width: w * 0.45,
                                              //             // color: Colors.orange[100],
                                              //             child: Text('Id : ${data['data']['memes'][index]['id']}', textAlign: TextAlign.end,)),
                                              //       ],
                                              //     ),
                                              //     SizedBox(height: h * 0.02),
                                              //     Row(
                                              //       children: [
                                              //         Container(
                                              //           width: w * 0.45,
                                              //           // color: Colors.red[100],
                                              //           child: Text(
                                              //             'Count : ${data['data']['memes'][index]['box_count']}',
                                              //             // overflow: TextOverflow.ellipsis,
                                              //           ),
                                              //         ),
                                              //         SizedBox(width: w * 0.01),
                                              //         Container(
                                              //           width: w * 0.45,
                                              //           // color: Colors.orange[100],
                                              //           child: Text(
                                              //             'H * W : ${data['data']['memes'][index]['height']} * ${data['data']['memes'][index]['width']}',
                                              //             overflow: TextOverflow.ellipsis,
                                              //             textAlign: TextAlign.end,)),
                                              //       ],
                                              //     ),
                                              //   ],
                                              // ),
                                            ),
                                            SizedBox(height: h * 0.02)
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // onLoading: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
          onLoading: const CustomProgressBar(),
          onError: (e) => Text('Error : $e'),
          onEmpty: const Text(Const.lblDataNotFound),


      ),
    );
  }
}

// class CategoryListWidget extends GetView<CategoryListLogic> {
//   const CategoryListWidget({Key? key}) : super(key: key);
//
//   void onClickEdit(BuildContext context) {
//     Get.toNamed(AppRoutes.editCategoryScreen);
//     debugPrint(' =======> ON CLICK EDIT <======= ');
//   }
//
//   void onClickDelete(BuildContext c) {
//     dialogWithDivider(c,
//       'Are you sure to delete this product?',
//       'Cancel', 'Delete', () {
//         debugPrint(" =====> ON CLICK CANCEL <===== ");
//         Get.back();
//       }, () {
//         debugPrint(" =====> ON CLICK DELETE <===== ");
//       });
//   }
//
//
//   void _showBottomSheet(BuildContext c, var h, var w) {
//     showModalBottomSheet(
//       context: c,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return controller.obx((data) =>
//             DraggableScrollableSheet(
//               initialChildSize: 0.5,
//               minChildSize: 0.5,
//               maxChildSize: 0.75,
//               builder: (_, controller1) {
//                 return Container(
//                   padding: EdgeInsets.symmetric(horizontal: w * 0.04),
//                   decoration: BoxDecoration(color: cWhite, borderRadius: const BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
//                   child: Stack(
//                     children: [
//                       SingleChildScrollView(
//                         controller: controller1,
//                         physics: const AlwaysScrollableScrollPhysics(),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: h * 0.08,),
//                             Text(Const.hType, style: AppStyle.textStyleNotoSansBoldGrey20),
//                             SizedBox(height: h * 0.01),
//                             Container(
//                               height: h * 0.07,
//                               padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.01),
//                               child: ListView.builder(
//                                 shrinkWrap: true,
//                                 scrollDirection: Axis.horizontal,
//                                 controller: controller1,
//                                 itemCount: Const.monitorTypeList.length,
//                                 itemBuilder: (_, index) {
//                                   return Obx(() {
//                                     return Row(
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             controller.selectedTypeIndex.value = index;
//                                           },
//                                           child: Container(
//                                             alignment: Alignment.center,
//                                             padding: EdgeInsets.symmetric(horizontal: w * 0.04),
//                                             decoration: BoxDecoration(
//                                               color: controller.selectedTypeIndex.value == index ? vpnGrey : vpnBlueOpacity,
//                                               border: Border.all(color: controller.selectedTypeIndex.value == index ? vpnGrey : vpnBlue),
//                                               borderRadius: BorderRadius.circular(10)),
//                                             child: Text("${Const.monitorTypeList[index]}",
//                                               style: controller.selectedTypeIndex.value == index
//                                                 ? AppStyle.textStyleNotoSansSemiBoldWhite13
//                                                 : AppStyle.textStyleNotoSansSemiBoldGrey13))),
//                                         SizedBox(width: w * 0.02)
//                                       ],
//                                     );
//                                   });
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: h * 0.01),
//                             Text(Const.txtLblSize, style: AppStyle.textStyleNotoSansBoldGrey20),
//                             SizedBox(height: h * 0.01),
//                             Container(
//                               height: h * 0.07,
//                               padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.01),
//                               child: ListView.builder(
//                                 shrinkWrap: true,
//                                 scrollDirection: Axis.horizontal,
//                                 controller: controller1,
//                                 itemCount: Const.sizeList.length,
//                                 itemBuilder: (_, index) {
//                                   return Obx(() {
//                                     return Row(
//                                       children: [
//                                         GestureDetector(
//                                             onTap: () {
//                                               controller.selectedSizeIndex.value = index;
//                                             },
//                                             child: Container(
//                                               alignment: Alignment.center,
//                                               padding: EdgeInsets.symmetric(horizontal: w * 0.04),
//                                               decoration: BoxDecoration(
//                                                 color: controller.selectedSizeIndex.value == index ? vpnGrey : vpnBlueOpacity,
//                                                 border: Border.all(color: controller.selectedSizeIndex.value == index ? vpnGrey : vpnBlue),
//                                                 borderRadius: BorderRadius.circular(10)),
//                                               child: Text("${Const.sizeList[index]} inch",
//                                                 style: controller.selectedSizeIndex.value == index
//                                                   ? AppStyle.textStyleNotoSansSemiBoldWhite13
//                                                   : AppStyle.textStyleNotoSansSemiBoldGrey13,))),
//                                         SizedBox(width: w * 0.02)
//                                       ],
//                                     );
//                                   });
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: h * 0.01),
//                             Text(Const.txtLblCompanyName, style: AppStyle.textStyleNotoSansBoldGrey20),
//                             SizedBox(height: h * 0.01),
//                             Container(
//                               height: h * 0.07,
//                               padding: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.01),
//                               child: ListView.builder(
//                                 shrinkWrap: true,
//                                 scrollDirection: Axis.horizontal,
//                                 controller: controller1,
//                                 itemCount: Const.monitorCompanyList.length,
//                                 itemBuilder: (_, index) {
//                                   return Obx(() {
//                                     return Row(
//                                       children: [
//                                         GestureDetector(
//                                             onTap: () {
//                                               controller.selectedMonitorCompanyIndex.value = index;
//                                             },
//                                             child: Container(
//                                               alignment: Alignment.center,
//                                               padding: EdgeInsets.symmetric(horizontal: w * 0.04),
//                                               decoration: BoxDecoration(
//                                                 color: controller.selectedMonitorCompanyIndex.value == index ? vpnGrey : vpnBlueOpacity,
//                                                 border: Border.all(color: controller.selectedMonitorCompanyIndex.value == index ? vpnGrey : vpnBlue),
//                                                 borderRadius: BorderRadius.circular(10)),
//                                               child: Text("${Const.monitorCompanyList[index]}",
//                                                 style: controller.selectedMonitorCompanyIndex.value == index
//                                                   ? AppStyle.textStyleNotoSansSemiBoldWhite13
//                                                   : AppStyle.textStyleNotoSansSemiBoldGrey13,))),
//                                         SizedBox(width: w * 0.02)
//                                       ],
//                                     );
//                                   });
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: h * 0.1),
//                             // SizedBox(height: h * 0.5),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: h * 0.06,
//                         decoration: BoxDecoration(color: cWhite, borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8))),
//                         child: Stack(
//                           children: [
//                             Align(
//                               alignment: Alignment.topCenter,
//                               child: Icon(Icons.remove, color: vpnGrey, size: 20)),
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: GestureDetector(
//                                 onTap: () {  Get.back();  },
//                                 child: const Icon(Icons.close)))
//                           ])),
//                       // SizedBox(height: h * 0.1),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           alignment: Alignment.center,
//                           color: cWhite,
//                           height: h * 0.1,
//                           child: CustomButton(
//                             title: Const.btnLblApply,
//                             onPressed: () {
//                               debugPrint(' ======> ON CLICK ADD CATEGORY <====== ');
//                             },
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             )
//         );
//       },
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // final logic = Get.find<CategoryListLogic>();
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: " ${controller.categoryTitle}",
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Image.asset(Assets.backArrow)),
//         action: [
//           GestureDetector(
//             onTap: () {
//               _showBottomSheet(context, h, w);
//               // Get.toNamed(AppRoutes.qrCodeScreen);
//             },
//             child: Image.asset(Assets.categoryFilter))
//         ],
//       ),
//       floatingActionButton:
//       controller.categoryTitle!.value == Const.ctDeadStock  ||
//       // controller.categoryTitle!.value == Const.ctDataCable  ||
//       controller.categoryTitle!.value == Const.ctPC
//       ? const SizedBox()
//       : FloatingActionButton(
//           // elevation: 0.0,
//           child: const Icon(Icons.add),
//           backgroundColor: vpnGrey,
//           onPressed: () {
//             Get.toNamed(AppRoutes.addCategoryScreen, arguments: {
//               "categoryTitle": '${controller.categoryTitle}',
//               "totalNoCategory": '${controller.totalNoCategory}'
//             });
//           }
//       ),
//       body: controller.obx((data) =>
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: w * 0.04, horizontal: w * 0.04),
//             child: AnimationLimiter(
//               child: Column(
//                 children: [
//                   TextInputFindOut(
//                     label: Const.txtLblSearch,
//                     iconData: FontAwesome.search,
//                     textInputType: TextInputType.text,
//                     onChange: (searchString) {
//                       debugPrint('searchString : $searchString');
//                     },
//                   ),
//                   SizedBox(height: h * 0.02),
//                   Expanded(
//                     child: ListView.separated(
//                       separatorBuilder: (BuildContext context, int index) {
//                         return const SizedBox();
//                       },
//                       // crossAxisCount: 3,
//                       itemCount: controller.categoryTitle!.value == Const.ctDataCable ? 1 : data['data']['memes'].length,
//                       itemBuilder: (BuildContext context, int index) {
//                         // debugPrint('CategoryListWidget => data : $data');
//                         // debugPrint('controller.totalNoCategory => ${controller.totalNoCategory}');
//                         // debugPrint("data['data'].length : ${data['data'].length}");
//                         debugPrint('controller.categoryTitle => ${controller.categoryTitle}');
//                         return AnimationConfiguration.staggeredList(
//                           position: index,
//                           duration: const Duration(milliseconds: 375),
//                           child: SlideAnimation(
//                             verticalOffset: 50.0,
//                             child: FadeInAnimation(
//                               child: controller.obx((data) =>
//                                 Slidable(
//                                   key: const ValueKey(0),
//                                   enabled: controller.categoryTitle!.value == Const.ctDataCable || controller.categoryTitle!.value == Const.ctDeadStock ? false : true,
//                                   endActionPane: ActionPane(
//                                     motion: const StretchMotion(),
//                                     children: [
//                                       SlidableAction(onPressed: onClickEdit, backgroundColor: vpnGreen, foregroundColor: cWhite, icon: Icons.edit, label: Const.btnLblEdit),
//                                       SlidableAction(onPressed: onClickDelete, backgroundColor: vpnRed, foregroundColor: cWhite, icon: Icons.delete, label: Const.btnLblDelete),
//                                     ],
//                                   ),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                        debugPrint('on click category ==> : ${controller.categoryTitle}');
//                                          if(controller.categoryTitle!.value != 'PC' && controller.categoryTitle!.value != Const.ctDataCable)
//                                          {
//                                            Get.toNamed(
//                                              AppRoutes.categoryDetailScreen,
//                                              arguments: {
//                                                "categoryTitle": controller.categoryTitle!.value,
//                                                "totalNoCategory": controller.totalNoCategory!.value
//                                              });
//                                          }
//
//                                     },
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           width: w,
//                                           padding: EdgeInsets.symmetric(vertical: w * 0.02, horizontal: w * 0.02),
//                                           decoration: BoxDecoration(
//                                             // color: Const.colorList[index % Const.colorList.length ],
//                                             color: cWhite,
//                                             borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//                                             border: Border.all(color: vpnGreyopacity)),
//                                           child:
//
//                                           controller.categoryTitle!.value == Const.ctCPU ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'CPU-${index+1}'),
//                                               // CustomTextSpanWidget(title: Const.lblHardwareId, body: 'PC-${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               // Expanded(child: ListView.builder(
//                                               //   shrinkWrap: true,
//                                               //     physics: const NeverScrollableScrollPhysics(),
//                                               //     itemCount: controller.hardDiskTypeList.length,
//                                               //     itemBuilder: (diskContext, diskIndex){
//                                               //       return CustomTextSpanWidget(title: '${index+1}. ${controller.hardDiskTypeList[index]}', body: '',showDash: false,);
//                                               //     }),),
//                                               CustomTextSpanWidget(title: 'Hard disk Type :', body: '',showDash: false),
//                                               ListView.builder(
//                                                   shrinkWrap: true,
//                                                   physics: const NeverScrollableScrollPhysics(),
//                                                   itemCount: controller.hardDiskTypeList.length,
//                                                   itemBuilder: (diskContext, diskIndex){
//                                                     return CustomTextSpanWidget(title: '${diskIndex+1}. ${controller.hardDiskTypeList[diskIndex]}', body: '',showDash: false,);
//                                                   }),
//
//
//
//                                               // CustomTextSpanWidget(title: '1. SSD', body: '',showDash: false,),
//                                               // CustomTextSpanWidget(title: '2. HDD', body: '',showDash: false),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblSellerName, body: 'C.C.Patel'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblGW, body: '6 Months Warranty'),
//                                             ],
//                                           )
//
//                                           : controller.categoryTitle!.value == Const.ctPC ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'PC-${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblCompanyName, body: 'HP'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblModelNo, body: 'ZZ1Q23'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblHardDiskDetails, body: '240GB SSD 500GB HDD',
//                                                   onTap: () {
//                                                     Get.toNamed(
//                                                         AppRoutes.categoryDetailScreen,
//                                                         arguments: {
//                                                           "categoryTitle": controller.categoryTitle!.value = "Hard Disk",
//                                                           "totalNoCategory": controller.totalNoCategory!.value
//                                                         });
//                                                   }),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblRAMDetails, body: '8 GB DDR1'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblProcessorAndOS, body: 'i3 Mac'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: 'Cables :', body: '',showDash: false),
//
//                                               ListView.builder(
//                                                   shrinkWrap: true,
//                                                   physics: const NeverScrollableScrollPhysics(),
//                                                   itemCount: controller.cableTypeList.length,
//                                                   itemBuilder: (diskContext, cableIndex){
//                                                     return CustomTextSpanWidget(title: '${cableIndex+1}. ${controller.cableTypeList[cableIndex]}', body: '',showDash: false,);
//                                                   }),
//                                               // CustomTextSpanWidget(title: '1. 3 Pin power cable of PC', body: '',showDash: false),
//                                               // CustomTextSpanWidget(title: '2. 3 Pin power cable for Monitor', body: '',showDash: false),
//                                               // CustomTextSpanWidget(title: '3. HDMI Cable', body: '',showDash: false),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblKeyboardDetails, body: 'KB-15',onTap: (){
//                                                 Get.toNamed(
//                                                     AppRoutes.categoryDetailScreen,
//                                                     arguments: {
//                                                       "categoryTitle": controller.categoryTitle!.value = "Keyboard",
//                                                       "totalNoCategory": controller.totalNoCategory!.value
//                                                     });
//                                               },),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblMouseDetails, body: 'MU-18',onTap: (){
//                                                 Get.toNamed(
//                                                     AppRoutes.categoryDetailScreen,
//                                                     arguments: {
//                                                       "categoryTitle": controller.categoryTitle!.value = "Mouses",
//                                                       "totalNoCategory": controller.totalNoCategory!.value
//                                                     });
//                                               },),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblMonitorDetails, body: 'MT-5 & MT 9 (If dual screen)',
//                                                 onTap: (){
//                                                   Get.toNamed(
//                                                       AppRoutes.categoryDetailScreen,
//                                                       arguments: {
//                                                         "categoryTitle": controller.categoryTitle!.value = "Moniters",
//                                                         "totalNoCategory": controller.totalNoCategory!.value
//                                                       });
//                                                 },),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblHeadPhoneDetailsOptional, body: 'HP-2',
//                                                   onTap: () {
//                                                     Get.toNamed(
//                                                         AppRoutes.categoryDetailScreen,
//                                                         arguments: {
//                                                           "categoryTitle": controller.categoryTitle!.value = "Headphones",
//                                                           "totalNoCategory": controller.totalNoCategory!.value
//                                                         });
//                                                   }),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblCurrentUserName, body: 'Shailesh'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblOthers, body: 'Wifi Device, or other details '),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblHistory, body: ''),
//
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctLaptops ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'LP-${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblHardDiskDetails, body: '240GB SSD 500GB HDD',
//                                                   onTap: () {
//                                                     Get.toNamed(
//                                                         AppRoutes.categoryDetailScreen,
//                                                         arguments: {
//                                                           "categoryTitle": controller.categoryTitle!.value = "Hard Disk",
//                                                           "totalNoCategory": controller.totalNoCategory!.value
//                                                         });
//                                                   }),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblRAMDetails, body: '8 GB DDR1'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblProcessorAndOS, body: 'i3 Mac'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblMouseDetails, body: 'MU-18',onTap: (){
//                                                 Get.toNamed(
//                                                     AppRoutes.categoryDetailScreen,
//                                                     arguments: {
//                                                       "categoryTitle": controller.categoryTitle!.value = "Mouses",
//                                                       "totalNoCategory": controller.totalNoCategory!.value
//                                                     });
//                                               },),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblMonitorDetails, body: 'MT-5 & MT 9 (If dual screen)',
//                                                 onTap: (){
//                                                   Get.toNamed(
//                                                       AppRoutes.categoryDetailScreen,
//                                                       arguments: {
//                                                         "categoryTitle": controller.categoryTitle!.value = "Moniters",
//                                                         "totalNoCategory": controller.totalNoCategory!.value
//                                                       });
//                                                 },),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblHeadPhoneDetailsOptional, body: 'HP-2',
//                                                   onTap: () {
//                                                     Get.toNamed(
//                                                         AppRoutes.categoryDetailScreen,
//                                                         arguments: {
//                                                           "categoryTitle": controller.categoryTitle!.value = "Headphones",
//                                                           "totalNoCategory": controller.totalNoCategory!.value
//                                                         });
//                                                   }),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblOthers, body: 'Wifi Device, or other details '),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblHistory, body: ''),
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctHardDisk ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'HD - ${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Toshiba'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.hType, body: 'HDD'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.hSizeWithoutAsterisk, body: '1 TB'),
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctMobileDevices ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'MO - ${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Samsung'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblModelNo, body: 'A21s'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.hType, body: 'Android'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.hVersionWithoutAsterisk, body: '11'),
//
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctKeyBoards ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'KB - ${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               // CustomTextSpanWidget(title: Const.lblSellerName', body: 'P.V.Patel'),
//                                               CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Logitech'),
//                                               SizedBox(height: h * 0.02),
//                                               // CustomTextSpanWidget(title: 'Serial No', body: 'Key1245b2'),
//                                               CustomTextSpanWidget(title: Const.lblUserName, body: 'Arjun Patel'),
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctMouses ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               // CustomTextSpanWidget(title: 'Dell', body: '${index+1}'),
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'MU - ${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Dell'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblUserName, body: 'Arjun Patel'),
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctCCTV ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'CC - ${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblLocation, body: 'HR Cabin'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblPixel, body: '1080p'),
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctHeadphones ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'hp - ${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblCompanyName, body: 'Sony'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblModelNo, body: 'HP12/45b2'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblUserName, body: 'Parth Patel'),
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctPrinters ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               // CustomTextSpanWidget(title: 'HP Laserjet Pro M1136', body: '${index+1}'),
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'PR - ${index+1}'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblCompanyName, body: 'HP'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblModelNo, body: 'Laserjet Pro M1136'),
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctDataCable ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblVGACable, body: '10'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblHDMICable, body: '3'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblSataCable, body: '2'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblPowerCable3Pin, body: '1'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblPowerCable2Pin, body: '6'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblHarddiskCableForMotherboard, body: '12'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblAndroidCableUniversal, body: '7'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblAndroidCableCType, body: '8'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblIOSCable, body: '6'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblHdmiVGA, body: '6'),
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctSeller ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblSellerName, body: 'A.A.Patel'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.hShopNameWithoutAsterisk, body: 'HP/CPS Branch'),
//                                             ],
//                                           )
//
//                                           :
//                                           controller.categoryTitle!.value == Const.ctDeadStock ?
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: 'PC - 1'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblDeadStockDate, body: '01-01-2022'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblLastUserName, body: 'Parth Patel'),
//                                               SizedBox(height: h * 0.02),
//                                               CustomTextSpanWidget(title: Const.lblDeadStockReason, body: 'Damaged Motherboard'),
//                                             ],
//                                           )
//
//                                           :
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             // mainAxisSize: MainAxisSize.max,
//                                             children: [
//                                               //Hardware Id
//                                               CustomTextSpanWidget(title: Const.lblHardwareId, body: ' MT - ${index + 1}', style: AppStyle.textStyleNotoSansSemiBoldBlue15,),
//                                               // CustomTextSpanWidget(title: 'MT', body: ' HP - ${index + 1}', style: AppStyle.textStyleNotoSansSemiBoldBlue15,),
//                                               SizedBox(height: h * 0.01),
//                                               CustomTextSpanWidget(title: Const.hSizeWithoutAsterisk, body: '24 inch'),
//                                               SizedBox(height: h * 0.01),
//                                               CustomTextSpanWidget(title: Const.hType, body: 'LCD'),
//                                               SizedBox(height: h * 0.01),
//                                               CustomTextSpanWidget(title: Const.lblUserName, body: 'XYZ')
//                                             ],
//                                           )
//
//                                           // child: Column(
//                                           //   children: [
//                                           //     Row(
//                                           //       children: [
//                                           //         Container(
//                                           //           width: w * 0.45,
//                                           //           // color: Colors.red[100],
//                                           //           child: Text(
//                                           //             'Name : ${data['data']['memes'][index]['name']}',
//                                           //             overflow: TextOverflow.ellipsis),
//                                           //         ),
//                                           //         SizedBox(width: w * 0.01),
//                                           //         Container(
//                                           //             width: w * 0.45,
//                                           //             // color: Colors.orange[100],
//                                           //             child: Text('Id : ${data['data']['memes'][index]['id']}', textAlign: TextAlign.end,)),
//                                           //       ],
//                                           //     ),
//                                           //     SizedBox(height: h * 0.02),
//                                           //     Row(
//                                           //       children: [
//                                           //         Container(
//                                           //           width: w * 0.45,
//                                           //           // color: Colors.red[100],
//                                           //           child: Text(
//                                           //             'Count : ${data['data']['memes'][index]['box_count']}',
//                                           //             // overflow: TextOverflow.ellipsis,
//                                           //           ),
//                                           //         ),
//                                           //         SizedBox(width: w * 0.01),
//                                           //         Container(
//                                           //           width: w * 0.45,
//                                           //           // color: Colors.orange[100],
//                                           //           child: Text(
//                                           //             'H * W : ${data['data']['memes'][index]['height']} * ${data['data']['memes'][index]['width']}',
//                                           //             overflow: TextOverflow.ellipsis,
//                                           //             textAlign: TextAlign.end,)),
//                                           //       ],
//                                           //     ),
//                                           //   ],
//                                           // ),
//                                         ),
//                                         SizedBox(height: h * 0.02)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // onLoading: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
//           onLoading: const CustomProgressBar(),
//           onError: (e) => Text('$e')
//
//
//       ),
//     );
//   }
// }
