import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashBoardScreenBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardScreenLogic());
  }

}
