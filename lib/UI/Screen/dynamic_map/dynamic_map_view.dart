import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/dynamic_map/dynamic_map_model.dart';
import 'dynamic_map_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Screen/update_dynamic_view/update_dynamic_view_logic.dart';
import 'package:vpn_scanner/UI/Widget/common_text_field.dart';
import 'package:vpn_scanner/UI/Widget/customDropDown/dropdown_button2.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_dialog.dart';
import 'package:vpn_scanner/UI/Widget/custom_empty_text.dart';
import 'package:vpn_scanner/UI/Widget/custom_progressbar.dart';
import 'package:vpn_scanner/UI/Widget/text_button.dart';
import 'package:vpn_scanner/Utils/app_style.dart';
import 'package:vpn_scanner/Utils/validation.dart';
import 'dart:developer' as logger;

class DynamicMapPage extends GetView<DynamicMapLogic> {
  final logic = Get.find<DynamicMapLogic>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Upgrade Map Form',
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(Assets.backArrow)),
        action: [
          Padding(padding: EdgeInsets.only(right: w * 0.04),
            child: GestureDetector(
              onTap: () {
                // Get.toNamed(AppRoutes.viewModuleScreen);
                // controller.callApi();
              },
              child: Icon(Icons.view_agenda, color: vpnBlue,)),
          )
        ],
      ),
      body: controller.obx((state) =>
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.updateViewDataList.value.length,
                          //30,
                          itemBuilder: (BuildContext context, int index) {
                            var data = controller.updateViewDataList.value[index];
                            return Column(
                              children: [
                                data.elementType == Const.typeTextField ? Column(
                                  children: [
                                    SizedBox(height: h * 0.03),
                                    CommonTextField(
                                        label: data.label,
                                        onChange: (onChangeVal) {
                                          debugPrint('onChangeVal : ${onChangeVal.toString().length}');
                                          controller.updateViewDataList.value.forEach((element) {
                                            if (data.elementType == Const.typeTextField || data.elementType == Const.typeDateTime) {
                                              controller.keyTECs![index].text = onChangeVal.toString();
                                              // controller.valueList[index] = onChangeVal.toString();
                                            } else {
                                              // controller.valueList.add('');
                                              controller.keyTECs![index].text = '';
                                            }
                                          });

                                          ///SET SUFFIX VALUE IN PIXEL : LIKE => p
                                          // if(data.key  == "${Const.lblPixel}") {
                                          //   debugPrint('controller.keyTECs![index].text.length : ${controller.keyTECs![index].text.length}');
                                          //   debugPrint('controller.keyTECs![index].text 1 : ${controller.keyTECs![index].text}');
                                          //   controller.keyTECs![index].text = controller.keyTECs![index].text.toString().substring(0,controller.keyTECs![index].text.length-1)+'p';
                                          //   controller.keyTECs![index].selection = TextSelection.fromPosition(TextPosition(offset: controller.keyTECs![index].text.length -1 ));
                                          //   debugPrint('controller.keyTECs![index].text 2 : ${controller.keyTECs![index].text}');
                                          // } else {
                                          //   controller.keyTECs![index].selection = TextSelection.fromPosition(TextPosition(offset: controller.keyTECs![index].text.length));
                                          // }
                                          ///
                                          controller.keyTECs![index].selection = TextSelection.fromPosition(TextPosition(offset: controller.keyTECs![index].text.length));
                                        },
                                        controller: controller.keyTECs![index],
                                        textInputType: TextInputType.text
                                    ),
                                  ],
                                ) : SizedBox(),

                                data.elementType == Const.typeDropDown ? Column(
                                  children: [
                                    SizedBox(height: h * 0.03),
                                    Obx(() {
                                      return DropdownButtonFormField2(
                                        isExpanded: true,
                                        buttonHeight: h * 0.025,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: vpnBlueOpacity,
                                          errorMaxLines: 2,
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: controller.showBorder![index] == true ? vpnGreyopacity : vpnBlueOpacity)),
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          errorStyle: AppStyle.textStyleNotoSansRegularGrey11,
                                          counterText: ""),
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        iconSize: 25,
                                        iconDisabledColor: vpnGreyopacity,
                                        iconEnabledColor: vpnGrey,
                                        onTap: () {
                                          controller.showBorder![index] = true;
                                          debugPrint('onTap => controller.showBorder : ${controller.showBorder}');
                                        },
                                        value: data.value,
                                        onChanged: (value) {
                                          debugPrint('CustomDropDownWidget => value : $value');
                                          controller.updateViewDataList.value.forEach((element) {
                                            if (data.elementType == Const.typeTextField || data.elementType == Const.typeDateTime) {
                                            } else {
                                              controller.valueList[index] = value.toString();
                                            }
                                          });
                                          controller.showBorder![index] = false;
                                          debugPrint('onChanged => controller.showBorder : ${controller.showBorder}');
                                        },
                                        dropdownElevation: 1,
                                        items: data.options![0].map((description, value) {
                                          // debugPrint('DropdownMenuItem => description : $description');
                                          // debugPrint('DropdownMenuItem => value : $value');
                                          return MapEntry(
                                            description,
                                            DropdownMenuItem(
                                              value: description,
                                              child: Text(
                                                  value, style: value == data.label ? AppStyle.textStyleNotoSansGreyOpacity15 : AppStyle.textStyleNotoSansRegularGrey15,
                                                  overflow: TextOverflow.ellipsis
                                              )));
                                        }).values.toList(),
                                      );
                                    })

                                  ],
                                ) : SizedBox(),

                                data.elementType == Const.typeDateTime ? Column(
                                  children: [
                                    SizedBox(height: h * 0.03),
                                    CommonTextField(
                                        label: data.label,
                                        readOnly: true,
                                        controller: controller.keyTECs![index],
                                        onChange: (onChangeVal) {
                                          controller.updateViewDataList.value.forEach((element) {
                                            if (data.elementType == Const.typeDateTime || data.elementType == Const.typeTextField) {
                                              controller.keyTECs![index].text = onChangeVal.toString();
                                            } else {
                                              controller.keyTECs![index].text = '';
                                            }
                                          });
                                        },
                                        validator: (val) => checkEmpty(controller.keyTECs![index].text, Const.txtLblPurchaseDate),
                                        onTap: () {
                                          datePickerDialog(context).then((selectedDate) {
                                            debugPrint('selectedDate : $selectedDate');
                                            if (selectedDate != null) {
                                              debugPrint('selectedDate : $selectedDate');
                                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                                              debugPrint('formattedDate : $formattedDate');
                                              controller.updateViewDataList.value.forEach((element) {
                                                if (data.elementType == Const.typeDateTime || data.elementType == Const.typeTextField) {
                                                  controller.keyTECs![index].text = formattedDate.toString();
                                                } else {
                                                  controller.keyTECs![index].text = '';
                                                }
                                              });
                                            }
                                          });
                                        },
                                        textInputAction: TextInputAction.next,
                                        textInputType: TextInputType.text),
                                  ],
                                ) : SizedBox()
                              ],
                            );
                          }
                      ),
                      SizedBox(height: h * 0.12)

                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    color: cWhite,
                    height: h * 0.1,
                    child: CustomButton(
                      title: Const.btnLblAddCategory,
                      onPressed: () {
                        controller.onDone()!.then((personValue) {
                          logger.log('personValue : $personValue');
                          // personValue.forEach((element) {
                          //   var a = json.encode(element.dropDownItem);
                          //  debugPrint("a : ${a}");
                          // });

                          // personValue.forEach(print);
                          // personValue.forEach((element) {
                          //   logger.log(''
                          //       'label : ${element.label} \n '
                          //       'key : ${element.key} \n '
                          //       'type : ${element.type} \n '
                          //       'selectedItem : ${element.selectedItem} \n '
                          //       'dropDownItem : ${element.dropDownItem} \n '
                          //       'value : ${element.value} \n '
                          //       'validationType : ${element.validationType}'
                          //       '');
                          //   // if(element.type == Const.typeDateTime || element.type == Const.typeTextField){
                          //   //   logger.log('type : ${element.type} || type : ${element.type} || value : ${element.value}');
                          //   // }
                          //   // else{
                          //   //   logger.log('type : ${element.type} || selectedItem : ${element.selectedItem}');
                          //   // }
                          // });
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        onLoading: const CustomProgressBar(),
        onEmpty: CustomLabelWidget(title: Const.lblDataNotFound),
        onError: (e) => CustomLabelWidget(title: e),

      ),
    );
  }
}
