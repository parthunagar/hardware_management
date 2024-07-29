import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/API/api_url.dart';

class LoginProvider extends GetConnect{

  Future<dynamic> callLoginAPI({Map<String, dynamic>? queryRequest}) async {
    final response = await post(API.loginUrl,queryRequest);
    if(response.status.hasError){
      debugPrint('callLoginAPI => response.statusText : ${response.statusText}');
      debugPrint('callLoginAPI => response.body : ${response.body}');
      return Future.error(response.statusText!);
    } else {
      // print('getUser => response.body : ${response.body}');
      return response.body;
    }
  }

}