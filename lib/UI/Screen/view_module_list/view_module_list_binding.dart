import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/view_module_list/view_module_list_logic.dart';

class ViewModuleListBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ViewModuleListLogic());
  }
}
