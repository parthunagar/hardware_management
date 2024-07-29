
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryProvider extends GetConnect{

  Future<dynamic> addCategoryData() async {
    final response = await get('https://api.imgflip.com/get_memes');
    if(response.status.hasError) {
      debugPrint('addCategoryData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      // print('addCategoryData => response.body : ${response.body}');
      return response.body;
    }
  }

}