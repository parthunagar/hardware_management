import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vpn_scanner/AppRoute/app_route.dart';
import 'package:vpn_scanner/UI/Screen/qr_code_screen/qr_code_provider.dart';

class QrCodeScreenLogic extends GetxController with StateMixin<dynamic> {


  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool? setScanData = false;

  scanCodeApi() {
    QrCodeProvider().getQrCodeData().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });
  }



  void onQRViewCreated(QRViewController controller)  {

    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      debugPrint('onQRViewCreated => scanData.code : ${scanData.code}');
      debugPrint('onQRViewCreated => scanData.format : ${scanData.format}');
      debugPrint('onQRViewCreated => scanData.rawBytes : ${scanData.rawBytes}');
      result = scanData;
      try{
        if(scanData != null && setScanData == false ){
          setScanData = true;
          // await controller.pauseCamera();
          Get.toNamed(AppRoutes.categoryDetailScreen)?.then((value) {
            debugPrint(' =======> categoryDetailScreen is back <======= ');
            setScanData = false;
          });
        }
      }
      catch(e){
        debugPrint('onQRViewCreated => ERROR : $e');
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    debugPrint('_onPermissionSet => ${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('no Permission')));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scanCodeApi();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller?.dispose();
    super.onClose();
  }
}
