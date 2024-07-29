import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/UI/Screen/dashboard_screen/dashboard_model.dart';
import 'package:vpn_scanner/UI/Screen/dashboard_screen/dashboard_provider.dart';
import 'package:vpn_scanner/Utils/preference.dart';

class DashBoardScreenLogic extends GetxController with StateMixin<dynamic> {

  RxInt selectedIndex = 0.obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Rx<RxList<ModuleDatum>> moduleList = RxList<ModuleDatum>.empty().obs;
  RxBool isModuleDataLoad = false.obs;

  Future<ModuleDatum?> dashBoardApi() async {
    change(value, status: RxStatus.loading());
    // Map<String, dynamic> queryRequest = {'user_id':'26'};
    var apiToken = await Preference().read(Const.prefAPIUserToken);
    Map<String, String> headers = {"authorization": "Bearer $apiToken"};
    DashBoardProvider().getDashBoardData(headers: headers).then((getModuleValue) {
      debugPrint('dashBoardApi => getModuleValue : $getModuleValue');
      final getDriverData = Module.fromJson(getModuleValue);
      moduleList.value.clear();

      if(getDriverData.result == Const.apiSuccess) {
        moduleList.value.addAll(getDriverData.moduleData!);
      }
      if(moduleList.value.isEmpty)
      {   isModuleDataLoad.value = true;  }

      change(value, status: RxStatus.success());
    },onError: (error){
      debugPrint('dashBoardApi => error : $error');
      Const().toast(error.toString());
      change(null,status: RxStatus.error(error.toString()));
    });
  }

  // void dashBoardApi() async {
  //   isLoading(true);
  //   try {
  //     var todos = await DashBoardProvider().getDashBoardData();
  //     print('dashBoardApi => todos  : $todos');
  //     // print('dashBoardApi => todos!.memes[0].id  : ${todos!.memes![0].id}');
  //     try{
  //       if (todos != null) {
  //         todoList.value = todos as List<Meme>;// as List<Data>;
  //         print('dashBoardApi => todoList.value  : ${todoList.value }');
  //       }
  //     }
  //     catch(e){
  //       debugPrint('dashBoardApi => error 1 : $e');
  //     }
  //   } catch(e) {
  //     debugPrint('dashBoardApi => error 2 : $e');
  //   }
  //   finally {
  //     isLoading(false);
  //   }
  // }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dashBoardApi();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
