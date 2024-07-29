import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/UI/Screen/login_screen/login_model.dart';
import 'package:vpn_scanner/UI/Screen/login_screen/login_provider.dart';
import 'package:vpn_scanner/Utils/preference.dart';

class LoginScreenLogic extends GetxController with StateMixin<dynamic> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  RxBool? rememberMe = false.obs;

  ///LOGIN
  TextEditingController? lUsernameController = TextEditingController();
  TextEditingController? lPasswordController = TextEditingController();

  void validateAndSave() async {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      debugPrint('Form is valid');
      await Preference().save(Const.prefRememberMe, rememberMe!.value.toString());
      await Preference().save(Const.prefName, lUsernameController!.text.trim());
      await Preference().save(Const.prefPass, lPasswordController!.text.trim());
      var a = await Preference().read(Const.prefName);
      debugPrint('validateAndSave => a : $a');
      getLoginData();
      // Get.offNamed(AppRoutes.dashBoardScreen);
      // if(rememberMe!.value) {
      //   debugPrint(' =====> SAVE DATA =====> ');
      //   await Preference().save(Const.prefRememberMe, rememberMe!.value.toString());
      //   await Preference().save(Const.prefName, lUsernameController!.text.trim());
      //   await Preference().save(Const.prefName, lPasswordController!.text.trim());
      //   var a = await Preference().read(Const.prefName);
      //   // var aa =  Preference().read(Const.prefName);
      //   debugPrint(' =====> a =====> $a');
      //   // debugPrint(' =====> aa =====> $aa');
      // }
      // else {
      //   debugPrint(' =====> DO NOT SAVE DATA =====> ');
      // }

    } else {
      debugPrint('Form is invalid');
    }
  }

  Future<LoginData?> getLoginData() async {
    Map<String, dynamic> queryRequest = {
      'email': lUsernameController!.text.toString(),
      'password': lPasswordController!.text.toString(),
    };
    // Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    LoginProvider().callLoginAPI(queryRequest: queryRequest).then((loginDataValue) async {
      debugPrint('getLoginData => loginDataValue : $loginDataValue');
      change(value, status: RxStatus.success());
      final login = Login.fromJson(loginDataValue);
      debugPrint('getLoginData => result : ${login.result}');
      if(login.result == Const.apiFail) {
        Const().toast(login.message.toString());
      }
      else {
        Const().toast(login.message.toString());
        await Preference().save(Const.prefRememberMe, rememberMe!.value.toString());
        await Preference().save(Const.prefAPIUserName, login.loginData!.name.toString());
        await Preference().saveInt(Const.prefAPIUserId, login.loginData!.id);
        await Preference().save(Const.prefAPIUserEmail, login.loginData!.email.toString());
        await Preference().save(Const.prefAPIUserRole, login.loginData!.role.toString());
        await Preference().save(Const.prefAPIUserToken, login.loginData!.token.toString());
        Get.offNamed(AppRoutes.dashBoardScreen);
      }
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });
  }

  getPrefData() async {
    dynamic a = await Preference().read(Const.prefRememberMe);
    debugPrint('getPrefData => RememberMe : $a');
    String? name = await Preference().read(Const.prefName);
    debugPrint('getPrefData => name : $name');
    String? pass = await Preference().read(Const.prefPass);
    debugPrint('getPrefData => pass : $pass');

    if(a == 'true') {
      lUsernameController!.text = name!;
      lPasswordController!.text = pass!;
      try{
        rememberMe!.value =  a.toLowerCase() == '$a' ;
      }catch(e) {
        debugPrint('getPrefData => ERROR : $e');
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    debugPrint(' ======> LoginScreenLogic onInit 1 <====== ');
    getPrefData();
    // loginApi();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    debugPrint(' ======> LoginScreenLogic onReady 2 <====== ');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
