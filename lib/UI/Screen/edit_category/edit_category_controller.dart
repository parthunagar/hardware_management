import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/edit_category/edit_category_provider.dart';

class EditCategoryLogic extends GetxController with StateMixin<dynamic> {

  RxList<String> monitorType =  ['Type','LCD', 'LED', 'HD'].obs;
  RxList<String> hardDiskType =  ['HDD', 'SSD'].obs;

  RxString selectedMonitorType = 'Type'.obs;

  RxBool showBorder = false.obs;

  void onMonitorDropDownChanged(RxString val) {
    selectedMonitorType.value = val.value;
  }

  void onMonitorTap(RxBool val) {
    showBorder.value = val.value;
  }

  editCategoryApi() {
    change(value, status: RxStatus.loading());
    EditCategoryProvider().editCategoryData().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    editCategoryApi();
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
