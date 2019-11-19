import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_helper.dart';
import 'dart:developer' as developer;

const BASE_URL = "10.10.196.190/REST/";

class Api {
  String token;

  Api({this.token});

  LoginHelper helper = new LoginHelper();

  Future<Login2> login(String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "Usuario",
        body: jsonEncode({"senha": senha, "email": email}));
    if (response.statusCode == 200) {
      print(response.body);
      Login2 dadosJson = new Login2.fromMap(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

  Future<Login2> cadastro(String nome, String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "Usuario/Register",
        body: jsonEncode({"nome": nome, "email": email, "senha": senha}));
    if (response.statusCode == 200) {
      print(response.body);
      Login2 dadosJson = new Login2.fromMap(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }
}
