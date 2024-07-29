import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/category_detail_screen/category_screen_provider.dart';

class CategoryDetailScreenLogic extends GetxController with StateMixin<dynamic> {


  dynamic argumentData = Get.arguments;
  RxString? categoryTitle = ''.obs,totalNoCategory = ''.obs;

  categoryDetailsApi() {
    CategoryDetailProvider().getCategoryDetailData().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categoryTitle!.value = argumentData['categoryTitle'];
    totalNoCategory!.value = argumentData['totalNoCategory'];
    try{
      debugPrint(argumentData['categoryTitle']);
      debugPrint(argumentData['totalNoCategory']);
    }
    catch(e){
      debugPrint('ERROR : $e');
    }
    categoryDetailsApi();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
