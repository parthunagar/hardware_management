import 'package:vpn_scanner/UI/Screen/suggetion_api/model/suggetion_api_model.dart';
import 'dart:convert';

class TextUtils {
  List<Dictionary> moduleList = List<Dictionary>.empty();
  bool isModuleDataLoad = false;


  Future<dynamic> getDictionaryData() async {

  }



  Future<Dictionary?> suggestionApi() async {
    // Map<String, dynamic> queryRequest = {'user_id':'26'};
    moduleList.clear();
    await getDictionaryData().then((value) {
      print('value : ${value} ');
      moduleList.addAll(value);
    });

    print('moduleList.value.length : ${moduleList.length} ');

  }
}
