import 'dart:convert';

UpdateView updateViewFromJson(String str) => UpdateView.fromJson(json.decode(str));

String updateViewToJson(UpdateView data) => json.encode(data.toJson());

class UpdateView {
  UpdateView({
    this.result,
    this.message,
    this.updateViewData,
  });

  String? result,message;
  UpdateViewData? updateViewData;

  factory UpdateView.fromJson(Map<String, dynamic> json) => UpdateView(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    updateViewData: json["data"] == null ? null : UpdateViewData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "data": updateViewData == null ? null : updateViewData!.toJson(),
  };
}

class UpdateViewData {
  UpdateViewData({
    this.id,
    this.companyName,
    this.assetsTypeId,
    this.asstetypeName,
    this.modelNo,
    this.serialNo,
    this.customFields,
    this.status,
    this.statusName,
    this.createdBy,
    this.updatedBy,
  });

  int? id,assetsTypeId,createdBy,updatedBy;
  String? companyName,asstetypeName,modelNo,serialNo,status,statusName;
  List<CustomField>? customFields;

  factory UpdateViewData.fromJson(Map<String, dynamic> json) => UpdateViewData(
    id: json["id"] == null ? null : json["id"],
    companyName: json["company_name"] == null ? null : json["company_name"],
    assetsTypeId: json["assets_type_id"] == null ? null : json["assets_type_id"],
    asstetypeName: json["asstetypeName"] == null ? null : json["asstetypeName"],
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
    "asstetypeName": asstetypeName == null ? null : asstetypeName,
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
    this.key,
    this.type,
    this.selectedItem,
    this.dropDownItem,
    this.value,
    this.validationType
  });

  String? key,type,selectedItem,value,validationType;
  List<String>? dropDownItem;

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
    key: json["key"] == null ? null : json["key"],
    type: json["type"] == null ? null : json["type"],
    selectedItem: json["selected_item"] == null ? null : json["selected_item"],
    dropDownItem: json["dropDownItem"] == null ? null : List<String>.from(json["dropDownItem"].map((x) => x)),
    value: json["value"] == null ? null : json["value"],
    validationType: json["validationType"] == null ? null : json["validationType"],
  );

  Map<String, dynamic> toJson() => {
    "key": key == null ? null : key,
    "type": type == null ? null : type,
    "selected_item": selectedItem == null ? null : selectedItem,
    "dropDownItem": dropDownItem == null ? null : List<dynamic>.from(dropDownItem!.map((x) => x)),
    "value": value == null ? null : value,
    "validationType": validationType == null ? null : validationType,
  };
}
