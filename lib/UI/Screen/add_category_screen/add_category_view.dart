import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Widget/common_text_field.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_dialog.dart';
import 'package:vpn_scanner/UI/Widget/custom_dropdown.dart';
import 'package:vpn_scanner/UI/Widget/text_button.dart';
import 'package:vpn_scanner/Utils/app_style.dart';
import 'package:intl/intl.dart';
import 'package:vpn_scanner/Utils/validation.dart';
import 'add_category_controller.dart';

class AddCategoryWidget extends GetView<AddCategoryLogic> {
  const AddCategoryWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<AddCategoryLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      // key: controller.scaFoldKey,
      // appBar: AppBar(title: const Text(Const.appBarTitleAddCategory)),
      appBar: CustomAppBar(
        title: '${controller.categoryTitle} Form', // Const.appBarTitleAddCategory,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(Assets.backArrow)),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
          child: Stack(
            children: [
              SingleChildScrollView(
                child:
                // controller.categoryTitle!.value == 'CPU' ?
                controller.categoryTitle!.value == Const.ctCPU ?
                Column(
                  children: [
                    CommonTextField(
                        label: Const.hCompanyNameWithAsterisk,
                        controller: controller.cCompanyNameController,
                        validator: (val) => checkEmpty(controller.cCompanyNameController!.text,Const.txtLblCompanyName),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.cModelNOController,
                        validator: (val) => checkEmpty(controller.cModelNOController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        controller: controller.cSerialNoController,
                        validator: (val) => checkEmpty(controller.cSerialNoController!.text,Const.txtLblSerialNo),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hHardDiskTypeWithAsterisk,
                        items: controller.hardDiskType,
                        validator: (val) => checkEmpty(controller.selectedHardDiskType.value,Const.hHardDiskTypeWithAsterisk),
                        showBorder: controller.showHardDiskBorder.value,
                        onTap: () {
                          controller.onHardDiskTypeTap(RxBool(true));
                        },
                        selectedValue: controller.selectedHardDiskType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try {
                            controller.onHardDiskTypeDropDownChanged(RxString(value.toString()));
                          }
                          catch(e) {
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onHardDiskTypeTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return Row(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: CommonTextField(
                                label: Const.hHardDiskSizeWithAsterisk,
                                controller: controller.cHardDiskSize1Controller,
                                validator: (val) => checkEmpty(controller.cHardDiskSize1Controller!.text,Const.hHardDiskSizeWithoutAsterisk),
                                maxLength: 2,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                textInputType: TextInputType.number),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hHardDiskSizeWithAsterisk,
                              validator: (val) => checkEmpty(controller.selectedHardDiskSize.value,Const.hHardDiskSizeWithAsterisk),
                              items: controller.hardDiskSize,
                              showBorder: controller.showHardDiskSizeBorder.value,
                              onTap: () {
                                controller.onHardDiskSizeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedHardDiskSize,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try {
                                  controller.onHardDiskSizeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onHardDiskSizeTap(RxBool(false));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hHardDiskTypeOptional,
                        items: controller.hardDiskOptionalType,
                        showBorder: controller.showHardDiskOptionalBorder.value,
                        onTap: () {
                          controller.onHardDiskTypeOptionalTap(RxBool(true));
                        },
                        selectedValue: controller.selectedHardDiskOptionalType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onHardDiskTypeOptionalDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onHardDiskTypeOptionalTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return Row(
                        children: [
                          Expanded(
                            child: CommonTextField(
                                label: Const.hHardDiskSizeOptional,
                                maxLength: 2,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                controller: controller.cHardDiskSize2Controller,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hHardDiskSizeOptional,
                              items: controller.hardDiskOptionalSize,
                              showBorder: controller.showHardDiskSizeOptionalBorder.value,
                              onTap: () {
                                controller.onHardDiskOptionalSizeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedHardDiskOptionalSize,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onHardDiskOptionalSizeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onHardDiskOptionalSizeTap(RxBool(false));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hRamTypeWithAsterisk,
                        items: controller.ramType,
                        validator: (val) => checkEmpty(controller.selectedRamType.value,Const.hRamTypeWithAsterisk),
                        showBorder: controller.showRamBorder.value,
                        onTap: () {
                          controller.onRamTypeTap(RxBool(true));
                        },
                        selectedValue: controller.selectedRamType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onRamTypeDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onRamTypeTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hRamSizeWithAsterisk,
                              validator: (val) => checkEmpty(controller.selectedRamSize.value,Const.hRamSizeWithAsterisk),
                              items: controller.ramSize,
                              showBorder: controller.showRamSizeBorder.value,
                              onTap: () {
                                controller.onRamSizeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedRamSize,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onRamSizeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onRamSizeTap(RxBool(false));
                              },
                            ),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hRamSizeWithAsterisk,
                              validator: (val) => checkEmpty(controller.selectedRamSizeType.value,Const.hRamSizeWithAsterisk),
                              items: controller.ramSizeType,
                              showBorder: controller.showRamSizeTypeBorder.value,
                              onTap: () {
                                controller.onRamSizeTypeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedRamSizeType,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onRamSizeTypeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onRamSizeTypeTap(RxBool(false));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hProcessorWithAsterisk,
                        items: controller.processorType,
                        validator: (val) => checkEmpty(controller.selectedProcessorType.value,Const.hProcessorWithAsterisk),
                        showBorder: controller.showProcessorBorder.value,
                        onTap: () {
                          controller.onProcessorTypeTap(RxBool(true));
                        },
                        selectedValue: controller.selectedProcessorType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onProcessorTypeDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onProcessorTypeTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        readOnly: true,
                        controller: controller.cPurchaseDateController,
                        validator: (val) => checkEmpty(controller.cPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        onTap: () {
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.cPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        controller: controller.cSellerNameController,
                        validator: (val) => isValidName(controller.cSellerNameController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.cWarrantyGuaranteeController,
                        validator: (val) => checkEmpty(controller.cWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.cHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                :
                // controller.categoryTitle!.value == 'Laptops' ?
                controller.categoryTitle!.value == Const.ctLaptops ?
                Column(
                  children: [
                    CommonTextField(
                        label: Const.hCompanyNameWithAsterisk,
                        controller: controller.lCompanyNameController,
                        validator: (val) => checkEmpty(controller.lCompanyNameController!.text,Const.txtLblCompanyName),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.lModelNOController,
                        validator: (val) => checkEmpty(controller.lModelNOController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),

                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        controller: controller.lSerialNoController,
                        validator: (val) => checkEmpty(controller.lSerialNoController!.text,Const.txtLblSerialNo),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hHardDiskTypeWithAsterisk,
                        items: controller.hardDiskType,
                        validator: (val) => checkEmpty(controller.selectedHardDiskType.value,Const.hHardDiskTypeWithAsterisk),
                        showBorder: controller.showHardDiskBorder.value,
                        onTap: () {
                          controller.onHardDiskTypeTap(RxBool(true));
                        },
                        selectedValue: controller.selectedHardDiskType,
                        onChanged: (value) {

                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onHardDiskTypeDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onHardDiskTypeTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return Row(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: CommonTextField(
                                label: Const.hHardDiskSizeWithAsterisk,//Const.txtLblSerialNo,
                                maxLength: 2,
                                controller: controller.lHardDiskSize1Controller,
                                validator: (val) => checkEmpty(controller.lHardDiskSize1Controller!.text,Const.hHardDiskSizeWithoutAsterisk),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hHardDiskSizeWithAsterisk,
                              items: controller.hardDiskSize,
                              showBorder: controller.showHardDiskSizeBorder.value,
                              validator: (val) => checkEmpty(controller.selectedHardDiskSize.value,Const.hHardDiskSizeWithoutAsterisk),
                              onTap: () {
                                controller.onHardDiskSizeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedHardDiskSize,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onHardDiskSizeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onHardDiskSizeTap(RxBool(false));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hHardDiskTypeOptional,
                        items: controller.hardDiskOptionalType,
                        showBorder: controller.showHardDiskOptionalBorder.value,
                        onTap: () {
                          controller.onHardDiskTypeOptionalTap(RxBool(true));
                        },
                        selectedValue: controller.selectedHardDiskOptionalType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onHardDiskTypeOptionalDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onHardDiskTypeOptionalTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return Row(
                        children: [
                          Expanded(
                            child: CommonTextField(
                                maxLength: 2,
                                label: Const.hHardDiskSizeOptional,
                                controller: controller.lHardDiskSize2Controller,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hHardDiskSizeOptional,
                              items: controller.hardDiskOptionalSize,
                              showBorder: controller.showHardDiskSizeOptionalBorder.value,
                              onTap: () {
                                controller.onHardDiskOptionalSizeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedHardDiskOptionalSize,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onHardDiskOptionalSizeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onHardDiskOptionalSizeTap(RxBool(false));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hRamTypeWithAsterisk,
                        items: controller.ramType,
                        showBorder: controller.showRamBorder.value,
                        validator: (val) => checkEmpty(controller.selectedRamType.value, Const.hRamTypeWithAsterisk),
                        onTap: () {
                          controller.onRamTypeTap(RxBool(true));
                        },
                        selectedValue: controller.selectedRamType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onRamTypeDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onRamTypeTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hRamSizeWithAsterisk,
                              items: controller.ramSize,
                              validator: (val) => checkEmpty(controller.selectedRamSize.value,Const.hRamSizeWithAsterisk),
                              showBorder: controller.showRamSizeBorder.value,
                              onTap: () {
                                controller.onRamSizeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedRamSize,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onRamSizeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onRamSizeTap(RxBool(false));
                              },
                            ),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hRamSizeWithAsterisk,
                              validator: (val) => checkEmpty(controller.selectedRamSizeType.value,Const.hRamSizeWithAsterisk),
                              items: controller.ramSizeType,
                              showBorder: controller.showRamSizeTypeBorder.value,
                              onTap: () {
                                controller.onRamSizeTypeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedRamSizeType,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onRamSizeTypeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onRamSizeTypeTap(RxBool(false));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hProcessorWithAsterisk,
                        validator: (val) => checkEmpty(controller.selectedProcessorType.value,Const.hProcessorWithAsterisk),
                        items: controller.processorType,
                        showBorder: controller.showProcessorBorder.value,
                        onTap: () {
                          controller.onProcessorTypeTap(RxBool(true));
                        },
                        selectedValue: controller.selectedProcessorType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onProcessorTypeDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onProcessorTypeTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        controller: controller.lPurchaseDateController,
                        validator: (val) => checkEmpty(controller.lPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        readOnly: true,
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.lPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        controller: controller.lSellerNameController,
                        validator: (val) => isValidName(controller.lSellerNameController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.lWarrantyGuaranteeController,
                        validator: (val) => checkEmpty(controller.lWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.lHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                :
                // controller.categoryTitle!.value == 'Hard Disk' ?
                controller.categoryTitle!.value == Const.ctHardDisk ?
                Column(
                  children: [
                    CommonTextField(
                        label: Const.hCompanyNameWithAsterisk,
                        controller: controller.hdCompanyNameController,
                        validator: (val) => checkEmpty(controller.hdCompanyNameController!.text,Const.txtLblCompanyName),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),

                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.hdModelNoController,
                        validator: (val) => checkEmpty(controller.hdModelNoController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        controller: controller.hdSerialNoController,
                        validator: (val) => checkEmpty(controller.hdSerialNoController!.text,Const.txtLblSerialNo),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hHardDiskTypeWithAsterisk,
                        items: controller.hardDiskType,
                        validator: (val) => checkEmpty(controller.selectedHardDiskType.value,Const.hHardDiskTypeWithAsterisk),
                        showBorder: controller.showHardDiskBorder.value,
                        onTap: () {
                          controller.onHardDiskTypeTap(RxBool(true));
                        },
                        selectedValue: controller.selectedHardDiskType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onHardDiskTypeDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onHardDiskTypeTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return Row(
                        children: [
                          Expanded(
                            child: CommonTextField(
                                label: Const.hHardDiskSizeWithAsterisk,//Const.txtLblSerialNo,
                                controller: controller.hdHardDiskSizeController,
                                validator: (val) => checkEmpty(controller.hdHardDiskSizeController!.text,Const.hHardDiskSizeWithoutAsterisk),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                maxLength: 2,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hHardDiskSizeWithAsterisk,
                              validator: (val) => checkEmpty(controller.selectedHardDiskSize.value,Const.hHardDiskSizeWithAsterisk),
                              items: controller.hardDiskSize,
                              showBorder: controller.showHardDiskSizeBorder.value,
                              onTap: () {
                                controller.onHardDiskSizeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedHardDiskSize,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onHardDiskSizeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onHardDiskSizeTap(RxBool(false));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        controller: controller.hdPurchaseDateController,
                        validator: (val) => checkEmpty(controller.hdPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        // controller: controller.purchaseDateController,
                        readOnly: true,
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.hdPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        controller: controller.hdSellerNameController,
                        validator: (val) => isValidName(controller.hdSellerNameController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.hdWarrantyGuaranteeController,
                        validator: (val) => isValidName(controller.hdWarrantyGuaranteeController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.hdHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )
                :

                // controller.categoryTitle!.value == 'Mobile Devices' ?
                controller.categoryTitle!.value == Const.ctMobileDevices ?
                Column(
                  children: [
                    CommonTextField(
                        label: Const.hCompanyNameWithAsterisk,
                        controller: controller.mdCompanyNameController,
                        validator: (val) => checkEmpty(controller.mdCompanyNameController!.text,Const.txtLblCompanyName),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.mdModelNoController,
                        validator: (val) => checkEmpty(controller.mdModelNoController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        controller: controller.mdSerialNoController,
                        validator: (val) => checkEmpty(controller.mdSerialNoController!.text,Const.txtLblSerialNo),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hRamSizeWithAsterisk,
                              validator: (val) => checkEmpty(controller.selectedRamSize.value,Const.hRamSizeWithAsterisk),
                              items: controller.ramSize,
                              showBorder: controller.showRamSizeBorder.value,
                              onTap: () {
                                controller.onRamSizeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedRamSize,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onRamSizeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onRamSizeTap(RxBool(false));
                              },
                            ),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hRamSizeWithAsterisk,
                              validator: (val) => checkEmpty(controller.selectedRamSizeType.value,Const.hRamSizeWithAsterisk),
                              items: controller.ramSizeType,
                              showBorder: controller.showRamSizeTypeBorder.value,
                              onTap: () {
                                controller.onRamSizeTypeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedRamSizeType,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onRamSizeTypeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onRamSizeTypeTap(RxBool(false));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return Row(
                        children: [
                          Expanded(
                            child: CommonTextField(
                                label: Const.hStorageSizeWithAsterisk,
                                maxLength: 3,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                controller: controller.mdStorageSizeController,
                                validator: (val) => checkEmpty(controller.mdStorageSizeController!.text,Const.hStorageSizeWithAsterisk),
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number),
                          ),
                          SizedBox(width: w * 0.04),
                          Expanded(
                            child: CustomDropDownWidget(
                              hintText: Const.hStorageSizeWithAsterisk,
                              validator: (val) => checkEmpty(controller.selectedStorageSize.value,Const.hStorageSizeWithAsterisk),
                              items: controller.storageSize,
                              showBorder: controller.showStorageSizeBorder.value,
                              onTap: () {
                                controller.onStorageSizeTap(RxBool(true));
                              },
                              selectedValue: controller.selectedStorageSize,
                              onChanged: (value) {
                                debugPrint('CustomDropDownWidget => value : $value');
                                try{
                                  controller.onStorageSizeDropDownChanged(RxString(value.toString()));
                                }
                                catch(e){
                                  debugPrint('CustomDropDownWidget => ERROR : $e');
                                }
                                controller.onStorageSizeTap(RxBool(false));
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hVersionWithAsterisk,
                        controller: controller.mdVersionController,
                        validator: (val) => checkEmpty(controller.mdVersionController!.text,Const.hVersionWithAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hDeviceTypeWithAsterisk,
                        validator: (val) => checkEmpty(controller.selectedDeviceType.value,Const.hDeviceTypeWithAsterisk),
                        items: controller.deviceType,
                        showBorder: controller.showDeviceTypeBorder.value,
                        onTap: () {
                          controller.onDeviceTypeTap(RxBool(true));
                        },
                        selectedValue: controller.selectedDeviceType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onDeviceTypeDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onDeviceTypeTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        readOnly: true,
                        controller: controller.mdPurchaseDateController,
                        validator: (val) => checkEmpty(controller.mdPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.mdPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        controller: controller.mdSellerNameController,
                        validator: (val) => isValidName(controller.mdSellerNameController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.mdWarrantyGuaranteeController,
                        validator: (val) => checkEmpty(controller.mdWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.mdHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                :
                // controller.categoryTitle!.value == 'Monitors' ?
                controller.categoryTitle!.value == Const.ctMonitors ?
                Column(
                  children: [
                    CommonTextField(
                      label: Const.hCompanyNameWithAsterisk,
                      validator: (val) => checkEmpty(controller.mCompanyNameController!.text,Const.txtLblCompanyName),
                      controller: controller.mCompanyNameController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),

                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.mModelNOController,
                        validator: (val) => checkEmpty(controller.mModelNOController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),

                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        validator: (val) => checkEmpty(controller.mSerialNoController!.text,Const.txtLblSerialNo),
                        controller: controller.mSerialNoController,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hType,
                        items: controller.monitorType,
                        validator: (val) => checkEmpty(controller.selectedMonitorType.value,Const.hType),
                        showBorder: controller.showBorder.value,
                        onTap: () {
                          controller.onMonitorTap(RxBool(true));
                        },
                        selectedValue: controller.selectedMonitorType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onMonitorDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onMonitorTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    Row(
                      children: [
                        Expanded(
                          child: CommonTextField(
                              label: Const.hSizeWithAsterisk,
                              validator: (val) => checkEmpty(controller.mSizeController!.text,Const.hSizeWithoutAsterisk),
                              maxLength: 2,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              controller: controller.mSizeController,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.number),
                        ),
                        SizedBox(width: w * 0.04),
                        Text(Const.hInInches,style: AppStyle.textStyleNotoSansSemiBoldGrey13,)
                      ],
                    ),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        validator: (val) => checkEmpty(controller.mPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        controller: controller.mPurchaseDateController,
                        readOnly: true,
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.mPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        validator: (val) => isValidName(controller.mSellerNameController!.text),
                        controller: controller.mSellerNameController,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.mWarrantyGuaranteeController,
                        validator: (val) => checkEmpty(controller.mWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.mHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                :
                // controller.categoryTitle!.value == 'Key Boards' ?
                controller.categoryTitle!.value == Const.ctKeyBoards ?
                Column(
                  children: [
                    CommonTextField(
                        label: Const.hCompanyNameWithAsterisk,
                        controller: controller.kbCompanyNameController,
                        validator: (val) => checkEmpty(controller.kbCompanyNameController!.text,Const.txtLblCompanyName),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.kbModelNoController,
                        validator: (val) => checkEmpty(controller.kbModelNoController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        controller: controller.kbSerialNoController,
                        validator: (val) => checkEmpty(controller.kbSerialNoController!.text,Const.txtLblSerialNo),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        readOnly: true,
                        controller: controller.kbPurchaseDateController,
                        validator: (val) => checkEmpty(controller.kbPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.kbPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        controller: controller.kbSellerNameController,
                        validator: (val) => isValidName(controller.kbSellerNameController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.kbWarrantyGuaranteeController,
                        validator: (val) => checkEmpty(controller.kbWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.kbHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                :
                // controller.categoryTitle!.value == 'Mouses' ?
                controller.categoryTitle!.value == Const.ctMouses ?
                Column(
                  children: [
                    CommonTextField(
                        label: Const.hCompanyNameWithAsterisk,
                        controller: controller.moCompanyNameController,
                        validator: (val) => checkEmpty(controller.moCompanyNameController!.text,Const.txtLblCompanyName),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),

                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.moModelNoController,
                        validator: (val) => checkEmpty(controller.moModelNoController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        controller: controller.moSerialNoController,
                        validator: (val) => checkEmpty(controller.moSerialNoController!.text,Const.txtLblSerialNo),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        controller: controller.moPurchaseDateController,
                        validator: (val) => checkEmpty(controller.moPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        readOnly: true,
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.moPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        controller: controller.moSellerNameController,
                        validator: (val) => isValidName(controller.moSellerNameController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.moWarrantyGuaranteeController,
                        validator: (val) => checkEmpty(controller.moWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.moHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                :
                // controller.categoryTitle!.value == 'CCTV' ?
                controller.categoryTitle!.value == Const.ctCCTV ?
                Column(
                  children: [
                    CommonTextField(
                        label: Const.hCompanyNameWithAsterisk,
                        controller: controller.cctvCompanyNameController,
                        validator: (val) => checkEmpty(controller.cctvCompanyNameController!.text,Const.txtLblCompanyName),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.cctvModelNOController,
                        validator: (val) => checkEmpty(controller.cctvModelNOController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        controller: controller.cctvSerialNoController,
                        validator: (val) => checkEmpty(controller.cctvSerialNoController!.text,Const.txtLblSerialNo),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label:  Const.hPixelWithAsterisk,
                        controller: controller.cctvPixelController,
                        validator: (val) => checkEmpty(controller.cctvPixelController!.text,Const.hPixelWithAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label:  Const.hAddLocationWithAsterisk,
                        controller: controller.cctvAddLocationController,
                        validator: (val) => checkEmpty(controller.cctvAddLocationController!.text,Const.hAddLocationWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        controller: controller.cctvPurchaseDateController,
                        validator: (val) => checkEmpty(controller.cctvPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        readOnly: true,
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.cctvPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        controller: controller.cctvSellerNameController,
                        validator: (val) => isValidName(controller.cctvSellerNameController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.cctvWarrantyGuaranteeController,
                        validator: (val) => checkEmpty(controller.cctvWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.cctvHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                :
                // controller.categoryTitle!.value == 'Headphones' ?
                controller.categoryTitle!.value == Const.ctHeadphones ?
                Column(
                  children: [
                    CommonTextField(
                        label: Const.hCompanyNameWithAsterisk,
                        controller: controller.hpCompanyNameController,
                        validator: (val) => checkEmpty(controller.hpCompanyNameController!.text,Const.txtLblCompanyName),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),

                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.hpModelNOController,
                        validator: (val) => checkEmpty(controller.hpModelNOController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),

                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        controller: controller.hpSerialNoController,
                        validator: (val) => checkEmpty(controller.hpSerialNoController!.text,Const.txtLblSerialNo),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        controller: controller.hpPurchaseDateController,
                        validator: (val) => checkEmpty(controller.hpPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        readOnly: true,
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.hpPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        controller: controller.hpSellerNameController,
                        validator: (val) => isValidName(controller.hpSellerNameController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.hpWarrantyGuaranteeController,
                        validator: (val) => checkEmpty(controller.hpWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.hpHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                :
                // controller.categoryTitle!.value == 'Printers' ?
                controller.categoryTitle!.value == Const.ctPrinters ?
                Column(
                  children: [
                    CommonTextField(
                        label: Const.hCompanyNameWithAsterisk,
                        controller: controller.prCompanyNameController,
                        validator: (val) => checkEmpty(controller.prCompanyNameController!.text,Const.txtLblCompanyName),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hModelNoWithAsterisk,
                        controller: controller.prModelNoController,
                        validator: (val) => checkEmpty(controller.prModelNoController!.text,Const.hModelNoWithoutAsterisk),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSerialNoWithAsterisk,
                        controller: controller.prSerialNoController,
                        validator: (val) => checkEmpty(controller.prSerialNoController!.text,Const.txtLblSerialNo),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        controller: controller.prPurchaseDateController,
                        validator: (val) => checkEmpty(controller.prPurchaseDateController!.text,Const.txtLblPurchaseDate),
                        readOnly: true,
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                              controller.prPurchaseDateController!.text = formattedDate.toString();
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        controller: controller.prSellerNameController,
                        validator: (val) => isValidName(controller.prSellerNameController!.text),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hGWWithAsterisk,
                        controller: controller.prWarrantyGuaranteeController,
                        validator: (val) => checkEmpty(controller.prWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        controller: controller.prHistoryController,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                :
                // controller.categoryTitle!.value == 'Seller' ?
                controller.categoryTitle!.value == Const.ctSeller ?
                Column(
                  children: [
                    CommonTextField(
                      label: Const.hSellerNameWithAsterisk,
                      controller: controller.sSellerNameController,
                      validator: (val) => isValidName(controller.sSellerNameController!.text),
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                      label:  Const.hShopNameWithAsterisk,
                      controller: controller.sCompanyNameController,
                      validator: (val) => checkEmpty(controller.sCompanyNameController!.text,Const.hShopNameWithoutAsterisk),
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                      label: Const.hContact1WithAsterisk,
                      controller: controller.sContact1Controller,
                      validator: (val) => validateMobile(controller.sContact1Controller!.text,Const.hContact1WithAsterisk),
                      textInputAction: TextInputAction.next,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^(?:[+0]9)?[0-9]{10}$'))],
                      // textInputType: TextInputType.numberWithOptions(decimal: true),
                      // textInputType: TextInputType.numberWithOptions(decimal: true),
                      textInputType: TextInputType.phone
                    ),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                      label: Const.hContact2Optional,// Const.txtLblSerialNo,
                      validator: (val) => validateMobile(controller.sContact2Controller!.text,Const.hContact2Optional),
                      textInputAction: TextInputAction.next,
                      controller: controller.sContact2Controller,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 10,
                      textInputType: TextInputType.phone),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                      label: Const.hShopAddressWithAsterisk,
                      maxLines: 5,
                      controller: controller.sAddressController,
                      validator: (val) => checkEmpty(controller.sAddressController!.text,Const.hShopAddressWithoutAsterisk),
                      textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                )

                    :
                // controller.categoryTitle!.value == 'Seller' ?
                controller.categoryTitle!.value == Const.ctDataCable ?
                Column(
                  children: [
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hCableTypeWithAsterisk,
                        items: controller.cableType,
                        validator: (val) => checkEmpty(controller.selectedCableType.value,Const.hCableTypeWithAsterisk),
                        showBorder: controller.showCableBorder.value,
                        onTap: () {
                          controller.onCableTypeTap(RxBool(true));
                        },
                        selectedValue: controller.selectedCableType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try {
                            controller.onCableTypeDropDownChanged(RxString(value.toString()));
                          }
                          catch(e) {
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onCableTypeTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                      label: Const.hTotalCableWithAsterisk,
                      controller: controller.dcTotalCableController,
                      validator: (val) => checkEmpty(controller.dcTotalCableController!.text,Const.hTotalCableWithoutAsterisk),
                      textInputAction: TextInputAction.done,
                      maxLength: 3,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputType: TextInputType.number),
                  ],
                )

                // :
                // controller.categoryTitle!.value == 'Seller' ?
                // controller.categoryTitle!.value == Const.ctDeadStock ?
                // Column(
                //   children: [
                //     CommonTextField(
                //         label: Const.hCompanyNameWithAsterisk,
                //         controller: controller.dsCompanyNameController,
                //         validator: (val) => checkEmpty(controller.dsCompanyNameController!.text,Const.txtLblCompanyName),
                //         textInputAction: TextInputAction.next,
                //         textInputType: TextInputType.text),
                //     SizedBox(height: h * 0.03),
                //     CommonTextField(
                //         label: Const.hModelNoWithAsterisk,
                //         controller: controller.dsModelNoController,
                //         validator: (val) => checkEmpty(controller.dsModelNoController!.text,Const.hModelNoWithoutAsterisk),
                //         textInputAction: TextInputAction.next,
                //         textInputType: TextInputType.text),
                //     SizedBox(height: h * 0.03),
                //     CommonTextField(
                //         label: Const.hSerialNoWithAsterisk,
                //         controller: controller.prSerialNoController,
                //         validator: (val) => checkEmpty(controller.prSerialNoController!.text,Const.txtLblSerialNo),
                //         textInputAction: TextInputAction.next,
                //         textInputType: TextInputType.text),
                //     SizedBox(height: h * 0.03),
                //     CommonTextField(
                //         label: Const.txtLblPurchaseDateWithFormat,
                //         controller: controller.prPurchaseDateController,
                //         validator: (val) => checkEmpty(controller.prPurchaseDateController!.text,Const.txtLblPurchaseDate),
                //         readOnly: true,
                //         onTap: (){
                //           datePickerDialog(context).then((selectedDate) {
                //             debugPrint('selectedDate : $selectedDate');
                //             if(selectedDate != null) {
                //               debugPrint('selectedDate : $selectedDate');
                //               String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                //               debugPrint('formattedDate : $formattedDate');
                //               controller.prPurchaseDateController!.text = formattedDate.toString();
                //             }
                //           });
                //         },
                //         textInputAction: TextInputAction.next,
                //         textInputType: TextInputType.text),
                //     SizedBox(height: h * 0.03),
                //     CommonTextField(
                //         label: Const.hSellerNameWithAsterisk,
                //         controller: controller.prSellerNameController,
                //         validator: (val) => isValidName(controller.prSellerNameController!.text),
                //         textInputAction: TextInputAction.next,
                //         textInputType: TextInputType.text),
                //     SizedBox(height: h * 0.03),
                //     CommonTextField(
                //         label: Const.hGWWithAsterisk,
                //         controller: controller.prWarrantyGuaranteeController,
                //         validator: (val) => checkEmpty(controller.prWarrantyGuaranteeController!.text,Const.txtLblWarrantyGuarantee),
                //         textInputAction: TextInputAction.next,
                //         textInputType: TextInputType.text),
                //     SizedBox(height: h * 0.03),
                //     CommonTextField(
                //         label: Const.txtLblHistory,
                //         controller: controller.prHistoryController,
                //         maxLines: 5,
                //         textInputType: TextInputType.text),
                //     SizedBox(height: h * 0.1),
                //   ],
                // )

                :
                Column(
                  children: [
                    CommonTextField(
                      label: Const.txtLblCompanyName,
                      textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                      label: Const.txtLblSerialNo,
                      textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    Obx(() {
                      return CustomDropDownWidget(
                        hintText: Const.hType,
                        items: controller.monitorType,
                        showBorder: controller.showBorder.value,
                        onTap: () {
                          controller.onMonitorTap(RxBool(true));
                        },
                        selectedValue: controller.selectedMonitorType,
                        onChanged: (value) {
                          debugPrint('CustomDropDownWidget => value : $value');
                          try{
                            controller.onMonitorDropDownChanged(RxString(value.toString()));
                          }
                          catch(e){
                            debugPrint('CustomDropDownWidget => ERROR : $e');
                          }
                          controller.onMonitorTap(RxBool(false));
                        },
                      );
                    }),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                      label: Const.txtLblSize,
                      textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblPurchaseDateWithFormat,
                        readOnly: true,
                        onTap: (){
                          datePickerDialog(context).then((selectedDate) {
                            debugPrint('selectedDate : $selectedDate');
                            if(selectedDate != null) {
                              debugPrint('selectedDate : $selectedDate');
                              String formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
                              debugPrint('formattedDate : $formattedDate');
                            }
                          });
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.hSellerNameWithAsterisk,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblWarrantyGuarantee,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        label: Const.txtLblHistory,
                        maxLines: 5,
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.1),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  color: cWhite,
                  height: h * 0.1,
                  child: CustomButton(
                    title: Const.btnLblAddCategory,
                    onPressed: () {
                      validateAndSave();
                      // if(validateEmail(controller.sContact2Controller!.text) != null)
                      debugPrint(' ======> ON CLICK ADD CATEGORY <====== ');
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addMonitors(){
    debugPrint('CompanyName : ${controller.mCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.mSerialNoController!.text}');
    debugPrint('Type : ${controller.selectedMonitorType}');
    debugPrint('Size : ${controller.mSizeController!.text}');
    debugPrint('Purchase Date : ${controller.mPurchaseDateController!.text}');
    debugPrint('Seller name : ${controller.mSellerNameController!.text}');
    debugPrint('W/G : ${controller.mWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.mHistoryController!.text}');
    Const().toast(Const.addMonitorSuccess);
  }

  addCPU() {
    debugPrint('CompanyName : ${controller.cCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.cSerialNoController!.text}');
    debugPrint('Hard disk Type : ${controller.selectedHardDiskType}');
    debugPrint('Hard disk Size 1 : ${controller.cHardDiskSize1Controller!.text}');
    debugPrint('selectedHardDiskSize 1 : ${controller.selectedHardDiskSize}');
    debugPrint('Hard disk Type (Optional) : ${controller.selectedHardDiskOptionalType}');
    debugPrint('Hard disk Size 2 (Optional) : ${controller.cHardDiskSize2Controller!.text}');
    debugPrint('selectedHardDiskOptionalSize : ${controller.selectedHardDiskOptionalSize}');
    debugPrint('RAM Type : ${controller.selectedRamType}');
    debugPrint('Ram Size : ${controller.selectedRamSize}');
    debugPrint('Ram Size Type : ${controller.selectedRamSizeType}');
    debugPrint('Processor Type : ${controller.selectedProcessorType}');
    debugPrint('Purchase Date : ${controller.cPurchaseDateController!.text}');
    debugPrint('Seller Name : ${controller.cSellerNameController!.text}');
    debugPrint('W/G : ${controller.cWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.cHistoryController!.text}');
    Const().toast(Const.addCPUSuccess);
  }

  addLapTop() {
    debugPrint('CompanyName : ${controller.lCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.lSerialNoController!.text}');
    debugPrint('Hard disk Type : ${controller.selectedHardDiskType}');
    debugPrint('Hard disk Size 1 : ${controller.lHardDiskSize1Controller!.text}');
    debugPrint('selectedHardDiskSize 1 : ${controller.selectedHardDiskSize}');
    debugPrint('Hard disk Type (Optional) : ${controller.selectedHardDiskOptionalType}');
    debugPrint('Hard disk Size 2 (Optional) : ${controller.lHardDiskSize2Controller!.text}');
    debugPrint('selectedHardDiskOptionalSize : ${controller.selectedHardDiskOptionalSize}');
    debugPrint('RAM Type : ${controller.selectedRamType}');
    debugPrint('Ram Size : ${controller.selectedRamSize}');
    debugPrint('Ram Size Type : ${controller.selectedRamSizeType}');
    debugPrint('Processor Type : ${controller.selectedProcessorType}');
    debugPrint('Purchase Date : ${controller.lPurchaseDateController!.text}');
    debugPrint('Seller Name : ${controller.lSellerNameController!.text}');
    debugPrint('W/G : ${controller.lWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.lHistoryController!.text}');
    Const().toast(Const.addLaptopSuccess);
  }

  addHardDisk() {
    debugPrint('CompanyName : ${controller.hdCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.hdSerialNoController!.text}');
    debugPrint('Hard disk Type : ${controller.selectedHardDiskType}');
    debugPrint('Hard disk Size : ${controller.hdHardDiskSizeController!.text}');
    debugPrint('selectedHardDiskSize 1 : ${controller.selectedHardDiskSize}');
    debugPrint('Purchase Date : ${controller.hdPurchaseDateController!.text}');
    debugPrint('Seller Name : ${controller.hdSellerNameController!.text}');
    debugPrint('W/G : ${controller.hdWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.hdHistoryController!.text}');
    Const().toast(Const.addHardDiskSuccess);
  }

  addMobileDevice() {
    debugPrint('CompanyName : ${controller.mdCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.mdSerialNoController!.text}');
    debugPrint('Ram Size : ${controller.selectedRamSize}');
    debugPrint('Ram Size Type : ${controller.selectedRamSizeType}');
    debugPrint('Storage Size : ${controller.mdStorageSizeController!.text}');
    debugPrint('Storage Size Type : ${controller.selectedStorageSize}');
    debugPrint('Version : ${controller.mdVersionController!.text}');
    debugPrint('Device Type : ${controller.selectedDeviceType}');
    debugPrint('Purchase Date : ${controller.mdPurchaseDateController!.text}');
    debugPrint('Seller Name : ${controller.mdSellerNameController!.text}');
    debugPrint('W/G : ${controller.mdWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.mdHistoryController!.text}');
    Const().toast(Const.addMobileDeviceSuccess);
  }

  addKeyBoard() {
    debugPrint('CompanyName : ${controller.kbCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.kbSerialNoController!.text}');
    debugPrint('Purchase Date : ${controller.kbPurchaseDateController!.text}');
    debugPrint('Seller Name : ${controller.kbSellerNameController!.text}');
    debugPrint('W/G : ${controller.kbWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.kbHistoryController!.text}');
    Const().toast(Const.addKeyBoardSuccess);
  }

  addMouse() {
    debugPrint('CompanyName : ${controller.moCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.moSerialNoController!.text}');
    debugPrint('Purchase Date : ${controller.moPurchaseDateController!.text}');
    debugPrint('Seller Name : ${controller.moSellerNameController!.text}');
    debugPrint('W/G : ${controller.moWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.moHistoryController!.text}');
    Const().toast(Const.addMouseSuccess);
  }

  addCCTV() {
    debugPrint('CompanyName : ${controller.cctvCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.cctvSerialNoController!.text}');
    debugPrint('Pixel : ${controller.cctvPixelController!.text}');
    debugPrint('Purchase Date : ${controller.cctvPurchaseDateController!.text}');
    debugPrint('Seller Name : ${controller.cctvSellerNameController!.text}');
    debugPrint('W/G : ${controller.cctvWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.cctvHistoryController!.text}');
    Const().toast(Const.addSellerSuccess);
  }

  addHeadPhone() {
    debugPrint('CompanyName : ${controller.hpCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.hpSerialNoController!.text}');
    debugPrint('Purchase Date : ${controller.hpPurchaseDateController!.text}');
    debugPrint('Seller Name : ${controller.hpSellerNameController!.text}');
    debugPrint('W/G : ${controller.hpWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.hpHistoryController!.text}');
    Const().toast(Const.addHeadphoneSuccess);
  }

  addPrinter() {
    debugPrint('CompanyName : ${controller.prCompanyNameController!.text}');
    debugPrint('Serial No. : ${controller.prSerialNoController!.text}');
    debugPrint('Purchase Date : ${controller.prPurchaseDateController!.text}');
    debugPrint('Seller Name : ${controller.prSellerNameController!.text}');
    debugPrint('W/G : ${controller.prWarrantyGuaranteeController!.text}');
    debugPrint('History : ${controller.prHistoryController!.text}');
    Const().toast(Const.addPrinterSuccess);
  }

  addSeller() {
    debugPrint('Seller Name : ${controller.sSellerNameController!.text}');
    debugPrint('CompanyName : ${controller.sCompanyNameController!.text}');
    debugPrint('Contact No. 1 : ${controller.sContact1Controller!.text}');
    debugPrint('Contact No. 2 : ${controller.sContact2Controller!.text}');
    debugPrint('Shop Address : ${controller.sAddressController!.text}');
    Const().toast(Const.addSellerSuccess);
  }


  void validateAndSave() {
    final FormState? form = controller.formKey.currentState;
    if (form!.validate()) {
      addMonitors();
      addCPU();
      addLapTop();
      addHardDisk();
      addMobileDevice();
      addKeyBoard();
      addMouse();
      addCCTV();
      addHeadPhone();
      addPrinter();
      addSeller();
      debugPrint('Form is valid');
    } else {
      debugPrint('Form is invalid');
    }
  }

}
