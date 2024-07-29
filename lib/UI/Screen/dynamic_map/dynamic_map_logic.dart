import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';
import 'package:vpn_scanner/UI/Screen/dynamic_map/dynamic_map_model.dart';
import 'package:vpn_scanner/UI/Screen/dynamic_map/dynamic_map_provider.dart';

class DynamicMapLogic extends GetxController with StateMixin<dynamic> {
  
  RxList? keyTECs = <TextEditingController>[].obs;
  RxList labelList = [].obs;
  RxList keyList = [].obs;
  RxList elementTypeList = [].obs;
  RxList valueList = [].obs;
  RxList validationTypeList = [].obs;
  RxList requiredList = [].obs;
  RxList optionList = [].obs;
  RxList<bool>? showBorder = <bool>[].obs;
  
  // createCard(String key,String label,String type, {String? requiredVal,  List<Option>? items, String? value, String? setControllerValue,String? validationType}){
  createCard(String key,String label,String type, { bool? requiredVal,  List<Map<String, String>>? items, String? setControllerValue,String? validationType}){
    // debugPrint('createCard => label : $label');
    var keyController = TextEditingController();
    keyTECs!.add(keyController);

    if(type == Const.typeTextField || type == Const.typeDateTime) {
      keyController.text = setControllerValue!;
      elementTypeList.add(type);
      optionList.add(['']);
      keyList.add(key);
      labelList.add(label);
      valueList.add(setControllerValue);
      requiredList.add(requiredVal);
      validationTypeList.add(validationType);
      showBorder!.add(false);
      // createTestObj.add(['']);
    } else {
      elementTypeList.add(type);
      keyList.add(key);
      labelList.add(label);
      valueList.add(setControllerValue);
      optionList.add(items);
      requiredList.add(requiredVal);
      validationTypeList.add(null);
      showBorder!.add(false);
      // createTestObj.add(items);
    }
    // debugPrint('optionList : ${optionList}');
    // debugPrint('optionList.length : ${optionList.length}');
  }

  Rx<RxList<MapView>> mapDataList = RxList<MapView>.empty().obs;
  Rx<RxList<CustomField>> updateViewDataList = RxList<CustomField>.empty().obs;

  Future<MapView?> callMapApi() async {
    change(value, status: RxStatus.loading());
    DynamicMapProvider().getDetailsUsingMap().then((value) {
      // debugPrint('callMapApi => value : $value');
      if(value != null) {
        mapDataList.value.clear();
        final getData = MapView.fromJson(value);
        if(getData.result == Const.apiSuccess) {
          mapDataList.value.add(getData);
          updateViewDataList.value.addAll(getData.mapViewData!.customFields!);
          // debugPrint('callApi => mapDataList : $mapDataList');
        }
        getData.mapViewData!.customFields!.forEach((element) {
          // debugPrint('element.type.length : ${element.type!.length}');
          // print('element : ${element.elementType}');
          //String key,String label,String type, {String? requiredVal,  RxList<String>? items, String? selectedItem, String? setControllerValue,String? validationType}
          if(element.elementType == Const.typeTextField || element.elementType == Const.typeDateTime){
            createCard(
                element.key!,
                element.label!,
                element.elementType!,
                setControllerValue: element.value.toString(),
                validationType: element.validationType,
                requiredVal: element.isRequired

            );
          }
          else {
            createCard(
                element.key!,
                element.label!, 
                element.elementType!,
                items: element.options,//RxList<Option?>(element.options!),
                setControllerValue: element.value.toString(),
                validationType:element.value!,
                requiredVal: element.isRequired
            );
          }
          // debugPrint('element.options : ${element.options}');
        });

        change(value, status: RxStatus.success());
      }
    }).onError((error, stackTrace) {
      change(value, status: RxStatus.error());
    });
  }

  Future<List<FormEntry>>? onDone() async {
    List<FormEntry> entries = [];
    //
    // for (int i = 0; i < containerList!.length; i++) {
    for (int i = 0; i < updateViewDataList.value.length; i++) {
      var value = keyTECs![i].text;
      entries.add(FormEntry(
          label: labelList[i],
          key: keyList[i],
          type: elementTypeList[i],
          dropDownItem: optionList[i],
          value:  elementTypeList[i] == Const.typeDropDown ?  valueList[i] : value,//createTestObj[i],// valueList[i],
          validationType: validationTypeList[i],
          isRequired: requiredList[i]  // valueList[i],// value
      ));
    }
    return entries;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    callMapApi();
  }

}


class FormEntry {
  String? label,key,type,value,validationType;
  bool? isRequired;
  List? dropDownItem;

  FormEntry({this.label,this.key, this.type, this.dropDownItem, this.value,this.validationType,this.isRequired});

  @override
  String toString() {
    // return 'Person: name= $key, age= $value';
    // return '{"key" : "${key.toString()}", "value" : "${value.toString()}"}';
    // return '{"${key.toString()}" : "}"}';
    // if(type == Const.typeTextField || (validationType == Const.typeValidationNumeric || validationType == Const.typeValidationContact || validationType == Const.typeValidationDecimal)){
    if(type == Const.typeTextField || type == Const.typeDateTime){
      return '{'
          '"label":"$label",'
          '"key":"$key",'
          '"element_type":"$type",'
          '"value":"$value",'
          '${validationType == null ? '' : '"validationType"'':''"${validationType.toString()}"'},'
          '"is_required":$isRequired'
          '}';
    }
    else{
      return '{'
          '"label":"$label",'
          '"key":"$key",'
          '"element_type":"$type",'
          '"value":"$value",'
          '"options":${json.encode(dropDownItem)},'
          '"is_required":$isRequired'
          // '${dropDownItem == null ? '' : "dropDownItem:$dropDownItem"}'
          '}';
    }
  }
}