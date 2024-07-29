import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Screen/add_module/sof_demo.dart' as demo;
import 'package:vpn_scanner/UI/Widget/common_text_field.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'package:vpn_scanner/UI/Widget/text_button.dart';
import 'add_module_logic.dart';

class AddModulePage extends GetView<AddModuleLogic> {
  final logic = Get.find<AddModuleLogic>();

  @override
  Widget build(BuildContext context) {
    // debugPrint('containerList : ${controller.containerList.toString()}');
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(title: Text('Manage Custom Field')),
      appBar: CustomAppBar(
        title: 'Custom Field Demo',
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
        child: Image.asset(Assets.backArrow)),
        action: [
          Padding(padding: EdgeInsets.only(right: w * 0.04),
          child: GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.viewModuleScreen);
              },
              child: Icon(Icons.view_agenda,color: vpnBlue,)),
          )
        ],
      ),
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
                child: Column(
                  children: [
                    CommonTextField(
                        controller: controller.cName,
                        label: 'Company Name',
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        controller: controller.cModelNo,
                        label: 'Model Number',
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    CommonTextField(
                        controller: controller.cSerialNo,
                        label: 'Serial Number',
                        textInputType: TextInputType.text),
                    SizedBox(height: h * 0.03),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        // focusColor: Colors.red,// vpnBlue,
                        highlightColor: Colors.green,
                        onTap: () {
                          debugPrint(' =============> ON TAP ADD FIELD <============= ');
                          controller.containerList!.add(controller.createCard());
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: h * 0.005, horizontal: w * 0.01),
                          decoration: BoxDecoration(
                              color: vpnBlueOpacity,
                              border: Border.all(color: vpnGreyopacity),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(Icons.add, size: h * 0.05),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.containerList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return controller.containerList![index];
                      },
                    ),
                    SizedBox(height: h * 0.1),
                  ],
                ),
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
                   controller.onDone()!.then((personValue) async {
                     if (personValue.isNotEmpty) {
                       debugPrint('personValue.isNotEmpty : ${personValue.isNotEmpty}');
                       debugPrint('personValue.length : ${personValue.length}');
                       debugPrint('personValue : $personValue');
                       controller.addHardwareDetail(personValue.toString());
                       personValue.forEach(print);
                     }
                     else {
                       debugPrint('personValue.length : ${personValue.length}');
                       debugPrint('personValue : $personValue');
                       // List<demo.PersonEntry> persons = await Navigator.push(
                       //     context, MaterialPageRoute(builder: (context) =>
                       //     demo.SOF()));
                     }
                   }).onError((error, stackTrace) {
                     debugPrint('personValue => ERROR : $error');
                   });
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
