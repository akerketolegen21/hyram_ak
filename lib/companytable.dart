import 'package:flutter/material.dart';
import 'Company.dart';
import 'Services.dart';

class CompanyTableDemo extends StatefulWidget {
  CompanyTableDemo() : super();

  final String title = 'Company Product Reviews';
  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class CompanyTableDemoState extends State<CompanyTableDemo> {
  List<Company> _companies;

  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _companyNameContr;
  TextEditingController _reviewContr;
  TextEditingController _prodContr;

  Company _selectedCompany;
  bool isUpd;
  String titleProgr;

  @override
  void initState() {
    super.initState();
    _companies = [];
    isUpd = false;
    _scaffoldKey = GlobalKey();
    _companyNameContr = TextEditingController();

    _reviewContr = TextEditingController();
    _prodContr = TextEditingController();
  }

  _createTable() {}
  _getCompanies() {}

// clearing textField vals
  _clearValues() {
    _companyNameContr.text = '';
    _prodContr.text = '';
    _reviewContr = '';
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(titleProgr),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              Icons.bubble_chart,
              color: Colors.lightBlue[50],
              size: 50,
            ),
            onPressed: () {
              _createTable();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              Icons.bubble_chart,
              color: Colors.lightBlue[50],
              size: 50,
            ),
            onPressed: () {
              _getCompanies();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _companyNameContr,
                decoration: InputDecoration.collapsed(hintText: 'Company Name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _prodContr,
                decoration:
                    InputDecoration.collapsed(hintText: 'Company Products'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _reviewContr,
                decoration:
                    InputDecoration.collapsed(hintText: 'Product Review'),
              ),
            ),
            isUpd
                ? Row(
                    children: <Widget>[
                      OutlineButton(
                        // cancel button
                        child: Text('Cancel'),
                        onPressed: () {
                          setState(() {
                            isUpd = false;
                          });
                        },
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
