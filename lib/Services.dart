import "dart:convert";
import "package:http/http.dart" as http;
import 'Company.dart';

class Services {
  static const ROOT = 'http://localhost/Company/company_actions.php';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';

  static const _GET_ALL_ACTION = 'GET_ALL';
  static Future<String> createTable() async {
    try {
      //add the parameters tp pass to the request
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Response: ${response.body}');
      return response.body;
    } catch (e) {
      return 'error occured';
    }
  }

  static Future<List<Company>> getCompanies() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Respons : ${response.body}');
      if (200 == response.statusCode) {
        List<Company> list = parseResponse(response.body);
        return list;
      }else return List<Company>();
    } catch (e) {
      return List<Company>(); //returns empty list
    }
  }

  static List<Company> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Company>((json) => Company.fromJson(json)).toList();
  }
}
