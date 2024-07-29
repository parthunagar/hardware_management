// To parse this JSON data, do
//
//     final mapView = mapViewFromJson(jsonString);

import 'dart:convert';

MapView mapViewFromJson(String str) => MapView.fromJson(json.decode(str));

String mapViewToJson(MapView data) => json.encode(data.toJson());

class MapView {
  MapView({
    this.result,
    this.message,
    this.mapViewData,
  });

  String? result,message;
  MapViewData? mapViewData;

  factory MapView.fromJson(Map<String, dynamic> json) => MapView(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    mapViewData: json["data"] == null ? null : MapViewData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "data": mapViewData == null ? null : mapViewData!.toJson(),
  };
}

class MapViewData {
  MapViewData({
    this.id,
    this.companyName,
    this.assetsTypeId,
    this.assetTypeName,
    this.modelNo,
    this.serialNo,
    this.customFields,
    this.status,
    this.statusName,
    this.createdBy,
    this.updatedBy,
  });

  int? id,assetsTypeId,createdBy,updatedBy;
  String? companyName,assetTypeName, modelNo,serialNo,status,statusName;
  List<CustomField>? customFields;

  factory MapViewData.fromJson(Map<String, dynamic> json) => MapViewData(
    id: json["id"] == null ? null : json["id"],
    companyName: json["company_name"] == null ? null : json["company_name"],
    assetsTypeId: json["assets_type_id"] == null ? null : json["assets_type_id"],
    assetTypeName: json["assetTypeName"] == null ? null : json["assetTypeName"],
    modelNo: json["model_no"] == null ? null : json["model_no"],
    serialNo: json["serial_no"] == null ? null : json["serial_no"],
    customFields: json["custom_fields"] == null ? null : List<CustomField>.from(json["custom_fields"].map((x) => CustomField.fromJson(x))),
    status: json["status"] == null ? null : json["status"],
    statusName: json["statusName"] == null ? null : json["statusName"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    updatedBy: json["updated_by"] == null ? null : json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "company_name": companyName == null ? null : companyName,
    "assets_type_id": assetsTypeId == null ? null : assetsTypeId,
    "assetTypeName": assetTypeName == null ? null : assetTypeName,
    "model_no": modelNo == null ? null : modelNo,
    "serial_no": serialNo == null ? null : serialNo,
    "custom_fields": customFields == null ? null : List<dynamic>.from(customFields!.map((x) => x.toJson())),
    "status": status == null ? null : status,
    "statusName": statusName == null ? null : statusName,
    "created_by": createdBy == null ? null : createdBy,
    "updated_by": updatedBy == null ? null : updatedBy,
  };
}

class CustomField {
  CustomField({
    this.label,
    this.labelKey,
    this.key,
    this.elementType,
    this.value,
    this.options,
    this.isRequired,
    this.validationType,
  });

  String? label,labelKey,key,elementType,value,validationType;
  bool? isRequired;
  // List<Option>? options;
  List<Map<String, String>>? options;

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
    label: json["label"] == null ? null : json["label"],
    labelKey: json["labelKey"] == null ? null : json["labelKey"],
    key: json["key"] == null ? null : json["key"],
    elementType: json["element_type"] == null ? null : json["element_type"],
    value: json["value"] == null ? null : json["value"],
    // options: json["options"] == null ? null : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    options: json["options"] == null ? null : List<Map<String, String>>.from(json["options"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
    isRequired: json["is_required"] == null ? null : json["is_required"],
    validationType: json["validationType"] == null ? null : json["validationType"],
  );

  Map<String, dynamic> toJson() => {
    "label": label == null ? null : label,
    "labelKey": labelKey == null ? null : labelKey,
    "key": key == null ? null : key,
    "element_type": elementType == null ? null : elementType,
    "value": value == null ? null : value,
    // "options": options == null ? null : List<dynamic>.from(options!.map((x) => x.toJson())),
    "options": options == null ? null : List<dynamic>.from(options!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    "is_required": isRequired == null ? null : isRequired,
    "validationType": validationType == null ? null : validationType,
  };
}

class Option {
  Option({
    this.hardDiskType,
    this.hardDiskTypeHdd,
    this.hardDiskTypeSsd,
    this.hardDiskTypeNvmv,
    this.hardDiskSize,
    this.hardDiskSizeGb,
    this.hardDiskSizeTb,
    this.hardDiskTypeOptional,
    this.hardDiskSizeOptional,
    this.ramType,
    this.ramTypeDdr2,
    this.ramTypeDdr3,
    this.ramTypeDdr4,
    this.ramSize,
    this.ramSize2,
    this.ramSize4,
    this.ramSize6,
    this.ramSize8,
    this.ramSize10,
    this.ramSize12,
    this.ramSize14,
    this.ramSize16,
    this.ramSize18,
    this.ramSize20,
    this.ramSizeGb,
    this.ramSizeTb,
    this.processorType,
    this.processorPentium,
    this.processorC2D,
    this.processorI3,
    this.processorI5,
    this.processorI7,
    this.processorI9,
    this.cableType,
    this.vgaCable,
    this.hdmiCable,
    this.sataCable,
    this.powerCable,
    this.hardDiskCable,
    this.androidCableU,
    this.androidCableC,
    this.iosCable,
    this.hdmiToVgaCable,
    this.storageSize,
    this.storageSizeGb,
    this.storageSizeTb,
    this.deviceType,
    this.deviceTypeAndroid,
    this.deviceTypeIos,
    this.screenType,
    this.screenTypeLcd,
    this.screenTypeLed,
    this.screenTypeHd,
  });

  String? hardDiskType,hardDiskTypeHdd,hardDiskTypeSsd,hardDiskTypeNvmv;
  String? hardDiskSize,hardDiskSizeGb,hardDiskSizeTb,hardDiskTypeOptional,hardDiskSizeOptional,ramType,ramTypeDdr2,ramTypeDdr3,ramTypeDdr4,ramSize,ramSize2;
  String? ramSize4,ramSize6,ramSize8,ramSize10,ramSize12,ramSize14,ramSize16,ramSize18,ramSize20,ramSizeGb,ramSizeTb,processorType,processorPentium,processorC2D;
  String? processorI3,processorI5,processorI7,processorI9,cableType,vgaCable,hdmiCable,sataCable,powerCable,hardDiskCable,androidCableU,androidCableC,iosCable;
  String? hdmiToVgaCable,storageSize,storageSizeGb,storageSizeTb,deviceType,deviceTypeAndroid,deviceTypeIos,screenType,screenTypeLcd,screenTypeLed,screenTypeHd;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    hardDiskType: json["hardDiskType"] == null ? null : json["hardDiskType"],
    hardDiskTypeHdd: json["hardDiskTypeHdd"] == null ? null : json["hardDiskTypeHdd"],
    hardDiskTypeSsd: json["hardDiskTypeSsd"] == null ? null : json["hardDiskTypeSsd"],
    hardDiskTypeNvmv: json["hardDiskTypeNvmv"] == null ? null : json["hardDiskTypeNvmv"],
    hardDiskSize: json["hardDiskSize"] == null ? null : json["hardDiskSize"],
    hardDiskSizeGb: json["hardDiskSizeGb"] == null ? null : json["hardDiskSizeGb"],
    hardDiskSizeTb: json["hardDiskSizeTb"] == null ? null : json["hardDiskSizeTb"],
    hardDiskTypeOptional: json["hardDiskTypeOptional"] == null ? null : json["hardDiskTypeOptional"],
    hardDiskSizeOptional: json["hardDiskSizeOptional"] == null ? null : json["hardDiskSizeOptional"],
    ramType: json["ramType"] == null ? null : json["ramType"],
    ramTypeDdr2: json["ramTypeDdr2"] == null ? null : json["ramTypeDdr2"],
    ramTypeDdr3: json["ramTypeDdr3"] == null ? null : json["ramTypeDdr3"],
    ramTypeDdr4: json["ramTypeDdr4"] == null ? null : json["ramTypeDdr4"],
    ramSize: json["ramSize"] == null ? null : json["ramSize"],
    ramSize2: json["ramSize2"] == null ? null : json["ramSize2"],
    ramSize4: json["ramSize4"] == null ? null : json["ramSize4"],
    ramSize6: json["ramSize6"] == null ? null : json["ramSize6"],
    ramSize8: json["ramSize8"] == null ? null : json["ramSize8"],
    ramSize10: json["ramSize10"] == null ? null : json["ramSize10"],
    ramSize12: json["ramSize12"] == null ? null : json["ramSize12"],
    ramSize14: json["ramSize14"] == null ? null : json["ramSize14"],
    ramSize16: json["ramSize16"] == null ? null : json["ramSize16"],
    ramSize18: json["ramSize18"] == null ? null : json["ramSize18"],
    ramSize20: json["ramSize20"] == null ? null : json["ramSize20"],
    ramSizeGb: json["ramSizeGb"] == null ? null : json["ramSizeGb"],
    ramSizeTb: json["ramSizeTb"] == null ? null : json["ramSizeTb"],
    processorType: json["processorType"] == null ? null : json["processorType"],
    processorPentium: json["processorPentium"] == null ? null : json["processorPentium"],
    processorC2D: json["processorC2d"] == null ? null : json["processorC2d"],
    processorI3: json["processorI3"] == null ? null : json["processorI3"],
    processorI5: json["processorI5"] == null ? null : json["processorI5"],
    processorI7: json["processorI7"] == null ? null : json["processorI7"],
    processorI9: json["processorI9"] == null ? null : json["processorI9"],
    cableType: json["cableType"] == null ? null : json["cableType"],
    vgaCable: json["vgaCable"] == null ? null : json["vgaCable"],
    hdmiCable: json["hdmiCable"] == null ? null : json["hdmiCable"],
    sataCable: json["sataCable"] == null ? null : json["sataCable"],
    powerCable: json["powerCable"] == null ? null : json["powerCable"],
    hardDiskCable: json["hardDiskCable"] == null ? null : json["hardDiskCable"],
    androidCableU: json["androidCableU"] == null ? null : json["androidCableU"],
    androidCableC: json["androidCableC"] == null ? null : json["androidCableC"],
    iosCable: json["iosCable"] == null ? null : json["iosCable"],
    hdmiToVgaCable: json["hdmiToVgaCable"] == null ? null : json["hdmiToVgaCable"],
    storageSize: json["storageSize"] == null ? null : json["storageSize"],
    storageSizeGb: json["storageSizeGb"] == null ? null : json["storageSizeGb"],
    storageSizeTb: json["storageSizeTb"] == null ? null : json["storageSizeTb"],
    deviceType: json["deviceType"] == null ? null : json["deviceType"],
    deviceTypeAndroid: json["deviceTypeAndroid"] == null ? null : json["deviceTypeAndroid"],
    deviceTypeIos: json["deviceTypeIos"] == null ? null : json["deviceTypeIos"],
    screenType: json["screenType"] == null ? null : json["screenType"],
    screenTypeLcd: json["screenTypeLcd"] == null ? null : json["screenTypeLcd"],
    screenTypeLed: json["screenTypeLed"] == null ? null : json["screenTypeLed"],
    screenTypeHd: json["screenTypeHd"] == null ? null : json["screenTypeHd"],
  );

  Map<String, dynamic> toJson() => {
    "hardDiskType": hardDiskType == null ? null : hardDiskType,
    "hardDiskTypeHdd": hardDiskTypeHdd == null ? null : hardDiskTypeHdd,
    "hardDiskTypeSsd": hardDiskTypeSsd == null ? null : hardDiskTypeSsd,
    "hardDiskTypeNvmv": hardDiskTypeNvmv == null ? null : hardDiskTypeNvmv,
    "hardDiskSize": hardDiskSize == null ? null : hardDiskSize,
    "hardDiskSizeGb": hardDiskSizeGb == null ? null : hardDiskSizeGb,
    "hardDiskSizeTb": hardDiskSizeTb == null ? null : hardDiskSizeTb,
    "hardDiskTypeOptional": hardDiskTypeOptional == null ? null : hardDiskTypeOptional,
    "hardDiskSizeOptional": hardDiskSizeOptional == null ? null : hardDiskSizeOptional,
    "ramType": ramType == null ? null : ramType,
    "ramTypeDdr2": ramTypeDdr2 == null ? null : ramTypeDdr2,
    "ramTypeDdr3": ramTypeDdr3 == null ? null : ramTypeDdr3,
    "ramTypeDdr4": ramTypeDdr4 == null ? null : ramTypeDdr4,
    "ramSize": ramSize == null ? null : ramSize,
    "ramSize2": ramSize2 == null ? null : ramSize2,
    "ramSize4": ramSize4 == null ? null : ramSize4,
    "ramSize6": ramSize6 == null ? null : ramSize6,
    "ramSize8": ramSize8 == null ? null : ramSize8,
    "ramSize10": ramSize10 == null ? null : ramSize10,
    "ramSize12": ramSize12 == null ? null : ramSize12,
    "ramSize14": ramSize14 == null ? null : ramSize14,
    "ramSize16": ramSize16 == null ? null : ramSize16,
    "ramSize18": ramSize18 == null ? null : ramSize18,
    "ramSize20": ramSize20 == null ? null : ramSize20,
    "ramSizeGb": ramSizeGb == null ? null : ramSizeGb,
    "ramSizeTb": ramSizeTb == null ? null : ramSizeTb,
    "processorType": processorType == null ? null : processorType,
    "processorPentium": processorPentium == null ? null : processorPentium,
    "processorC2d": processorC2D == null ? null : processorC2D,
    "processorI3": processorI3 == null ? null : processorI3,
    "processorI5": processorI5 == null ? null : processorI5,
    "processorI7": processorI7 == null ? null : processorI7,
    "processorI9": processorI9 == null ? null : processorI9,
    "cableType": cableType == null ? null : cableType,
    "vgaCable": vgaCable == null ? null : vgaCable,
    "hdmiCable": hdmiCable == null ? null : hdmiCable,
    "sataCable": sataCable == null ? null : sataCable,
    "powerCable": powerCable == null ? null : powerCable,
    "hardDiskCable": hardDiskCable == null ? null : hardDiskCable,
    "androidCableU": androidCableU == null ? null : androidCableU,
    "androidCableC": androidCableC == null ? null : androidCableC,
    "iosCable": iosCable == null ? null : iosCable,
    "hdmiToVgaCable": hdmiToVgaCable == null ? null : hdmiToVgaCable,
    "storageSize": storageSize == null ? null : storageSize,
    "storageSizeGb": storageSizeGb == null ? null : storageSizeGb,
    "storageSizeTb": storageSizeTb == null ? null : storageSizeTb,
    "deviceType": deviceType == null ? null : deviceType,
    "deviceTypeAndroid": deviceTypeAndroid == null ? null : deviceTypeAndroid,
    "deviceTypeIos": deviceTypeIos == null ? null : deviceTypeIos,
    "screenType": screenType == null ? null : screenType,
    "screenTypeLcd": screenTypeLcd == null ? null : screenTypeLcd,
    "screenTypeLed": screenTypeLed == null ? null : screenTypeLed,
    "screenTypeHd": screenTypeHd == null ? null : screenTypeHd,
  };
}
