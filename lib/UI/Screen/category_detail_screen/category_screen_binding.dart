import 'package:get/get.dart';

import 'category_screen_controller.dart';

class CategoryDetailScreenBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CategoryDetailScreenLogic());
  }

}
