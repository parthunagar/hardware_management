import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/API/api_url.dart';
import 'package:vpn_scanner/UI/Screen/dashboard_screen/dashboard_model.dart';

class DashBoardProvider extends GetConnect{

  Future<dynamic> getDashBoardData({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    debugPrint('API.getModuleUrl : ${API.getModuleUrl}');
    final response = await get(API.getModuleUrl,headers: headers);
    if(response.status.hasError) {
      debugPrint('getDashBoardData => response.statusText : ${response.statusText}');
      debugPrint('getDashBoardData => response.body : ${response.body}');
      return Future.error(response.statusText!);
    } else {
      // var resp = json.decode(response.body);
      // List responseJson = resp['data']['memes'];
      // print('getDashBoardData => response.body : ${response.body}');
      // return dashBoardDataFromJson(response.body.toString());
      // return responseJson.map((m) => Meme.fromJson(m)).toList();
      return response.body;
    }
  }
  // static var client = http.Client();


  // Future<List<Meme>?> getDashBoardData() async {
  //   final response = await get('https://api.imgflip.com/get_memes');
  //   if (response.statusCode == 200) {
  //     // var data = response.body;
  //
  //     var data;
  //     try{
  //       Map<String, dynamic> map = json.decode(response.body);
  //       print('getDashBoardData => map : $map');
  //       data = map['data']['memes'][0];
  //       print('getDashBoardData => data : $data');
  //
  //       // List responseJson = json.decode(response.body.toString());
  //       // List<Meme> newsTitle = createNewsList(responseJson["response"]["results"]);
  //     }
  //     catch(e){
  //       debugPrint('getDashBoardData => ERROR 1 : $e');
  //     }
  //     try{
  //       // Map<String, dynamic> map = json.decode(response.body);
  //
  //       // return Meme.fromJson(data);
  //       // print('getDashBoardData => data : $data');
  //       // print('getDashBoardData => data : ${data['data']['memes']}');
  //       return emptyFromJson(data);
  //     }
  //     catch(e){
  //       debugPrint('getDashBoardData => ERROR 2 : $e');
  //     }
  //   } else {
  //     return null;
  //   }
  // }

}