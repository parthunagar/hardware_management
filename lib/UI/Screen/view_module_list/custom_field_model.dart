import 'dart:convert';

List<CustomField> customFieldFromJson(String str) => List<CustomField>.from(json.decode(str).map((x) => CustomField.fromJson(x)));

String customFieldToJson(List<CustomField> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomField {
  CustomField({
    this.key,
    this.value,
  });

  String? key,value;

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}
