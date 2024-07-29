import 'package:get/get.dart';

import 'update_dynamic_view_logic.dart';

class UpdateDynamicViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateDynamicViewLogic());
  }
}
