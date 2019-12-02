import 'package:http/http.dart' as http;
import 'dart:convert';
import 'class_helper.dart';

const BASE_URL = "https://apibusroutes.000webhostapp.com/REST/";

class Api {
  String token;

  Api({this.token});

  LoginHelper helper = new LoginHelper();

  Future<Login2> login(String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "Usuario",
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"senha": senha, "email": email}));
    if (response.statusCode == 200) {
      Login2 dadosJson = new Login2.fromJson(json.decode(response.body));
      return dadosJson;
    }else{
      return null;
    }
  }

  Future<Login2> cadastro(String nome, String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "Usuario/Register",
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"nome": nome, "email": email, "senha": senha}));
    if (response.statusCode == 200) {
      Login2 dadosJson = new Login2.fromJson(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

  Future<List<Noticia>> noticias()async{
    http.Response response = await http.get(BASE_URL + "Noticias/3",
        headers: {'APIKEY' :token, 'Content-Type': 'application/json', 'charset':'utf-8'},
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

  Future<List<dynamic>> RotasPerto(double lat,lng) async{
    http.Response response = await http.post(BASE_URL + "Rotas/rotasPerto",
      headers: {'APIKEY' :token, 'Content-Type': 'application/json', 'charset':'utf-8'} ,
      body: jsonEncode({"lat":lat,"lng": lng}));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }else{
      return null;
    }
  }
  
  Future<List<Rotas>> PegarRota(dynamic id) async{
    http.Response response = await http.get(BASE_URL + "rotas/pegarRotas/"+id,
      headers: {'APIKEY' :token, 'Content-Type': 'application/json', 'charset':'utf-8'}
    );
    if (response.statusCode == 200) {
      List<Rotas> rotas = jsonDecode(response.body).map<Rotas>((map) {
        return Rotas.fromJson(map);
      }).toList();
      return rotas;
    }else{
      return null;
    }
  }

  Future<List<Onibus>> PegarOnibus() async{
    http.Response response = await http.get(BASE_URL + "onibus/GetAllOnibus",
        headers: {'APIKEY' :token, 'Content-Type': 'application/json', 'charset':'utf-8'});
    if (response.statusCode == 200) {
      List<Onibus> onibus = jsonDecode(response.body).map<Onibus>((map) {
        return Onibus.fromJson(map);
      }).toList();
      return onibus;
    }else{
      return null;
    }
  }
}
