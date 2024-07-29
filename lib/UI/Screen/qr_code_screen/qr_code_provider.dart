
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrCodeProvider extends GetConnect{

  Future<dynamic> getQrCodeData() async {
    final response = await get('https://api.imgflip.com/get_memes');
    if(response.status.hasError) {
      debugPrint('QrCodeProvider => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      // print('QrCodeProvider => response.body : ${response.body}');
      return response.body;
    }
  }

}