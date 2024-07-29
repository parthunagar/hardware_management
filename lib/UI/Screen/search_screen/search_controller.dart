import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/search_screen/search_provider.dart';

class SearchScreenLogic extends GetxController with StateMixin<dynamic>  {

  searchApi() {
    SearchProvider().getSearchData().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchApi();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
