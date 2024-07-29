import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/suggest_textfield/suggest_textfield_logic.dart';


class SuggestTextFieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuggestTextFieldLogic());
  }
}
