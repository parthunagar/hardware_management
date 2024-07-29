import 'package:get/get.dart';

import 'add_module_logic.dart';

class AddModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddModuleLogic());
  }
}
