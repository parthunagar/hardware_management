import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Screen/update_dynamic_view/update_dynamic_view_model.dart';
import 'package:vpn_scanner/UI/Screen/update_dynamic_view/update_dynamic_view_provider.dart';
import 'package:vpn_scanner/UI/Widget/common_text_field.dart';
import 'package:vpn_scanner/UI/Widget/customDropDown/dropdown_button2.dart';
import 'package:vpn_scanner/UI/Widget/custom_dropdown.dart';
import 'package:vpn_scanner/Utils/app_style.dart';

class UpdateDynamicViewLogic extends GetxController with StateMixin<dynamic> {

  RxList? keyTECs = <TextEditingController>[].obs;
  RxList? containerList = <Container>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //TODO: add default Field
    callApi();
    // containerList!.add(createCard());
  }

  RxBool? showBorder = false.obs;

  void onTypeTap(RxBool val) {
    showBorder!.value = val.value;
  }

  RxString dropdownGenderValue = ''.obs;
  void onDropDownChanged(RxString val) {
    dropdownGenderValue.value = val.value;
    debugPrint('onGenderDropDownChanged => dropdownGenderValue.value : ${dropdownGenderValue.value}');
  }

  RxList<String> selectedItemList = <String>[].obs;
  RxList itemList = [].obs;
  RxList typeList = [].obs;
  RxList valueList = [].obs;
  RxList keyList = [].obs;
  RxList validationTypeList = [].obs;

  createCard(String label,String type, { RxList<String>? items, String? selectedItem, String? setControllerValue,String? validationType}) {
    debugPrint('createCard => label : $label');
    var keyController = TextEditingController();
    keyTECs!.add(keyController);
    if(type == Const.typeTextField || type == Const.typeDateTime) {
      keyController.text = setControllerValue!;
      typeList.add(type);
      valueList.add(setControllerValue);
      keyList.add(label);
      selectedItemList.add('');
      itemList.add(['']);
      createTestObj.add('');
      validationTypeList.add(validationType);
    }
    if(type == Const.typeDropDown){
      itemList.add(items);
      selectedItemList.add(selectedItem!);
      typeList.add(type);
      keyList.add(label);
      valueList.add(setControllerValue);
      createTestObj.add(selectedItem);
      validationTypeList.add('');
    }
    debugPrint('validationTypeList : $validationTypeList');
  }

  Rx<RxList<UpdateView>> updateDataList = RxList<UpdateView>.empty().obs;
  Rx<RxList<CustomField>> updateViewDataList = RxList<CustomField>.empty().obs;

  RxList createTestObj = [].obs;
  RxList createTxtObj = [].obs;

  Future<UpdateView?> callApi() async {
    change(value, status: RxStatus.loading());
    UpdateDynamicViewProvider().getIdWiseCategoryDetailData().then((value) {
      debugPrint('callApi => value : $value');
      if(value != null) {
        updateDataList.value.clear();
        final getData = UpdateView.fromJson(value);
        if(getData.result == Const.apiSuccess) {
          updateDataList.value.add(getData);
          updateViewDataList.value.addAll(getData.updateViewData!.customFields!);

          debugPrint('callApi => updateDataList : $updateDataList');
        }
        debugPrint('getData : ${getData.updateViewData!.serialNo}');
        getData.updateViewData!.customFields!.forEach((element) {
          // debugPrint('element.type.length : ${element.type!.length}');
          print('element : ${element.type}');
          if(element.type == Const.typeTextField || element.type == Const.typeDateTime){
            // containerList!.add(createCard(element.key!,element.type!,setControllerValue: element.value.toString()));
            createCard(element.key!,element.type!,setControllerValue: element.value.toString(),validationType: element.validationType);
          }
          else {
            // containerList!.add(createCard(element.key!,element.type!, items: RxList<String>(element.dropDownItem!), selectedItem:element.selectedItem!));
            createCard(element.key!,element.type!, items: RxList<String>(element.dropDownItem!), selectedItem:element.selectedItem!);
          }
          debugPrint('containerList.length : ${containerList!.length}');

        });
        change(value, status: RxStatus.success());
      }
    },onError: (error){
      debugPrint('callApi => error : $error');
      change(null, status: RxStatus.error(error.toString()));
    });
    update();
  }


  Future<List<FormEntry>>? onDone() async {
    List<FormEntry> entries = [];
    //
    // for (int i = 0; i < containerList!.length; i++) {
    for (int i = 0; i < updateViewDataList.value.length; i++) {
      var value = keyTECs![i].text;
      entries.add(FormEntry(
          key: keyList[i],
          type: typeList[i],
          selectedItem: createTestObj[i],// ?  selectedItemList[i],
          dropDownItem: itemList[i] ,// ,
          value: value,
          validationType: validationTypeList[i]// valueList[i],// value
      ));
    }
    return entries;
  }
}


class FormEntry {
  String? key,type,selectedItem,value,validationType;
  List? dropDownItem;


  FormEntry(
      {this.key, this.type, this.selectedItem, this.dropDownItem, this.value,this.validationType});

  @override
  String toString() {
    // return 'Person: name= $key, age= $value';
    // return '{"key" : "${key.toString()}", "value" : "${value.toString()}"}';
    // return '{"${key.toString()}" : "}"}';
    // if(type == Const.typeTextField || (validationType == Const.typeValidationNumeric || validationType == Const.typeValidationContact || validationType == Const.typeValidationDecimal)){
    if(type == Const.typeTextField || type == Const.typeDateTime){
      return '{"key":"$key","type":"$type","value":"$value",'
          '${validationType == null ? '' : "validationType:$validationType"}'
          '}';
    }
    else{
      return '{'
          '"key":"$key",'
          '"type":"$type",'
          '"selected_item":"$selectedItem",'
          '"dropDownItem":$dropDownItem'
          '}';
    }
  }
}

// Widget createCustomDropdown(String label, { RxList<String>? items, String? selectedItem}) {
//
//   var h = MediaQuery.of(Get.context!).size.height;
//   var w = MediaQuery.of(Get.context!).size.width;
//   return Column(
//     children: [
//       SizedBox(height: h * 0.03),
//       CustomDropDownWidget(
//         hintText: label,
//         items: items!,
//         // showBorder: controller.showBorder.value,
//         onTap: () {
//           // controller.onMonitorTap(RxBool(true));
//         },
//         selectedValue: selectedItem,
//         onChanged: (value) {
//           // controller.selectedMonitorType = value;
//           debugPrint('CustomDropDownWidget => value : $value');
//           // try{
//           //   controller.onMonitorDropDownChanged(RxString(value.toString()));
//           // }
//           // catch(e){
//           //   debugPrint('CustomDropDownWidget => ERROR : $e');
//           // }
//           // controller.onMonitorTap(RxBool(false));
//         },
//       ),
//     ],
//   );
// }


// Container createCard(String label,String type, { RxList<String>? items, String? selectedItem, String? setControllerValue}) {
//   debugPrint('createCard => label : $label');
//   var h = MediaQuery.of(Get.context!).size.height;
//   var w = MediaQuery.of(Get.context!).size.width;
//   var keyController = TextEditingController();
//
//   keyTECs!.add(keyController);
//
//
//   if(type == Const.typeTextField || type == Const.typeDateTime) {
//     keyController.text = setControllerValue!;
//     typeList.add(type);
//     valueList.add(keyController.text);
//     keyList.add(label);
//     selectedItemList.add('');
//     itemList.add(['']);
//     createTestObj.add('');
//   }
//   if(type == Const.typeDropDown){
//     itemList.add(items);
//     selectedItemList.add(selectedItem!);
//     typeList.add(type);
//     keyList.add(label);
//     valueList.add('');
//     createTestObj.add(selectedItem);
//   }
//   // debugPrint('valueList : ${valueList}');
//   return Container(
//     child: Column(
//       children: [
//         type == Const.typeTextField ? Column(
//           children: [
//             SizedBox(height: h * 0.03),
//             CommonTextField(
//                 label: label,
//                 // maxLines: 2,
//                 controller: keyController,
//                 textInputType: TextInputType.text),
//           ],
//         ) : SizedBox(),
//
//         type == Const.typeDropDown ?  Column(
//           children: [
//             SizedBox(height: h * 0.03),
//             DropdownButtonFormField2(
//               isExpanded: true,
//               buttonHeight: h * 0.025,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: vpnBlueOpacity,
//                 errorMaxLines: 2,
//                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: showBorder == true ? vpnGreyopacity : vpnBlueOpacity)),
//                 disabledBorder: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 errorBorder: InputBorder.none,
//                 focusedErrorBorder: InputBorder.none,
//                 errorStyle: AppStyle.textStyleNotoSansRegularGrey11,
//                 counterText: "",
//               ),
//               icon: const Icon(Icons.keyboard_arrow_down),
//               iconSize: 25,
//               iconDisabledColor: vpnGreyopacity,
//               iconEnabledColor: vpnGrey,
//               onTap: (){
//                 onTypeTap(RxBool(true));
//               },
//               value: selectedItem ,//?? selectedValue,
//               onChanged: (value) {
//                 // controller.selectedMonitorType = value;
//                 debugPrint('CustomDropDownWidget => value : $value');
//                 try {
//                   onDropDownChanged(RxString(value.toString()));
//                   debugPrint('CustomDropDownWidget => value 2 : $value');
//                 }
//                 catch (e) {
//                   debugPrint('CustomDropDownWidget => ERROR : $e');
//                 }
//                 onTypeTap(RxBool(false));
//               },
//               dropdownElevation: 1,
//               items: items!.map((String value) {
//                 return DropdownMenuItem<RxString>(
//                     value: value.obs,
//                     child: Text(value, style: value == label ? AppStyle.textStyleNotoSansGreyOpacity15 : AppStyle.textStyleNotoSansRegularGrey15, overflow: TextOverflow.ellipsis));
//               }).toList(),
//
//             )
//
//             ///COMMENT
//             // CustomDropDownWidget(
//             //   hintText: label,
//             //   items: items!,
//             //   showBorder: showBorder!.value,
//             //   onTap: () {
//             //     onTypeTap(RxBool(true));
//             //   },
//             //   selectedValue: selectedItem,
//             //   onChanged: (value) {
//             //     // controller.selectedMonitorType = value;
//             //     debugPrint('CustomDropDownWidget => value : $value');
//             //     try {
//             //       onDropDownChanged(RxString(value.toString()));
//             //       debugPrint('CustomDropDownWidget => value 2 : $value');
//             //     }
//             //     catch (e) {
//             //       debugPrint('CustomDropDownWidget => ERROR : $e');
//             //     }
//             //     onTypeTap(RxBool(false));
//             //   },
//             // ),
//           ],
//         )  : SizedBox()
//       ],
//     ),
//   );
// }