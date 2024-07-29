
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'dart:developer' as logger;

class UpdateDynamicViewProvider extends GetConnect{

  Future<dynamic> getIdWiseCategoryDetailData() async {
    String data = await DefaultAssetBundle.of(Get.context!).loadString("assets/json/getDetailsById.json");
    // debugPrint('getIdWiseCategoryDetailData => data : $data');
    final response = jsonDecode(data);

    logger.log('response : $response');
    // final response = jsonResponse;
    // if(response.status.hasError) {
    //   debugPrint('getIdWiseCategoryDetailData => response.statusText : ${response.statusText}');
    //   debugPrint('getIdWiseCategoryDetailData => response.body : ${response.body}');
    //   return Future.error(response.statusText!);
    // } else {
    //   // print('getCategoryDetailData => response.body : ${response.body}');
    //   return response.body;
    // }
    return response;
  }

}