
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategoryProvider extends GetConnect{

  Future<dynamic> editCategoryData() async {
    final response = await get('https://api.imgflip.com/get_memes');
    if(response.status.hasError) {
      debugPrint('getCategoryListData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      debugPrint('editCategoryData => response.body : ${response.body}');
      return response.body;
    }
  }

}