import 'package:get/get.dart';

import 'dynamic_map_logic.dart';

class DynamicMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DynamicMapLogic());
  }
}
