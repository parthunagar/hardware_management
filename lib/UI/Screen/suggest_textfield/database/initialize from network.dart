// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// Future<Database> getDB() async {
//   var databasesPath = await getDatabasesPath();
//   var path = join(databasesPath, 'dictionary.db');
//   var exists = await databaseExists(path);
//
//   if (!exists) {
//     print("Creating new copy from asset");
//     try {
//       await Directory(dirname(path)).create(recursive: true);
//     } catch (_) {}
//
//     ByteData data = await rootBundle.load(join('assets/database', 'dictionary.db'));
//     List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//
//     await File(path).writeAsBytes(bytes, flush: true);
//   }
//   //return await openDatabase(path);
//   var bomDataTable = await openDatabase(path, readOnly: true);
//   return bomDataTable;
//
// }