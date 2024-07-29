import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vpn_scanner/Constant/colors.dart';

import 'qr_code_controller.dart';

class QrCodeScreenWidget extends GetView<QrCodeScreenLogic> {
  const QrCodeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    // final logic = Get.find<QrCodeScreenLogic>();
    var scanArea = (w < 400 || h < 400) ? 250.0 : 300.0;
    return QRView(
      key: controller.qrKey,
      onQRViewCreated: controller.onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: cRed,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => controller.onPermissionSet(context, ctrl, p),
    );
  }

}


