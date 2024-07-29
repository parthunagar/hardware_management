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


class UpdateDynamicViewPage extends GetView<UpdateDynamicViewLogic> {
  final logic = Get.find<UpdateDynamicViewLogic>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
    appBar: CustomAppBar(
      title: 'Upgrade Form',
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
                controller.callApi();
              },
              child: Icon(Icons.view_agenda, color: vpnBlue,)),
        )
      ],
    ),
    body: controller.obx((data) => Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: controller.dropdownList!.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return controller.dropdownList![index];
                //   },
                // ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // itemCount: controller.containerList!.length,
                  itemCount: controller.updateViewDataList.value.length ,
                  itemBuilder: (BuildContext context, int index) {
                    // debugPrint('value : ${controller.updateViewDataList.value[index].value}');
                    // return controller.containerList![index];
                    ///
                    // var keyController = TextEditingController();
                    ///
                      var data = controller.updateViewDataList.value[index];
                    //   controller.keyTECs!.add(keyController);
                      ////
                      // if(data.type == Const.typeTextField || data.type == Const.typeDateTime) {
                      //   keyController.text = data.value!;
                      //   // debugPrint('keyController.text : ${keyController.text}');
                      //   controller.typeList.add(data.type);
                      //   controller.valueList.add(keyController.text);
                      //   // debugPrint('controller.valueList : ${controller.valueList}');
                      //   controller.keyList.add(data.key);
                      //   controller.selectedItemList.add('');
                      //   controller.itemList.add(['']);
                      //   controller.createTestObj.add('');
                      // }
                      // if(data.type == Const.typeDropDown) {
                      //   controller.itemList.add(data.dropDownItem);
                      //   controller.selectedItemList.add(data.selectedItem!);
                      //   controller.typeList.add(data.type);
                      //   controller.keyList.add(data.key);
                      //   controller.valueList.add('');
                      //   controller.createTestObj.add(data.selectedItem);
                      // }
                      // controller.setData!.value = true;
                    // }

                    return GestureDetector(
                      onTap: () {
                        // debugPrint('data : $data');
                      },
                      child: Column(
                        children: [
                          data.type == Const.typeTextField ? Column(
                            children: [
                              SizedBox(height: h * 0.03),
                              CommonTextField(
                                label: data.key,
                                onChange: (onChangeVal) {
                                  controller.updateViewDataList.value.forEach((element) {
                                    if(data.type == Const.typeTextField || data.type == Const.typeDateTime) {
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
                                // maxLines: 2,
                                controller: controller.keyTECs![index],
                                // suffixText: data.key == "${Const.lblPixel}" ? 'p' : '',
                                // inputFormatters: data.validationType == Const.typeValidationNumeric ? [
                                //   FilteringTextInputFormatter.digitsOnly,
                                // ] : data.validationType == Const.typeValidationContact ? [
                                //   FilteringTextInputFormatter.digitsOnly,
                                //   LengthLimitingTextInputFormatter(10)
                                // ] : data.validationType == Const.typeValidationDecimal ? [
                                //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                                // ] : [],
                                textInputType: TextInputType.text),
                            ],
                          ) : SizedBox(),

                          data.type == Const.typeDropDown ?  Column(
                            children: [
                              SizedBox(height: h * 0.03),
                              DropdownButtonFormField2(
                                isExpanded: true,
                                buttonHeight: h * 0.025,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: vpnBlueOpacity,
                                  errorMaxLines: 2,
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: controller.showBorder == true ? vpnGreyopacity : vpnBlueOpacity)),
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
                                  controller.onTypeTap(RxBool(true));
                                },
                                value: data.selectedItem ,//?? selectedValue,
                                onChanged: (value) {
                                  debugPrint('CustomDropDownWidget => value : $value');
                                  controller.updateViewDataList.value.forEach((element) {
                                    if(data.type == Const.typeTextField || data.type == Const.typeDateTime) {
                                      controller.createTestObj.add('');
                                    }else {
                                      controller.createTestObj[index] = value.toString();
                                    }
                                  });
                                  debugPrint('CustomDropDownWidget => selectedItem : ${data.selectedItem}');
                                  try {
                                    controller.onDropDownChanged(RxString(value.toString()));
                                    debugPrint('CustomDropDownWidget => value 2 : $value');
                                  }
                                  catch (e) {
                                    debugPrint('CustomDropDownWidget => ERROR : $e');
                                  }
                                  controller.onTypeTap(RxBool(false));
                                },
                                dropdownElevation: 1,
                                items: data.dropDownItem!.map((String value) {
                                  return DropdownMenuItem<RxString>(
                                      value: value.obs,
                                      child: Text(value, style: value == data.key ? AppStyle.textStyleNotoSansGreyOpacity15 : AppStyle.textStyleNotoSansRegularGrey15, overflow: TextOverflow.ellipsis));
                                }).toList(),

                              )

                              ///COMMENT
                              // CustomDropDownWidget(
                              //   hintText: label,
                              //   items: items!,
                              //   showBorder: showBorder!.value,
                              //   onTap: () {
                              //     onTypeTap(RxBool(true));
                              //   },
                              //   selectedValue: selectedItem,
                              //   onChanged: (value) {
                              //     // controller.selectedMonitorType = value;
                              //     debugPrint('CustomDropDownWidget => value : $value');
                              //     try {
                              //       onDropDownChanged(RxString(value.toString()));
                              //       debugPrint('CustomDropDownWidget => value 2 : $value');
                              //     }
                              //     catch (e) {
                              //       debugPrint('CustomDropDownWidget => ERROR : $e');
                              //     }
                              //     onTypeTap(RxBool(false));
                              //   },
                              // ),
                            ],
                          )  : SizedBox(),

                          data.type == Const.typeDateTime ?
                          Column(
                            children: [
                              SizedBox(height: h * 0.03),
                              CommonTextField(
                                  label: data.key,
                                  readOnly: true,
                                  controller:  controller.keyTECs![index],
                                  onChange: (onChangeVal){
                                    controller.updateViewDataList.value.forEach((element) {
                                      if(data.type == Const.typeDateTime || data.type == Const.typeTextField) {
                                        // controller.valueList[index] = onChangeVal.toString();
                                        controller.keyTECs![index].text = onChangeVal.toString();
                                      }else {
                                        // controller.valueList.add('');
                                        controller.keyTECs![index].text = '';
                                      }
                                    });

                                  },
                                  validator: (val) => checkEmpty( controller.keyTECs![index].text,Const.txtLblPurchaseDate),
                                  onTap: () {
                                    datePickerDialog(context).then((selectedDate) {
                                      debugPrint('selectedDate : $selectedDate');
                                      if(selectedDate != null) {
                                        debugPrint('selectedDate : $selectedDate');
                                        String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                                        debugPrint('formattedDate : $formattedDate');
                                        controller.updateViewDataList.value.forEach((element) {
                                          if(data.type == Const.typeDateTime || data.type == Const.typeTextField) {
                                            // controller.valueList[index] =  controller.keyTECs![index].text.toString();
                                            controller.keyTECs![index].text = formattedDate.toString();
                                          }else {
                                            // controller.valueList.add('');
                                            controller.keyTECs![index].text = '';
                                          }
                                        });
                                      }
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text),
                            ],
                          ) :
                              SizedBox()

                        ],
                      ),
                    );
                  },
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
                  // controller.createTestObj.clear();
                  if(controller.createTestObj.isEmpty) {
                    controller.updateViewDataList.value.forEach((element) {
                      controller.createTestObj.add(element.selectedItem);

                    });
                  }
                  debugPrint('controller.createTestObj : ${controller.createTestObj}');
                  controller. onDone()!.then((personValue) {
                    logger.log('personValue : $personValue');
                    personValue.forEach((element) {
                      if(element.type == Const.typeDateTime || element.type == Const.typeTextField){
                        logger.log('type : ${element.type} || value : ${element.value}');
                      }
                      else{
                        logger.log('type : ${element.type} || selectedItem : ${element.selectedItem}');
                      }

                    });
                  });

                },
              ),
            ),
          ),
        ],
      ),
    ),
      onLoading: const CustomProgressBar(),
      onEmpty:   CustomLabelWidget(title: Const.lblDataNotFound),
      onError: (e) => CustomLabelWidget(title: e),
    )

    );
  }
}

