import 'package:get/get.dart';

import 'qr_code_controller.dart';

class QrCodeScreenBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => QrCodeScreenLogic());
  }

}
