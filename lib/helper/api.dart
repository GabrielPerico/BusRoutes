import 'package:http/http.dart' as http;
import 'dart:convert';
import 'class_helper.dart';
import 'dart:developer' as developer;

const BASE_URL = "http://10.10.196.190/busroutes/REST/";

class Api {
  String token;

  Api({this.token});

  LoginHelper helper = new LoginHelper();

  Future<Login2> login(String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "Usuario",
        body: jsonEncode({"senha": senha, "email": email}));
    if (response.statusCode == 200) {
      Login2 dadosJson = new Login2.fromJson(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

  Future<Login2> cadastro(String nome, String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "Usuario/Register",
        body: jsonEncode({"nome": nome, "email": email, "senha": senha}));
    print(response.body);
    if (response.statusCode == 200) {
      Login2 dadosJson = new Login2.fromJson(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

  Future<List<Noticia>> noticias()async{
    http.Response response = await http.get(BASE_URL + "Noticias/3",
        headers: {'APIKEY' :token, 'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      List<Noticia> noticias = json.decode(response.body).map<Noticia>((map) {
        return Noticia.fromJson(map);
      }).toList();
      return noticias;
    }else{
      return null;
    }
  }
}
