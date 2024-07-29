
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/category_list_screen/category_list_model.dart';

class CategoryListProvider extends GetConnect{

  // Future<dynamic> getCategoryListData() async {
  //   final response = await get('https://api.imgflip.com/get_memes');
  //   if(response.status.hasError) {
  //     debugPrint('getCategoryListData => response.statusText : ${response.statusText}');
  //     return Future.error(response.statusText!);
  //   } else {
  //     // print('getCategoryListData => response.body : ${response.body}');
  //     return response.body;
  //   }
  // }

  Future<Empty?> getCategoryListData(int no) async {
    debugPrint('getCategoryListData => no : $no');
    final response = await get('https://api.imgflip.com/get_memes');
    if(response.status.hasError) {
      debugPrint('getCategoryListData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      try {
        if(response.statusCode == 200) {
          var responseString = response.body;
          // debugPrint('getCategoryListData => responseString : $responseString');
          var valueMap = json.encode(responseString);
          // debugPrint('getCategoryListData => valueMap : $valueMap');
          return Empty.fromJson(json.decode(valueMap));
        }
        else
        { return null; }
      }
      catch(e){
        debugPrint('getCategoryListData => ERROR 2 : $e');
      }
    }
  }

}