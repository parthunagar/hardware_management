import 'package:vpn_scanner/Utils/SqfLite/utils/Utils.dart';

class HardWareDetail {
  int? id;
  String? companyName;
  String? modelNo;
  String? serialNo;
  String? customField;

  Map<String, Object?> toMap() {
    var map = <String, Object?> {
      columnCompanyName: companyName,
      columnModelNo: modelNo,
      columnSerialNo: serialNo,
      columnCustomerField: customField,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
  HardWareDetail();

  HardWareDetail.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    companyName = map[columnCompanyName];
    modelNo = map[columnModelNo];
    serialNo = map[columnSerialNo];
    customField = map[columnCustomerField];
  }
}