import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreenBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenLogic());
  }
}
