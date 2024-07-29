// To parse this JSON data, do
//
//     final module = moduleFromJson(jsonString);

import 'dart:convert';

Module moduleFromJson(String str) => Module.fromJson(json.decode(str));

String moduleToJson(Module data) => json.encode(data.toJson());

class Module {
  Module({
    this.result,
    this.message,
    this.moduleData,
  });

  String? result,message;
  List<ModuleDatum>? moduleData;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
    result: json["result"],
    message: json["message"],
    moduleData: json["data"] == null ? null : List<ModuleDatum>.from(json["data"].map((x) => ModuleDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": List<dynamic>.from(moduleData!.map((x) => x.toJson())),
  };
}

class ModuleDatum {
  ModuleDatum({
    this.id,
    this.name,
    this.total,
  });

  int? id,total;
  String? name;


  factory ModuleDatum.fromJson(Map<String, dynamic> json) => ModuleDatum(
    id: json["id"],
    name: json["name"],
    total: json['Total']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "Total": total,
  };
}
