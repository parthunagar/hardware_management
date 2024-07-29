import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/UI/Screen/category_list_screen/category_list_model.dart';
import 'package:vpn_scanner/UI/Screen/category_list_screen/category_list_provider.dart';
import 'package:vpn_scanner/UI/Widget/custom_dialog.dart';

class CategoryListLogic extends GetxController with StateMixin<dynamic> {


  dynamic argumentData = Get.arguments;
  RxString? categoryTitle = ''.obs,totalNoCategory = ''.obs;


  RxInt selectedTypeIndex = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  RxInt selectedMonitorCompanyIndex = 0.obs;


  RxList hardDiskTypeList = ['SSD','HDD'].obs;

  RxList cableTypeList = ['3 Pin power cable of PC','3 Pin power cable for Monitor','HDMI Cable'].obs;


  // dashBoardApi() {
  //   CategoryListProvider().getCategoryListData().then((value) {
  //     change(value, status: RxStatus.success());
  //   },onError: (error){
  //     change(null,status: RxStatus.error(error.toString()));
  //   });
  // }



  // var todoList = <Meme>[].obs;

  var emptyData = Empty().obs;
  // Future<Empty?> dashBoardApi() async {
  //   isLoading(true);
  //    CategoryListProvider().getCategoryListData().then((value) {
  //
  //       print('dashBoardApi => value!.data!.memes![0].id : ${value!.data!.memes![0].id}');
  //       change(value, status: RxStatus.success());
  //       // return Empty.fromJson(value);
  //       isLoading(false);
  //       return emptyData(value);
  //
  //     },onError: (error){
  //       isLoading(false);
  //       change(null,status: RxStatus.error(error.toString()));
  //     });
  // }


  var isDataAvailable = false.obs;
  bool get dataAvailable => isDataAvailable.value;
  var isTrx;
  Empty get trx => isTrx;
  // var isLoading = true.obs;

  RxInt no = 0.obs;

  void dashBoardApi(int number) async {
    debugPrint('dashBoardApi => no : $number');
    // isLoading(true);
    return CategoryListProvider().getCategoryListData(number).then((response) {
      debugPrint('dashBoardApi => response : $response');

      if (response != null) {
        isTrx = response;
        change(value, status: RxStatus.success());
      }
      // isLoading(false);
    }).catchError((err) {
      // isLoading(false);
      change(null,status: RxStatus.error(err.toString()));
      debugPrint('dashBoardApi => ERROR : $err');
    }).whenComplete(() {
      debugPrint('dashBoardApi => whenComplete ');
      isDataAvailable.value = isTrx != null;
      change(value, status: RxStatus.success());
      // isLoading(false);
    });

    // try {
    //   var txns = await CategoryListProvider().getCategoryListData();
    //   if (txns != null) {
    //     isLoading(false);
    //     emptyData(txns);
    //   }
    // } catch (e) {
    //   print('dashBoardApi => ERROR : $e');
    // } finally {
    //   isLoading(false);
    // }
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categoryTitle!.value = argumentData['categoryTitle'];
    totalNoCategory!.value = argumentData['totalNoCategory'];
    try {
      debugPrint("CategoryListLogic => argumentData['categoryTitle'] : ${argumentData['categoryTitle']}");
      debugPrint("CategoryListLogic => argumentData['totalNoCategory'] : ${argumentData['totalNoCategory']}");
    }
    catch(e) {
      debugPrint('ERROR : $e');
    }
    dashBoardApi(no.value);
  }


  void onClickEdit(BuildContext context) {
    Get.toNamed(AppRoutes.editCategoryScreen);
    debugPrint(' =======> ON CLICK EDIT <======= ');
  }

  void onClickDelete(BuildContext c) {
    dialogWithDivider(c,
        'Are you sure to delete this product?',
        'Cancel', 'Delete', () {
          debugPrint(" =====> ON CLICK CANCEL <===== ");
          Get.back();
        }, () {
          debugPrint(" =====> ON CLICK DELETE <===== ");
        });
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
