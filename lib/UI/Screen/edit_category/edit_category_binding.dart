import 'package:get/get.dart';

import 'edit_category_controller.dart';

class EditCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditCategoryLogic());
  }
}
