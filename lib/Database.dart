import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class Company {
  String companyName;
  List<String> companyProducts;
  List<String> companyReviews;
  static final columnId = 'id';
  static final columnComp = 'companyName';
  static final columnProd = 'companyProducts';
  static final columnRev = 'companyReviews';
  Company({this.companyName, this.companyProducts, this.companyReviews});
  Map<String, dynamic> toJson() {
    return {
      'Company Name': companyName,
      'Products': companyProducts,
      "Hyram's opinion": companyReviews,
    };
  }

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyName: json["Company Name"],
        companyProducts: json["Products"],
        companyReviews: json["Hyram's opinion"],
      );
  // @override
  // String toString() {
  //   return 'Company{companyName: $companyName, companyProducts: Products{companyProducts}, companyReviews : Reviews{companyReviews}}';
  // }
}

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'company_data.db'),
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE Products(id INTEGER PRIMARY KEY, companyProducts TEXT);
        CREATE TABLE Reviews(id INTEGER PRIMARY KEY, companyReviews TEXT);
        CREATE TABLE company(id INTEGER PRIMARY KEY, 
                            companyName TEXT)",
      
        ''');
    }, version: 1);
  }

  newProduct(newProduct) async {
    final db = await database;

    var res = await db.rawInsert('''
      INSERT INTO Products(id, companyProducts) VALUES (SELECT id WHERE companyName = ?, ?)
    ''', [newProduct.companyName, newProduct.ProductName]);

    return res;
  }

  newCompany(newCompany) async {
    final db = await database;

    var res = await db.rawInsert('''
      INSERT INTO company(companyName) VALUES (?)
    ''', newCompany.companyName);

    return res;
  }

  newReview(newReview) async {
    final db = await database;

    var res = await db.rawInsert('''
      INSERT INTO Reviews(id, companyReviews) VALUES (SELECT id WHERE companyName = ?, ?)
    ''', [newReview.companyName, newReview.Review]);

    return res;
  }

  Future<dynamic> getCompanyName() async {
    final db = await database;
    var res = await db.query("company");
    if (res.length == 0)
      return null;
    else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : Null;
    }
  }

  _query(int companyId) async {
    // get a reference to the database
    Database db = await database;

    // get all rows
    List<Map> result = await db.query("Products");
    List<Map> res2 = await db.query("Reviewa");
    // print the results
    result.forEach((row) => print(row));

    // get single row
    List<String> col1 = [Company.columnProd]; //one for product info
    List<String>  col2 = [Company.columnRev]; //one for review info
    String whereString = '${Company.columnId} = ?';
    List<dynamic> whereArguments = [companyId];
    List<Map> res3 = await db.query("Products",
        columns: col1,
        where: whereString,
        whereArgs: whereArguments);
    List<Map> res4 = await db.query("Reviews",
        columns: col2,
        where: whereString,
        whereArgs: whereArguments);

    // print the results
    res3.forEach((row) => print(row)); //print products

    res4.forEach((row) => print(row)); //print reviews

    // TODO: learn how to combine them through iterator
  }
}
