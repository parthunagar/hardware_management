
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProvider extends GetConnect{

  Future<dynamic> getSearchData() async {
    final response = await get('https://api.imgflip.com/get_memes');
    if(response.status.hasError) {
      debugPrint('getSearchData => response.statusText : ${response.statusText}');
      return Future.error(response.statusText!);
    } else {
      // print('getSearchData => response.body : ${response.body}');
      return response.body;
    }
  }

}