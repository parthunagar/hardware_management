

import 'package:flutter/material.dart';
import 'package:vpn_scanner/Constant/app_constant.dart';

String? checkEmpty(String value,String fieldName) { //,{int? isDropdown}
  debugPrint('checkEmpty => value : $value');
  debugPrint('checkEmpty => fieldName : $fieldName');
  if( value == fieldName ){
    return 'Please select the $fieldName';
  }
  if(fieldName == Const.txtLblPassword && value.length <= 4 && value.isNotEmpty) {
    return 'Must have to apply more then 4 character';
  }

  //check email validation
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if(fieldName == Const.txtLblUsername && value.isEmpty) {
    return 'Please enter the $fieldName';
  }
  if (!regex.hasMatch(value) && fieldName == Const.txtLblUsername) {
    return 'Please enter valid email';
  }
  ///////////////////////

  if (value.isEmpty) {
    if(fieldName == Const.txtLblPurchaseDate)
      { return 'Please select the $fieldName'; }
    else
      { return 'Please enter the $fieldName';  }
  } else {
    return null;
  }
}



String? validateName(String value) {
  if (value.length < 3) {
    return 'Name must be more than 2 charater';
  } else {
    return null;
  }
}

String? isValidName(String value) {
  // final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$"); //apply with Fname Lname
  final nameRegExp = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
  RegExp regex1 =  RegExp(r'[0-9]+');
  if (regex1.hasMatch(value)) return 'Numeric value not allowed.';
  if(value.isEmpty) {
    return 'Please enter the Name';
  }
  else if (!nameRegExp.hasMatch(value)) {
    return "Must not contain special character (#,^&*!@_-+/?:;><') in last position.";
    // return 'Please enter valid name ( like: Fname Lname )';
  } else {
    return null;
  }

}

String? validateMobile(String value,String field) {
// Indian Mobile number are of 10 digit only
  print('validateMobile => value : $value');
  print('validateMobile => field : $field');

  if(field == 'Contact 2 (Optional)') {
    if(value.isNotEmpty && value.length > 10){
      return 'Mobile Number must be of 10 digit';
    }
    else if (value.isNotEmpty && value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    }
    else {
      return null;
    }
  }
  else {
    if(value.isEmpty) {
      return 'Please enter the contact number';
    }
    else if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }


}

String? validateEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}


String? isValidEmail(String value) {
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  // return emailRegExp.hasMatch(this);
}


String? isValidPassword(String value) {
  final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  // return passwordRegExp.hasMatch(this);
}

String? isValidPhone(String value) {
  final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
  // return phoneRegExp.hasMatch(this);
}