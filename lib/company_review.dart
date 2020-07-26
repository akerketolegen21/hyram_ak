import 'dart:async';

import 'package:first_app/Company.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Company.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // const back_col = const Color(0x3fc1c9);
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.cyan[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyOtherPage(),
    );
  }
}

class MyOtherPage extends StatefulWidget {
  MyOtherPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyOtherPageState createState() => _MyOtherPageState();
}

class _MyOtherPageState extends State<MyOtherPage> {
  Map<String, String> CompanyInfo = {};

  Future _companyFuture;
  @override
  void initState() {
    super.initState();
    _companyFuture = getCompany();
  }

  getCompany() async {
    final _companyData = await DBProvider.db.getCompanyName();
    return _companyData;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: FutureBuilder(
      future: _companyFuture,
      builder: (_, _companyData) {
        switch (_companyData.connectionState) {
          case ConnectionState.none:
            return Container();
          case ConnectionState.waiting:
            return Container();
          case ConnectionState.active:
          case ConnectionState.done:
            if (!CompanyInfo.containsKey('id')) {
              CompanyInfo = Map<String, String>.from(_companyData.data);
            }
            return Column(
              children: <Widget>[
                for(int i=0; i< )
                // Text() TODO : Showing products and reviews db
              ],
            );
        }
        return Container();
      },
    )

        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
