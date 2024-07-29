

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as logger;
class Const {

  ///=========== PREFERENCE KEY =========== ///
  static const prefName = 'name';
  static const prefPass = 'pass';
  static const prefRememberMe = 'rememberMe';


  ///=========== API PREFERENCE KEY =========== ///

  static const prefAPIUserName = 'userName';
  static const prefAPIUserId = 'userId';
  static const prefAPIUserEmail = 'userEmail';
  static const prefAPIUserRole = 'userRole';
  static const prefAPIUserToken = 'userApiToken';


  ///=========== APP TITLE =========== ///
  static const appTitle = 'Assets Management';

  ///=========== APP BAR TITLE =========== ///
  static const appBarTitleDashBoard = 'DashBoard';
  static const appBarTitleCategoryDetail = 'Category List';
  static const appBarTitleDetail = 'Detail';
  static const appBarTitleAddCategory = 'Add Category';
  static const appBarTitleEditCategory = 'Edit Category';

  ///=========== Login Text Field Text =========== ///
  static const txtLblUsername = 'Username';
  static const txtLblPassword = 'Paswword';
  static const txtLblRememberMe = 'Remember me';

  ///=========== Add Category Text Field Text =========== ///
  static const txtLblCompanyName = 'Company name';
  static const txtLblSerialNo = 'Serial No.';
  static const txtLblType = 'Type';
  static const txtLblSize = 'Size';
  static const txtLblPurchaseDateWithFormat = 'Purchase Date (MM-DD-YYYY) *';
  static const txtLblPurchaseDate = 'Purchase Date';
  static const txtLblSellerName = 'Seller Name';
  static const txtLblWarrantyGuarantee = 'Warranty/Guarantee';
  static const txtLblHistory = 'History';

  ///=========== Search Text Field Text =========== ///
  static const txtLblSearch = 'Search';

  ///=========== Button Title =========== ///
  static const btnLblLogin = 'Login';
  static const btnLblAddCategory = 'Save';
  static const btnLblEditCategory = 'Upgrade';
  static const btnLblApply = 'Upgrade';

  ///=========== Category Operation Title =========== ///
  static const btnLblEdit = 'Edit';
  static const btnLblDelete = 'Delete';

  ///=========== Category Detail Title Label =========== ///
  static const lblHardwareId = 'Hardware Id';
  static const lblCompanyName = 'Company Name';
  static const lblModelNo = 'Model No.';
  static const lblSerialNo = 'Serial No';
  static const lblPurchaseDate = 'Purchase date';
  static const lblSellerName = 'Seller name';
  static const lblGW = 'Warranty/Guarantee';
  static const lblHistory = 'History';
  static const lblProcessor = 'Processor';
  static const lblPixel = 'Pixel';
  static const lblHardDiskDetails = 'Hard Disk Details';
  static const lblRAMDetails = 'RAM Details';
  static const lblProcessorAndOS = 'Processor and OS';
  static const lblKeyboardDetails = 'Keyboard Details';
  static const lblMouseDetails = 'Mouse Details';
  static const lblMonitorDetails = 'Monitor Details';
  static const lblHeadPhoneDetailsOptional = 'Head Phone Details (Optional)';
  static const lblCurrentUserName = 'Current user’s name';
  static const lblOthers = 'Others';
  static const lblDeadStockDate = 'DeadStock Date';
  static const lblDeadStockReason = 'Dead Stock Reason';
  static const lblLastUserName = 'Last User Name';
  static const lblUserName = 'User name';
  static const lblVGACable = 'VGA cable';
  static const lblHDMICable = 'HDMI cable';
  static const lblSataCable = 'Sata cable for Display (like HDMI)';
  static const lblPowerCable3Pin = 'Power cable 3 Pin';
  static const lblPowerCable2Pin = 'Power cable 2 Pin';
  static const lblHarddiskCableForMotherboard = 'Harddisk cable for Motherboard';
  static const lblAndroidCableUniversal = 'Android cable - Universal';
  static const lblAndroidCableCType = 'Android cable - C type';
  static const lblIOSCable = 'iOS cable';
  static const lblHdmiVGA = 'HDMI -> VGA';
  static const lblLocation = 'Location';
  static const lblDataNotFound = 'Data not Found';


  ///=========== Category List =========== ///
  static const ctCPU = 'CPU';
  static const ctLaptops = 'Laptops';
  static const ctHardDisk = 'Hard Disk';
  static const ctMobileDevices = 'Mobile Devices';
  static const ctMonitors = 'Monitors';
  static const ctKeyBoards = 'Key Boards';
  static const ctMouses = 'Mouses';
  static const ctCCTV = 'CCTV';
  static const ctHeadphones = 'Headphones';
  static const ctPrinters = 'Printers';
  static const ctSeller = 'Seller';
  static const ctDeadStock = 'DeadStock';
  static const ctPC = 'PC';
  static const ctDataCable = 'Data Cable';

  ///=========== Save Category Message =========== ///
  static const addMonitorSuccess = 'Add Monitor Successfully';
  static const addCPUSuccess = 'Add CPU Successfully';
  static const addLaptopSuccess = 'Add Laptop Successfully';
  static const addHardDiskSuccess = 'Add Hard Disk Successfully';
  static const addMobileDeviceSuccess = 'Add Mobile Device Successfully';
  static const addKeyBoardSuccess = 'Add Key Board Successfully';
  static const addMouseSuccess = 'Add Mouse Successfully';
  static const addCCTVSuccess = 'Add CCTV Successfully';
  static const addHeadphoneSuccess = 'Add Headphone Successfully';
  static const addPrinterSuccess = 'Add Printer Successfully';
  static const addSellerSuccess = 'Add Seller Successfully';

  ///=========== Category Hint Text =========== ///
  static const hHardDiskTypeWithAsterisk = 'Hard disk Type *';
  static const hHardDiskTypeWithoutAsterisk = 'Hard disk Type';

  static const hHardDiskSizeWithAsterisk = 'Hard disk Size *';
  static const hHardDiskSizeWithoutAsterisk = 'Hard disk Size';

  static const hShopAddressWithAsterisk = 'Shop Address *';
  static const hShopAddressWithoutAsterisk = 'Shop Address';

  static const hSizeWithAsterisk = 'Size *';
  static const hSizeWithoutAsterisk = 'Size';

  static const hModelNoWithAsterisk = 'Model No. *';
  static const hModelNoWithoutAsterisk = 'Model No.';

  static const hAddLocationWithAsterisk = 'Add Location *';
  static const hAddLocationWithoutAsterisk = 'Add Location';

  static const hCableTypeWithAsterisk = 'Cable Type *';
  static const hCableTypeWithoutAsterisk = 'Cable Type';

  static const hTotalCableWithAsterisk = 'Total no. of Cables *';
  static const hTotalCableWithoutAsterisk = 'Total no. of Cables';

  static const hRamTypeWithAsterisk = 'RAM Type *';
  static const hRamTypeWithoutAsterisk = 'RAM Type';

  static const hRamSizeWithAsterisk = 'RAM Size *';
  static const hRamSizeWithoutAsterisk = 'RAM Size';

  static const hProcessorWithAsterisk = 'Processor Type *';

  static const hSellerNameWithAsterisk = 'Seller Name *';

  static const hCompanyNameWithAsterisk = 'Company name *';

  static const hSerialNoWithAsterisk = 'Serial No. *';

  static const hGWWithAsterisk = 'Warranty/Guarantee *';

  static const hStorageSizeWithAsterisk = 'Storage Size *';

  static const hVersionWithAsterisk = 'Version *';
  static const hVersionWithoutAsterisk = 'Version';

  static const hDeviceTypeWithAsterisk = 'Device Type *';

  static const hPixelWithAsterisk = 'Pixel *';

  static const hShopNameWithAsterisk = 'Company/Shop Name *';
  static const hShopNameWithoutAsterisk = 'Company/Shop Name';

  static const hContact1WithAsterisk = 'Contact 1 *';

  static const hHardDiskTypeOptional = 'Hard disk Type (Optional)';
  static const hHardDiskSizeOptional = 'Hard disk Size (Optional)';
  static const hContact2Optional = 'Contact 2 (Optional)';


  static const hType = 'Type';
  static const hInInches = 'in Inches';

  static const apiSuccess = 'success';
  static const apiFail = 'fail';


  ///=========== Dashboard Category Color List =========== ///
  static  List colorList = [
    Colors.orange[400],
    Colors.green[400],
    Colors.grey[400],
    Colors.red[400],
    Colors.yellow[400],
    Colors.brown[400],
    Colors.blueGrey[400],
    Colors.blue[400],
    Colors.cyan[400],
    Colors.amber[400],
    Colors.deepOrange[400],
    Colors.deepPurple[400],
    Colors.lightGreen[400],
    Colors.pink[400],
    Colors.purpleAccent[400],
    Colors.deepOrange[400],
    Colors.deepOrangeAccent[400],
    Colors.lightBlue[400],
    Colors.lightBlueAccent[400],
    Colors.lime[400],
    Colors.lightGreenAccent[400],
    Colors.redAccent[400],
    Colors.greenAccent[400],
    Colors.indigo[400],
  ];

///=========== Dashboard Category List =========== ///
  static  List categoryList = [

    ['assets/img/dashboard_cctv.png','CCTV','6'],
    ['assets/img/dashboard_cpu.png','CPU','2'],
    ['assets/img/dashboard_data_cable.png','Data Cable','8'],
    ['assets/img/dashboard_deadstock.png','DeadStock','9'],
    ['assets/img/dashboard_harddisk.png','Hard Disk','5'],
    ['assets/img/dashboard_headphone.png','Headphones','10'],
    ['assets/img/dashboard_keyboard.png','Key Boards','3'],
    ['assets/img/dashboard_laptop.png','Laptops','4'],
    ['assets/img/dashboard_device.png','Mobile Devices','8'],
    ['assets/img/dashboard_monitor.png','Monitors','2'],
    ['assets/img/dashboard_mouse.png','Mouses','6'],
    ['assets/img/dashboard_pc.png','PC','12'],
    ['assets/img/dashboard_printer.png','Printers','7'],
    ['assets/img/dashboard_seller.png','Seller','9'],

  ];

  ///=========== Dashboard Filter Category List =========== ///
  static List monitorCompanyList = ['Dell','HP','Lenovo','Asus','Mac','AOC','BenQ','LG','Acer','Samsung','Philips','MSI'];
  static List monitorTypeList = ['LCD','LED','HD'];
  static List sizeList = ['24','27','29','32','34','38'];


  ///=========== FIELD TYPE =========== ///
  static const typeTextField = 'textField';
  static const typeDropDown = 'dropdown';
  static const typeDateTime = 'dateTime';

  ///=========== FIELD VALIDATION TYPE =========== ///
  static const typeValidationNumeric = 'numericonly';
  static const typeValidationContact = 'contactOnly';
  static const typeValidationDecimal = 'decimalonly';

  /// Toast for default time
  void toast(
      String? value, {
        ToastGravity? gravity,
        length = Toast.LENGTH_SHORT,
        Color? bgColor,
        Color? textColor,
        bool print = false,
      }) {
    if (value!.isEmpty) {
      logger.log(value);
    } else {
      Fluttertoast.showToast(
        msg: value.toString(),
        gravity: gravity,
        toastLength: length,
        backgroundColor: bgColor,
        textColor: textColor,
      );
      if (print) logger.log(value);
    }
  }
}

String jsonResponse = '{ '
    '"result": "success", '
    '"message": "Get Assets Successfully.", '
    '"data": '
      '{ '
        '"id": 2, '
        '"company_name": "Dell", '
        '"assets_type_id": 2, '
        '"asstetypeName": "CPU", '
        '"model_no": "Core i5", '
        '"serial_no": "OH735H-72872-96H-16CP", '
        '"custom_fields": ''[ '
            '{ '
              '"key": "Hard disk Type", '
              '"type" : "dropdown", '
              '"selected_item" : "HDD", '
              '"dropDownItem" : ["Hard disk Type","HDD","SSD","NVME"] '
            '}, '
            '{ '
              '"key": "Hard disk Size", '
              '"type" : "textfield", '
              '"value" : "250" '
            '}, '
            '{ '
              '"key": "Hard disk Size", '
              '"type" : "dropdown", '
              '"selected_item" : "GB", '
              '"dropDownItem" : ["Hard disk Size","GB","TB"] '
            '}, '
            '{ '
              '"key": "Hard disk Type (Optional)", '
              '"type" : "dropdown", '
              '"selected_item" : "SSD", '
              '"dropDownItem" : ["Hard disk Type (Optional)","HDD","SSD","NVME"] '
            '}, '
            '{ '
              '"key": "Hard disk Size (Optional)", '
              '"type" : "textfield", '
              '"value" : "250" '
            '}, '
            '{ '
              '"key": "Hard disk Size (Optional)", '
              '"type" : "dropdown", '
              '"selected_item" : "GB", '
              '"dropDownItem" : ["Hard disk Size (Optional)","GB","TB"] '
            '}, '
            '{ '
              '"key": "RAM Type", '
              '"type" : "dropdown", '
              '"selected_item" : "DDR2", '
              '"dropDownItem" : ["RAM Type","DDR2","DDR3","DDR4"] '
            '}, '
            '{ '
              '"key": "RAM Size", '
              '"type" : "dropdown", '
              '"selected_item" : "2", '
              '"dropDownItem" : ["RAM Size","2","4","6","8","10","12","14","16","18","20"] '
            '}, '
            '{ '
              '"key": "RAM Size", '
              '"type" : "dropdown", '
              '"selected_item" : "TB", '
              '"dropDownItem" : ["RAM Size","GB","TB"] '
            '}, '
            '{'
              '"key": "Processor Type", '
              '"type" : "dropdown", '
              '"selected_item" : "i3", '
              '"dropDownItem" : ["Processor Type","Pentium","C2D","i3","i5","i7","i9"] '
            '}, '
            '{ '
              '"key": "Purchase Date (MM-DD-YYYY)", '
              '"type" : "textfield", '
              '"value" : "04-12-2022" '
            '}, '
            '{ '
              '"key": "Seller Name", '
              '"type" : "textfield", '
              '"value": "VPN" '
            '}, '
            '{ '
              '"key": "Warranty/Gurantee", '
              '"type" : "textfield", '
              '"value": "1 year" '
            '}, '
            '{ '
              '"key": "History", '
              '"type" : "textfield", '
              '"value": "This is CPU history" '
            '}'
          '], '
        '"status": "1", '
        '"statusName": "Active", '
        '"created_by": 1, '
        '"updated_by": 1 '
      '} '
    '}';