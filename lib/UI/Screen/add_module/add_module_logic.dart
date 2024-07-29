import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/UI/Widget/common_text_field.dart';
import 'package:vpn_scanner/Utils/SqfLite/Database/Helper.dart';
import 'package:vpn_scanner/Utils/SqfLite/model/hardware_detail_model.dart';

class AddModuleLogic extends GetxController with StateMixin<dynamic> {
  // final AddModuleState state = AddModuleState();

  final cName = TextEditingController();
  final cModelNo = TextEditingController();
  final cSerialNo = TextEditingController();

  RxList? keyTECs = <TextEditingController>[].obs;
  RxList? valueTECs = <TextEditingController>[].obs;
  RxList? containerList = <Container>[].obs;


  Container createCard() {
    var h = MediaQuery.of(Get.context!).size.height;
    var w = MediaQuery.of(Get.context!).size.width;
    var keyController = TextEditingController();
    var valueController = TextEditingController();
    keyTECs!.add(keyController);
    valueTECs!.add(valueController);
    return Container(
      child: Column(
        children: [
          SizedBox(height: h * 0.03),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CommonTextField(
                    label: 'key',
                    // maxLines: 2,

                    controller: keyController,
                    textInputType: TextInputType.text),
              ),
              SizedBox(width: w * 0.04),
              Expanded(
                child: CommonTextField(
                    label: 'value',
                    // maxLines: 2,
                    controller: valueController,
                    textInputType: TextInputType.text),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //TODO: add default Field
    // containerList!.add(createCard());
  }

  Future<List<PersonEntry>>? onDone() async {
    List<PersonEntry> entries = [];
    for (int i = 0; i < containerList!.length; i++) {
      var key = keyTECs![i].text;
      var value = valueTECs![i].text;
      entries.add(PersonEntry(key, value));
    }
    // Navigator.pop(Get.context!, entries);
    return entries;
  }



  addHardwareDetail(String customField) {
    var hardWareDetail = HardWareDetail();
    hardWareDetail.companyName = cName.text;
    hardWareDetail.modelNo = cModelNo.text;
    hardWareDetail.serialNo = cSerialNo.text;
    hardWareDetail.customField = customField;
    var dbHelper = Helper();
    dbHelper.insert(hardWareDetail).then((insertValue) {
      debugPrint('addHardwareDetail => insertValue : $insertValue');
      debugPrint('addHardwareDetail => serialNo : ${insertValue.serialNo}');
      debugPrint('addHardwareDetail => companyName : ${insertValue.companyName}');
      debugPrint('addHardwareDetail => customField : ${insertValue.customField}');
      debugPrint('addHardwareDetail => modelNo : ${insertValue.modelNo}');
      debugPrint('addHardwareDetail => id : ${insertValue.id}');
      // teNameController.text = "";
      // tePhoneController.text = "";
      // teEmailController.text = "";
      Const().toast("Successfully Added Data");
    });
  }
}

class PersonEntry {
  String? key,value;

  PersonEntry(this.key, this.value);

  @override
  String toString() {
    // return 'Person: name= $key, age= $value';
    // return '{"key" : "${key.toString()}", "value" : "${value.toString()}"}';
    return '{"${key.toString()}" : "${value.toString()}"}';
  }
}