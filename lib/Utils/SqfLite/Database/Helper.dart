import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:vpn_scanner/Utils/SqfLite/model/hardware_detail_model.dart';
import 'package:vpn_scanner/Utils/SqfLite/utils/Utils.dart';

class Helper {
  static final Helper _instance = Helper.internal();
  factory Helper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if(_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table $tableModuleDetail ( 
          $columnId integer primary key autoincrement, 
          $columnCompanyName text not null,
          $columnModelNo text not null,
          $columnSerialNo text not null,
          $columnCustomerField text not null)
          ''');
    });
    return theDb;
  }


  Helper.internal();

  Future<HardWareDetail> insert(HardWareDetail user) async {
    var dbClient = await db;
    user.id = await dbClient.insert(tableModuleDetail, user.toMap());
    return user;
  }

  Future<HardWareDetail?> getUser(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableModuleDetail,
        columns: [columnId, columnCompanyName, columnModelNo, columnSerialNo,columnCustomerField],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return HardWareDetail.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableModuleDetail, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(HardWareDetail user) async {
    var dbClient = await db;
    return await dbClient.update(tableModuleDetail, user.toMap(),
        where: '$columnId = ?', whereArgs: [user.id]);
  }

  Future<List<HardWareDetail>> getAllUsers() async {
    List<HardWareDetail> user = [];
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableModuleDetail,
        columns: [columnId, columnCompanyName, columnModelNo, columnSerialNo,columnCustomerField]);
    if (maps.isNotEmpty) {
      for (var f in maps) {
        user.add(HardWareDetail.fromMap(f));
         debugPrint('getAllUser : ${HardWareDetail.fromMap(f).toString()}');
      }
    }
    return user;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}