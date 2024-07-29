import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Widget/common_text_field.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'package:vpn_scanner/UI/Widget/custom_dropdown.dart';
import 'package:vpn_scanner/UI/Widget/text_button.dart';
import 'package:vpn_scanner/Utils/app_style.dart';
import 'edit_category_controller.dart';

class EditCategoryWidget extends GetView<EditCategoryLogic> {
  const EditCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<EditCategoryLogic>();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(title: const Text(Const.appBarTitleEditCategory)),
      appBar: CustomAppBar(
        title: 'Upgrade Form', // Const.appBarTitleAddCategory,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(Assets.backArrow)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
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
                      hintText: 'Type',
                      items: controller.monitorType,
                      showBorder: controller.showBorder.value,
                      onTap: () {
                        controller.onMonitorTap(RxBool(true));
                      },
                      selectedValue: controller.selectedMonitorType,
                      onChanged: (value) {
                        // controller.selectedMonitorType = value;
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
                  // Obx(() {
                  //   return Container(
                  //     width: w,
                  //     decoration: BoxDecoration(
                  //       color: vpnBlueOpacity,
                  //       // borderRadius: BorderRadius.circular(10),
                  //     ),
                  //
                  //     padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  //     child: DropdownButtonFormField(
                  //       // validator: ,
                  //       isExpanded: true,
                  //       decoration: InputDecoration(
                  //           // labelText: 'select option',
                  //         hintStyle: AppStyle.textStyleNotoSansGreyOpacity15,
                  //           // labelStyle: AppStyle.textStyleNotoSansGreyOpacity15,
                  //           enabledBorder: UnderlineInputBorder(
                  //               borderSide: BorderSide(color: cTransparent))
                  //       ),
                  //       // underline: const SizedBox(),
                  //       // style: AppStyle.textStyleNotoSansGreyOpacity15,
                  //       // borderRadius: BorderRadius.circular(10),
                  //       items: controller.monitorType.map((String value) {
                  //         return DropdownMenuItem<RxString>(
                  //
                  //           value: value.obs,
                  //             child: Text(value,
                  //               style: TextStyle(color: Colors.red),// AppStyle.textStyleNotoSansRegularGrey15
                  //           ),
                  //         );
                  //       }).toList(),
                  //       value: controller.selectedMonitorType,
                  //       onChanged: (Object? value) {
                  //         debugPrint('DropdownButton => value : $value');
                  //         // controller.onDropDownChanged(RxString(value.toString()));
                  //       },
                  //     ),
                  //   );
                  // }),
                  // SizedBox(height: h * 0.03),

                  CommonTextField(
                    label: Const.txtLblSize,
                    textInputType: TextInputType.text),
                  SizedBox(height: h * 0.03),
                  CommonTextField(
                    label: Const.txtLblPurchaseDate,
                    textInputType: TextInputType.text),
                  SizedBox(height: h * 0.03),
                  CommonTextField(
                    label: Const.txtLblSellerName,
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
                  title: Const.btnLblEditCategory,
                  onPressed: () {
                    Const().toast('Edit Successfully');
                    debugPrint(' ======> ON CLICK ADD CATEGORY <====== ');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
