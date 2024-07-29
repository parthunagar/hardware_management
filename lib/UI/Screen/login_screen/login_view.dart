import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Widget/text_button.dart';
import 'package:vpn_scanner/UI/Widget/text_input_filed.dart';
import 'package:vpn_scanner/Utils/app_style.dart';
import 'package:vpn_scanner/Utils/preference.dart';
import 'package:vpn_scanner/Utils/validation.dart';
import 'login_controller.dart';
import 'package:vpn_scanner/Constant/app_image.dart';


class LoginScreenWidget extends GetView<LoginScreenLogic> {
  const LoginScreenWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<LoginScreenLogic>();
    final size = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cWhite,
      body: Form(
        key: controller.formKey,
        child: Obx(() {
          return SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Column(
                    children: [
                      const Spacer(),
                      Stack(
                        children: [
                          // ClipPath(
                          // clipper: InvertedTopBorderClipper(circularRadius: 40),
                          // child:
                            Container(
                              // height: h * 0.5,
                              width: double.infinity,
                              color: cWhite,
                              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: h * 0.1),
                                  TextInputFindOut(
                                      label: Const.txtLblUsername,
                                      controller: controller.lUsernameController,
                                      validator: (val) => checkEmpty(val!, Const.txtLblUsername),
                                      iconData: FontAwesome.user,
                                      textInputType: TextInputType.emailAddress),
                                  SizedBox(height: h * 0.03),
                                  TextInputFindOut(
                                      label: Const.txtLblPassword,
                                      controller: controller.lPasswordController,
                                      validator: (val) => checkEmpty(val!, Const.txtLblPassword),
                                      iconData: Icons.lock_outline,
                                      textInputType: TextInputType.visiblePassword),
                                  SizedBox(height: h * 0.01),
                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        value: controller.rememberMe!.value,
                                        activeColor: vpnGrey,
                                        onChanged: (newValue) {
                                          debugPrint('newValue : $newValue');
                                          controller.rememberMe!.value = newValue!;
                                          debugPrint('controller.rememberMe!.value : ${controller.rememberMe!.value}');
                                          // Text('Remember me');
                                        }),
                                      Text(Const.txtLblRememberMe,style: AppStyle.textStyleNotoSansSemiBoldGrey13,)
                                    ],
                                  ),
                                  SizedBox(height: h * 0.02),
                                  CustomButton(
                                    title: Const.btnLblLogin,
                                    onPressed: () {

                                      controller.validateAndSave();

                                      // Get.offNamed(AppRoutes.dashBoardScreen);
                                    },
                                  ),
                                  SizedBox(height: h * 0.02),
                                ],
                              ),
                            ),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
                Stack(
                  // fit: StackFit.l,
                  children: [
                    Container(
                        height: h * 0.56,
                        decoration: BoxDecoration(
                            color: vpnBlueOpacity,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            )
                        ),
                        padding: const EdgeInsets.all(40),
                        child: Stack(
                          children: [
                            Image.asset(Assets.loginImage, fit: BoxFit.cover),
                            Center(child: Text(
                              Const.appTitle, textAlign: TextAlign.center,
                              style: AppStyle.textStyleMontserratBold30,))
                          ],
                        )),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }





}


class InvertedTopBorderClipper extends CustomClipper<Path> {
  InvertedTopBorderClipper({required this.circularRadius});

  final double circularRadius;

  @override
  Path getClip(Size size) {
    final path = Path();
    final curveMiddlePoint = circularRadius / 3;
    final widthCurve = circularRadius * 1.66;
    path
      ..quadraticBezierTo(
        curveMiddlePoint, circularRadius, widthCurve, circularRadius,)
      ..lineTo(size.width - widthCurve, circularRadius)
      ..quadraticBezierTo(
        size.width - curveMiddlePoint, circularRadius, size.width, 0,)
      ..lineTo(size.width, size.height)..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

