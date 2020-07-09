import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Company {
  int id;
  String companyName;
  List<String> companyProducts;
  List<String> companyReviews;
  Company(
      {this.id, this.companyName, this.companyProducts, this.companyReviews});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Company Name': companyName,
      'Products': companyProducts,
      "Hyram's opinion": companyReviews,
    };
  }

  @override
  String toString() {
    return 'Company{id: $id, companyName: $companyName, companyProducts: Products{companyProducts}, companyReviews : Reviews{companyReviews}}';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'company_data.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "DECLARE @Products TABLE (id int, companyProducts TEXT); DECLARE @Reviews TABLE (id int, companyReviews TEXT); CREATE TABLE company(id INTEGER PRIMARY KEY, companyName TEXT, age INTEGER)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<List<Company>> companies() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('companies');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Company(
        id: maps[i]['id'],
        companyName: maps[i]['companyName'],
        companyProducts: maps[i]['Products{companyProducts}'],
        companyReviews: maps[i]['Products{companyReviews}'],
      );
    });
  }

// Now, use the method above to retrieve all the dogs.
  print(await companies());
}
