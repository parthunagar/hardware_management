import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Screen/suggetion_api/src/utils.dart';
import 'package:vpn_scanner/UI/Screen/suggetion_api/widgets/custom_textField.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';

class SuggetionApiPage extends StatefulWidget {
  const SuggetionApiPage({Key? key}) : super(key: key);

  @override
  State<SuggetionApiPage> createState() => _SuggetionApiPageState();
}

class _SuggetionApiPageState extends State<SuggetionApiPage> {

  TextEditingController cDictionary = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Suggest API',
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.backArrow)),
        action: [
          Padding(padding: EdgeInsets.only(right: w * 0.04),
            child: GestureDetector(
              onTap: () {
                TextUtils().suggestionApi();
              },
              child: Icon(Icons.view_agenda, color: vpnBlue)),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DictionaryTextField(
                // controller: cDictionary,
                // onChange: (onChangeVal) {
                //   debugPrint('onChangeVal : $onChangeVal');
                // },
                onTap: () {
                  debugPrint(' ===========> onTap <=========== ');
                },
                onChangeValue: (onchangeValCustom) {
                  debugPrint('onchangeValCustom : $onchangeValCustom');
                },
                maxElementsToDisplay: 50,
                showSuggestionList: true,



              ),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
              Text('as a s as ass  s  as as as as as  as as as as as sa sa sa as  as as as as as as as as as as as as as  as as as as'
                  'as a as  a a  sa as as as as as as as as as  as as as as as  as as as as'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}



