import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../utils/string.dart';
import '../helper/databases.dart';

class LoginHelper {
  static final LoginHelper _instance = LoginHelper.internal();

  factory LoginHelper() => _instance;

  LoginHelper.internal();

  Databases databases = new Databases();

  Future<bool> saveLogado(dynamic login_id, String token) async {
    deleteLogado();
    Database dbLogado = await databases.db;
    Logado logado = new Logado();
    logado.id = 1;
    logado.logado_login_id = login_id;
    logado.logado_Token = token;
    if (await dbLogado.insert(logadoTable, logado.toMap()) > 0) {
      print('usuario logado');
      return true;
    } else {
      return false;
    }
  }

  Future<Logado> getLogado() async {
    Database dbLogado = await databases.db;
    List<Map> maps = await dbLogado.rawQuery("SELECT * FROM $logadoTable");
    if (maps.length > 0) {
      Logado usuariologado = Logado.fromMap(maps.first);
      return usuariologado;
    } else {
      return null;
    }
  }

  Future<int> deleteLogado() async {
    Database dbLogin = await databases.db;
    await dbLogin.delete(logadoTable);
    return 1;
  }

  Future close() async {
    Database dbLogin = await databases.db;
    dbLogin.close();
  }
}

class Logado {
  dynamic id;
  dynamic logado_login_id;
  String logado_Token;

  Logado();

  Logado.fromMap(Map map) {
    id = map[idLogado];
    logado_login_id = map[loginId];
    logado_Token = map[logadoToken];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      idLogado: id,
      loginId: logado_login_id,
      logadoToken: logado_Token
    };
    return map;
  }
}

class Login2 {
  dynamic id;
  String nome;
  String email;
  String senha;

  Login2({this.id,this.email,this.senha,this.nome});

  factory Login2.fromJson(Map<String, dynamic> json) {
    return Login2(
    id:json['id'],
    email:json['email'],
    nome: json['nome'],
    senha: json['senha']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nome'] = this.nome;
    data['senha'] = this.senha;
    return data;
  }

  @override
  String toString() {
    return "Login(id: $id, name: $nome, email: $email, senha: $senha)";
  }
}

class Noticia {
  dynamic id, id_usuario;
  String titulo, descricao, minidescricao, nome;

  Noticia({this.id, this.id_usuario, this.titulo, this.descricao, this.minidescricao, this.nome});

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      id:json['id'],
      titulo:json['titulo'],
      descricao: json['descricao'],
      minidescricao: json['minidescricao'],
      id_usuario: json['id_usuario'],
      nome: json['nome']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['minidescricao'] = this.minidescricao;
    data['id_usuario'] = this.id_usuario;
    data['nome'] = this.nome;
    return data;
  }

  @override
  String toString() {
    return "Login(id: $id, titulo: $titulo, descricao: $descricao, minidescricao: $minidescricao, id_usuario: $id_usuario, nome: $nome)";
  }
}
