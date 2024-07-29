import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Screen/view_module_list/custom_field_model.dart';
import 'package:vpn_scanner/UI/Screen/view_module_list/view_module_list_logic.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_empty_text.dart';
import 'package:vpn_scanner/UI/Widget/custom_progressbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_textspan.dart';
import 'package:vpn_scanner/Utils/app_style.dart';

class ViewModuleListPage extends GetView<ViewModuleListLogic> {
  // final logic = Get.find<ViewModuleListLogic>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    debugPrint('controller.items.value.length : ${controller.items!.value.length}');
    return Scaffold(
      // key: controller.viewModuleListKey,
      appBar: CustomAppBar(
        title: 'Module List',
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.backArrow)),
      ),
      body: controller.obx((data) =>
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: ListView.separated(
               separatorBuilder:  (context, index) {
                 return SizedBox(height: h * 0.02);
               },
                shrinkWrap: true,
                itemCount: controller.items!.length,
                itemBuilder: (context, index) {
                  debugPrint('controller.items![index].customField : ${controller.items![index].customField}');
                  final getCustomFieldData =  customFieldFromJson(controller.items![index].customField.toString());// CustomField.fromJson(jsonEncode(controller.items![index].customField.toString()));
                  debugPrint('getCustomFieldData.length : ${getCustomFieldData.length}');

                  debugPrint('getCustomFieldData : ${getCustomFieldData}');

                  debugPrint('controller.items![index].customField : ${controller.items![index].customField}');
                  final getFieldData =  customFieldFromJson(controller.items![index].customField.toString());
                  debugPrint('getFieldData : ${getFieldData}');
                  debugPrint('getFieldData.length : ${getFieldData.length}');



                  List<dynamic> orig = json.decode(controller.items![index].customField!);//json.encode(controller.items![index].customField);
                  debugPrint('orig : ${orig}');
                  Map<String, dynamic>? mapTest = {};
                  for (var kv in orig) {
                    print("kv : ${kv}");
                    mapTest.addAll(kv);
                  }
                  // var keys = mapTest.keys.toList();
                  // var val = mapTest[keys[0]];
                  // debugPrint('val : $val');
                  debugPrint('mapTest  :$mapTest');
                  debugPrint('mapTest.length  :${mapTest.length}');
                  debugPrint('mapTest.keys  :${mapTest.keys}');
                  debugPrint('mapTest.keys  :${mapTest.values}');

                  // String key = mapTest.keys.elementAt(index);
                  // debugPrint('key : $key');
                  // String val1 = mapTest.values.elementAt(index);
                  // debugPrint('val1 : $val1');

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: w * 0.02, horizontal: w * 0.02),
                    decoration: BoxDecoration(
                        color: cWhite,
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: vpnGreyopacity)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Company Name : ${controller.items![index].companyName}',style: AppStyle.textStyleNotoSansBoldGrey15),
                        Text('Serial No. : ${controller.items![index].serialNo}',style: AppStyle.textStyleNotoSansBoldGrey15),
                        Text('Model No. : ${controller.items![index].modelNo}',style: AppStyle.textStyleNotoSansBoldGrey15),
                        // Text('Custom Field. : ${controller.items![index].customField}',style: AppStyle.textStyleNotoSansBoldGrey15),
                        ListView.builder(
                           shrinkWrap: true,
                            itemCount: mapTest.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context,fieldIndex) {
                              // return Text('${getCustomFieldData[fieldIndex].key}',style: AppStyle.textStyleNotoSansBoldGrey15);
                              return CustomTextSpanWidget(title: mapTest.keys.elementAt(fieldIndex), body: mapTest.values.elementAt(fieldIndex));
                            }),

                      ],
                    ),
                  );
                }),
          ),

      onLoading: const CustomProgressBar(),
      onEmpty:   CustomLabelWidget(title: Const.lblDataNotFound),
      onError: (e) => CustomLabelWidget(title: e),
      // Center(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: w * 0.04 ),
      //     child: Text(Const.lblDataNotFound,
      //       textAlign: TextAlign.center,style: AppStyle.textStyleMontserratBold30,),
      //   ),
      // )

      )
    );
  }
}
