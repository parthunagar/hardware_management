import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vpn_scanner/UI/Screen/suggest_textfield/autosearch_textfield.dart';
import 'package:vpn_scanner/UI/Screen/suggest_textfield/database/databasehelper.dart';
import 'package:vpn_scanner/UI/Screen/suggest_textfield/database/dictionary_model.dart';
import 'package:vpn_scanner/UI/Screen/suggest_textfield/suggest_textfield_logic.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/Constant/colors.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';
import 'dart:developer' as logger;

class SuggestTextFieldPage extends StatelessWidget {
  final logic = Get.find<SuggestTextFieldLogic>();


  final List<String> names = [
    "Apple",
    "Bat",
    "Cat",
    "Dog",
    "Elephant",
    "Fan",
    "Ayden Ram",
    "Rowan Trevon",
    "Garrison Faisal",
    "Bridie Ford",
    "Rameel Xavier",
    "Abriel Yestin",
    "Cal Heston",
    "Ryland Nick",
    "Orson Kaylen",
  ];

  RxList<Dictionary>? items =  <Dictionary>[].obs;

  Future<RxList<Dictionary>?> getData() async {

    // var dbHelper = DatabaseHelper();
    // await dbHelper.getAllEntries().then((value) {
    //   debugPrint('getData => value : $value');
    //   // value.forEach(print);
    //   items!.addAll(value);// = value;
    //   try{
    //     debugPrint('getData => items : ${items![0].definition}');
    //   }catch(e){
    //     debugPrint('getData => items ERROR: $e');
    //   }
    //
    // });
    // debugPrint('getData => items.length 2 : ${items!.length}');
    // return items;




    var dbHelper = DatabaseHelper();
    await dbHelper.getDataWithQuery('ab').then((value){
      // logger.log('getData => value : $value');
      logger.log('getData => value : $value');
      if(value != null){
        names.clear();
        for (var f in value) {
          // debugPrint('f : $f');
          var a = Dictionary.fromMap(f);
          // debugPrint('Dictionary.fromMap(f) : ${Dictionary.fromMap(f)}');
          names.add(a.word.toString());
          // names.add(Dictionary.fromMap(f));
        }
      }
      // var a = Dictionary.fromMap(value);

    });

  }

//   getData() async {
//     // var db = await openDatabase('assets/database/dictionary.db');
//     var db = await openDatabase('dictionary.db');
//     // final List<Map<String, dynamic>> maps = await db.query('entries');
// final List<Map<String, dynamic>> maps = await db.rawQuery(
//   'SELECT id, word, wordtype FROM entries',
// );
//
//     return List.generate(maps.length, (i) {
//       return Dictionary(
//         id: maps[i]['id'],
//         word: maps[i]['word'],
//         wordType: maps[i]['wordtype'],
//         definition: maps[i]['definition']
//       );
//     });
//
//
//   }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Suggest TextField',
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
                // var a = "{document: http://office.greencode-app.hk//notice/documents/cn1650447051.pdf, type: notice}";
                // var  b = json.encode(a);
                // debugPrint('b : $b');
                // var c = json.decode(b);
                // debugPrint('c : ${c}');
                // debugPrint('c : ${c.runtimeType}');
                //
                // Map test  = {};
                // // var test;
                // // test.entries. ;
                //
                // debugPrint('test : ${test}');
                //   test.forEach((k,v) {
                //     debugPrint('k : ${k}');
                //     debugPrint('v : ${v}');
                //     // debugPrint('element : ${element['document']}');
                //   });
                //
                // List<String> listTab = [];
                // test.forEach((key, val) {
                //   listTab.add(val);
                //   debugPrint('listTab : $listTab');
                // });

               getData();

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
              AutoSearchInput(
                hintText: 'Enter Name',
                data: names,
                maxElementsToDisplay: 10,
                // maxLine: 10,
                onItemTap: (index) {
                  debugPrint('index : $index');
                },
                // onEditingComplete: (onEditingCompleteVal){
                //   debugPrint('onEditingCompleteVal : $onEditingCompleteVal');
                // },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
