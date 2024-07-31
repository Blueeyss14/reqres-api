import 'dart:convert';
import 'package:api_consume3/Api/api.dart';
import 'package:http/http.dart' as http;

class HumanData {
  String email, firstName, lastName, photo;
  int id;

  HumanData({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.id,
  });

  static Future<HumanData> humanAPI() async {
    Uri url = Uri.parse(ApiUrl.apiURL);

    var responseResult = await http.get(url);
    var data = (json.decode(responseResult.body))["data"];

    return HumanData(
        email: data['email'],
        firstName: data['first_name'],
        lastName: data['last_name'],
        photo: data['avatar'],
        id: data['id']);
  }
}
