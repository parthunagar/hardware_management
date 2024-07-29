import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/add_category_screen/add_category_provider.dart';

class AddCategoryLogic extends GetxController with StateMixin<dynamic> {

  // final purchaseDateController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // final scaFoldKey = GlobalKey<ScaffoldState>();

  ///PRINTER
  TextEditingController? pCompanyNameController = TextEditingController();
  TextEditingController? pSerialNoController = TextEditingController();
  TextEditingController? pPurchaseDateController = TextEditingController();
  TextEditingController? pSellerNameController = TextEditingController();
  TextEditingController? pWarrantyGuaranteeController = TextEditingController();
  TextEditingController? pHistoryController = TextEditingController();

  ///PRINTER
  TextEditingController? mCompanyNameController = TextEditingController();
  TextEditingController? mModelNOController = TextEditingController();
  TextEditingController? mSerialNoController = TextEditingController();
  TextEditingController? mSizeController = TextEditingController();
  TextEditingController? mPurchaseDateController = TextEditingController();
  TextEditingController? mSellerNameController = TextEditingController();
  TextEditingController? mWarrantyGuaranteeController = TextEditingController();
  TextEditingController? mHistoryController = TextEditingController();

  ///CPU
  TextEditingController? cCompanyNameController = TextEditingController();
  TextEditingController? cModelNOController = TextEditingController();
  TextEditingController? cSerialNoController = TextEditingController();
  TextEditingController? cHardDiskType1Controller = TextEditingController();
  TextEditingController? cHardDiskSize1Controller = TextEditingController();
  TextEditingController? cHardDiskType2Controller = TextEditingController();
  TextEditingController? cHardDiskSize2Controller = TextEditingController();
  TextEditingController? cRamType1Controller = TextEditingController();
  TextEditingController? cPurchaseDateController = TextEditingController();
  TextEditingController? cSellerNameController = TextEditingController();
  TextEditingController? cWarrantyGuaranteeController = TextEditingController();
  TextEditingController? cHistoryController = TextEditingController();

  ///LAPTOP
  TextEditingController? lCompanyNameController = TextEditingController();
  TextEditingController? lModelNOController = TextEditingController();
  TextEditingController? lSerialNoController = TextEditingController();
  TextEditingController? lHardDiskType1Controller = TextEditingController();
  TextEditingController? lHardDiskSize1Controller = TextEditingController();
  TextEditingController? lHardDiskType2Controller = TextEditingController();
  TextEditingController? lHardDiskSize2Controller = TextEditingController();
  TextEditingController? lRamType1Controller = TextEditingController();
  TextEditingController? lPurchaseDateController = TextEditingController();
  TextEditingController? lSellerNameController = TextEditingController();
  TextEditingController? lWarrantyGuaranteeController = TextEditingController();
  TextEditingController? lHistoryController = TextEditingController();

  ///HARD DISK
  TextEditingController? hdCompanyNameController = TextEditingController();
  TextEditingController? hdModelNoController = TextEditingController();
  TextEditingController? hdSerialNoController = TextEditingController();
  TextEditingController? hdHardDiskTypeController = TextEditingController();
  TextEditingController? hdHardDiskSizeController = TextEditingController();
  TextEditingController? hdPurchaseDateController = TextEditingController();
  TextEditingController? hdSellerNameController = TextEditingController();
  TextEditingController? hdWarrantyGuaranteeController = TextEditingController();
  TextEditingController? hdHistoryController = TextEditingController();

  ///MOBILE DEVICES
  TextEditingController? mdCompanyNameController = TextEditingController();
  TextEditingController? mdModelNoController = TextEditingController();
  TextEditingController? mdSerialNoController = TextEditingController();
  TextEditingController? mdStorageSizeController = TextEditingController();
  TextEditingController? mdVersionController = TextEditingController();
  TextEditingController? mdPurchaseDateController = TextEditingController();
  TextEditingController? mdSellerNameController = TextEditingController();
  TextEditingController? mdWarrantyGuaranteeController = TextEditingController();
  TextEditingController? mdHistoryController = TextEditingController();


  ///KEY BOARD
  TextEditingController? kbCompanyNameController = TextEditingController();
  TextEditingController? kbModelNoController = TextEditingController();
  TextEditingController? kbSerialNoController = TextEditingController();
  TextEditingController? kbPurchaseDateController = TextEditingController();
  TextEditingController? kbSellerNameController = TextEditingController();
  TextEditingController? kbWarrantyGuaranteeController = TextEditingController();
  TextEditingController? kbHistoryController = TextEditingController();

  ///MOUSE
  TextEditingController? moCompanyNameController = TextEditingController();
  TextEditingController? moModelNoController = TextEditingController();
  TextEditingController? moSerialNoController = TextEditingController();
  TextEditingController? moPurchaseDateController = TextEditingController();
  TextEditingController? moSellerNameController = TextEditingController();
  TextEditingController? moWarrantyGuaranteeController = TextEditingController();
  TextEditingController? moHistoryController = TextEditingController();

  ///CCTV
  TextEditingController? cctvCompanyNameController = TextEditingController();
  TextEditingController? cctvModelNOController = TextEditingController();
  TextEditingController? cctvSerialNoController = TextEditingController();
  TextEditingController? cctvPixelController = TextEditingController();
  TextEditingController? cctvAddLocationController = TextEditingController();
  TextEditingController? cctvPurchaseDateController = TextEditingController();
  TextEditingController? cctvSellerNameController = TextEditingController();
  TextEditingController? cctvWarrantyGuaranteeController = TextEditingController();
  TextEditingController? cctvHistoryController = TextEditingController();

  ///HEAD PHONE
  TextEditingController? hpCompanyNameController = TextEditingController();
  TextEditingController? hpModelNOController = TextEditingController();
  TextEditingController? hpSerialNoController = TextEditingController();
  TextEditingController? hpPurchaseDateController = TextEditingController();
  TextEditingController? hpSellerNameController = TextEditingController();
  TextEditingController? hpWarrantyGuaranteeController = TextEditingController();
  TextEditingController? hpHistoryController = TextEditingController();

  ///PRINTER
  TextEditingController? prCompanyNameController = TextEditingController();
  TextEditingController? prModelNoController = TextEditingController();
  TextEditingController? prSerialNoController = TextEditingController();
  TextEditingController? prPurchaseDateController = TextEditingController();
  TextEditingController? prSellerNameController = TextEditingController();
  TextEditingController? prWarrantyGuaranteeController = TextEditingController();
  TextEditingController? prHistoryController = TextEditingController();

  ///SELLER
  TextEditingController? sSellerNameController = TextEditingController();
  TextEditingController? sCompanyNameController = TextEditingController();
  TextEditingController? sModelNoController = TextEditingController();
  TextEditingController? sContact1Controller = TextEditingController();
  TextEditingController? sContact2Controller = TextEditingController();
  TextEditingController? sAddressController = TextEditingController();

  ///DeadStock
  TextEditingController? dsCompanyNameController = TextEditingController();
  TextEditingController? dsModelNoController = TextEditingController();
  TextEditingController? dsSerialNoController = TextEditingController();
  TextEditingController? dsPurchaseDateController = TextEditingController();
  TextEditingController? dsSellerNameController = TextEditingController();
  TextEditingController? dsWarrantyGuaranteeController = TextEditingController();
  TextEditingController? dsHistoryController = TextEditingController();

  ///DATA CABLE
  TextEditingController? dcTotalCableController = TextEditingController();
  TextEditingController? dcCompanyNameController = TextEditingController();
  TextEditingController? dcModelNoController = TextEditingController();
  TextEditingController? dcContact1Controller = TextEditingController();
  TextEditingController? dcContact2Controller = TextEditingController();
  TextEditingController? dcAddressController = TextEditingController();

  ///GET DATA
  dynamic argumentData = Get.arguments;
  RxString? categoryTitle = ''.obs,totalNoCategory = ''.obs;


  ///MONITOR
  RxList<String> monitorType =  ['Type','LCD', 'LED', 'HD'].obs;
  RxString selectedMonitorType = 'Type'.obs;
  RxBool showBorder = false.obs;
  void onMonitorDropDownChanged(RxString val) {
   selectedMonitorType.value = val.value;
  }

  void onMonitorTap(RxBool val) {
   showBorder.value = val.value;
  }

  ///DATA CABLE
  RxList<String> cableType = ['Cable Type *','VGA cable', 'HDMI cable', 'Sata cable for Display (like HDMI)','Power cable 3 Pin','Harddisk cable for Motherboard','Android cable - Universal','Android cable - C Type','IOS cable','HDMI -> VGA'].obs;
  RxString selectedCableType = 'Cable Type *'.obs;
  RxBool showCableBorder = false.obs;

  void onCableTypeDropDownChanged(RxString val) {
    selectedCableType.value = val.value;
  }

  void onCableTypeTap(RxBool val) {
    showCableBorder.value = val.value;
  }

  ///HARD DISK TYPE
  RxList<String> hardDiskType = ['Hard disk Type *','HDD', 'SSD', 'NVME'].obs;
  RxString selectedHardDiskType = 'Hard disk Type *'.obs;
  RxBool showHardDiskBorder = false.obs;

  void onHardDiskTypeDropDownChanged(RxString val) {
    selectedHardDiskType.value = val.value;
  }

  void onHardDiskTypeTap(RxBool val) {
    showHardDiskBorder.value = val.value;
  }

  ///HARD DISK TYPE OPTIONAL
  RxList<String> hardDiskOptionalType =  ['Hard disk Type (Optional)','HDD', 'SSD', 'NVME'].obs;
  RxString selectedHardDiskOptionalType = 'Hard disk Type (Optional)'.obs;
  RxBool showHardDiskOptionalBorder = false.obs;

  void onHardDiskTypeOptionalDropDownChanged(RxString val) {
    selectedHardDiskOptionalType.value = val.value;
  }

  void onHardDiskTypeOptionalTap(RxBool val) {
    showHardDiskOptionalBorder.value = val.value;
  }

  ///HARD DISK SIZE
  RxList<String> hardDiskSize =  ['Hard disk Size *','GB', 'TB'].obs;
  RxString selectedHardDiskSize = 'Hard disk Size *'.obs;
  RxBool showHardDiskSizeBorder = false.obs;

  void onHardDiskSizeDropDownChanged(RxString val) {
    selectedHardDiskSize.value = val.value;
  }

  void onHardDiskSizeTap(RxBool val) {
    showHardDiskSizeBorder.value = val.value;
  }

  ///HARD DISK SIZE OPTIONAL
  RxList<String> hardDiskOptionalSize =  ['Hard disk Size (Optional)','GB', 'TB'].obs;
  RxString selectedHardDiskOptionalSize = 'Hard disk Size (Optional)'.obs;
  RxBool showHardDiskSizeOptionalBorder = false.obs;

  void onHardDiskOptionalSizeDropDownChanged(RxString val) {
    selectedHardDiskOptionalSize.value = val.value;
  }

  void onHardDiskOptionalSizeTap(RxBool val) {
    showHardDiskSizeOptionalBorder.value = val.value;
  }

  ///RAM TYPE
  RxList<String> ramType =  ['RAM Type *', 'DDR2', 'DDR3', 'DDR4'].obs;
  RxString selectedRamType = 'RAM Type *'.obs;
  RxBool showRamBorder = false.obs;

  void onRamTypeDropDownChanged(RxString val) {
    selectedRamType.value = val.value;
  }

  void onRamTypeTap(RxBool val) {
    showRamBorder.value = val.value;
  }

  ///PROCESSOR TYPE
  RxList<String> processorType =  ['Processor Type *','Pentium', 'C2D', 'i3','i5','i7'].obs;
  RxString selectedProcessorType = 'Processor Type *'.obs;
  RxBool showProcessorBorder = false.obs;

  void onProcessorTypeDropDownChanged(RxString val) {
    selectedProcessorType.value = val.value;
  }

  void onProcessorTypeTap(RxBool val) {
    showProcessorBorder.value = val.value;
  }

  ///RAM SIZE
  RxList<String> ramSize =  ['RAM Size *','2', '4', '6','8', '10', '12','14', '16', '18','20'].obs;
  RxString selectedRamSize = 'RAM Size *'.obs;
  RxBool showRamSizeBorder = false.obs;

  void onRamSizeDropDownChanged(RxString val) {
    selectedRamSize.value = val.value;
  }

  void onRamSizeTap(RxBool val) {
    showRamSizeBorder.value = val.value;
  }

  ///RAM SIZE TYPE
  RxList<String> ramSizeType =  ['RAM Size *','GB', 'TB'].obs;
  RxString selectedRamSizeType = 'RAM Size *'.obs;
  RxBool showRamSizeTypeBorder = false.obs;

  void onRamSizeTypeDropDownChanged(RxString val) {
    selectedRamSizeType.value = val.value;
  }

  void onRamSizeTypeTap(RxBool val) {
    showRamSizeTypeBorder.value = val.value;
  }

  ///STORAGE SIZE
  RxList<String> storageSize =  ['Storage Size *','GB', 'TB'].obs;
  RxString selectedStorageSize = 'Storage Size *'.obs;
  RxBool showStorageSizeBorder = false.obs;

  void onStorageSizeDropDownChanged(RxString val) {
    selectedStorageSize.value = val.value;
  }

  void onStorageSizeTap(RxBool val) {
    showStorageSizeBorder.value = val.value;
  }

  ///DEVICE TYPE
  RxList<String> deviceType =  ['Device Type *','Android', 'IOS'].obs;
  RxString selectedDeviceType = 'Device Type *'.obs;
  RxBool showDeviceTypeBorder = false.obs;

  void onDeviceTypeDropDownChanged(RxString val) {
    selectedDeviceType.value = val.value;
  }

  void onDeviceTypeTap(RxBool val) {
    showDeviceTypeBorder.value = val.value;
  }



  addCategoryApi() {
    change(value, status: RxStatus.loading());
    AddCategoryProvider().addCategoryData().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categoryTitle!.value = argumentData['categoryTitle'];
    totalNoCategory!.value = argumentData['totalNoCategory'];
    addCategoryApi();
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
