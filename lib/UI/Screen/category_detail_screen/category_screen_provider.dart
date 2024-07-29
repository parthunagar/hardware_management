
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailProvider extends GetConnect{

  Future<dynamic> getCategoryDetailData() async {
    final response = await get('https://api.imgflip.com/get_memes');
    if(response.status.hasError) {
      debugPrint('getCategoryDetailData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      // print('getCategoryDetailData => response.body : ${response.body}');
      return response.body;
    }
  }

}