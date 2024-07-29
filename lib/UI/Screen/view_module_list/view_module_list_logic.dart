import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/view_module_list/custom_field_model.dart';
import 'package:vpn_scanner/Utils/SqfLite/Database/Helper.dart';
import 'package:vpn_scanner/Utils/SqfLite/model/hardware_detail_model.dart';

class ViewModuleListLogic extends GetxController with StateMixin<dynamic> {

  RxList<HardWareDetail>? items =  <HardWareDetail>[].obs;
  RxList<CustomField>? customFieldList =  <CustomField>[].obs;
  var viewModuleListKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //TODO: add default Field
    debugPrint('before getData');

    getData();

    debugPrint('after getData');

    // containerList!.add(createCard());
  }

  Future<RxList<HardWareDetail>?> getData() async {
    change(value, status: RxStatus.loading());
    var dbHelper = Helper();
    await dbHelper.getAllUsers().then((value) {
      debugPrint('getData => value : $value');
      // value.forEach(print);
      items!.addAll(value);// = value;



      try{
        debugPrint('getData => items : ${items![0].serialNo}');
      }catch(e){
        debugPrint('getData => items ERROR: $e');
      }
      change(value, status: RxStatus.success());
    });
    if(items!.isEmpty) {
      // debugPrint('getData => items.length 1 : ${items.length}');
      change(value, status: RxStatus.empty());
      // debugPrint('getData => items 1 : ${items}');
      // return null;
    }

    debugPrint('getData => items.length 2 : ${items!.length}');
    return items;
  }

}
