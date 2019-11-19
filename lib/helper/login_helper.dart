import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../utils/string.dart';
import '../helper/databases.dart';

class LoginHelper {
  static final LoginHelper _instance = LoginHelper.internal();

  factory LoginHelper() => _instance;

  LoginHelper.internal();

  Databases databases = new Databases();

  Future<bool> saveLogado(int login_id, String token) async {
    Database dbLogado = await databases.db;
    Logado logado = new Logado();
    logado.id=1;
    logado.logado_login_id = login_id;
    logado.logado_Token = token;
    if(await dbLogado.insert(logadoTable, logado.toMap())>0) {
      return true;
    }else{
      return false;
    }
  }

  Future<Logado> getLogado() async{
    Database dbLogado = await databases.db;
    List<Map> maps =  await dbLogado.rawQuery("SELECT * FROM $logadoTable");
    if(maps.length>0){
      Logado usuariologado = Logado.fromMap(maps.first);
      return usuariologado;
    }else{
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
  int id;
  int logado_login_id;
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
  int id;
  String nome;
  String email;
  String senha;

  Login2();

  Login2.fromMap(Map map) {
    id = int.parse(map[idLogin]);
    email = map[emailLogin];
    nome = map[nomeLogin];
    senha = map[senhaLogin];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      emailLogin: email,
      nomeLogin: nome,
      senhaLogin: senha,
    };
    if (id != null) {
      map[idLogin] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Login(id: $id, name: $nome, email: $email, senha: $senha)";
  }
}
