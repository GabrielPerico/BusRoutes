import 'package:flutter/material.dart';
import '../helper/api.dart';
import '../helper/class_helper.dart';
import 'page.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formCadastro = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();
  LoginHelper helper = LoginHelper();
  Api api = new Api();
  FocusNode _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Text('Cadastro',style: TextStyle(color: Colors.black),),
            centerTitle: true,
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            elevation: 5,
          ),
          preferredSize: Size.fromHeight(56),
        ),
        body: WillPopScope(
            child: SingleChildScrollView(
                child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Padding(
                  child: new Image.asset(
                    'img/BusRoutes_Logo.png',
                    fit: BoxFit.contain,
                  ),
                  padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 0),
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 15,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: new Column(children: <Widget>[
                        new Form(
                          key: _formCadastro,
                            child: Column(
                          children: <Widget>[
                            new Padding(
                              child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _nomeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Digite seu nome';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hoverColor: Colors.purple,
                                      labelStyle:
                                      new TextStyle(color: Colors.purple),
                                      focusColor: Colors.purple,
                                      labelText: "Nome",
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.purple),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.purple),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ))),
                              padding: const EdgeInsets.all(15.0),
                            ),
                            new Padding(
                              child: new TextFormField(
                                  controller: _senhaController,
                                  style: TextStyle(color: Colors.black),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Digite sua senha';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hoverColor: Colors.purple,
                                      labelStyle:
                                      new TextStyle(color: Colors.purple),
                                      focusColor: Colors.purple,
                                      labelText: "Senha",
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.purple),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.purple),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ))),
                              padding: const EdgeInsets.all(15.0),
                            ),
                            new Padding(
                              child: new TextFormField(
                                  controller: _emailController,
                                  focusNode: _focusNode,
                                  style: TextStyle(color: Colors.black),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Digite seu email';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hoverColor: Colors.purple,
                                      labelStyle:
                                      new TextStyle(color: Colors.purple),
                                      focusColor: Colors.purple,
                                      labelText: "Email",
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.purple),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.purple),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ))),
                              padding: const EdgeInsets.all(15.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0, bottom: 10),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () async {
                                      if (_formCadastro.currentState.validate()) {
                                        Login2 user = await api.cadastro(
                                            _nomeController.text,_emailController.text, _senhaController.text);
                                        if (user != null) {
                                          helper.saveLogado(user.id,'token_padrao');
                                          Navigator.pop(context);
                                          await Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => home(user.id, Api(token: "token_padrao"))));
                                        }
                                      }
                                    },
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide:
                                        BorderSide(color: Colors.amberAccent)),
                                    child: Text("Confirmar"),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40.0, vertical: 15.0),
                                    color: Colors.amber,
                                    textColor: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 30),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide:
                                        BorderSide(color: Colors.amberAccent)),
                                    child: Text("Cancelar"),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40.0, vertical: 15.0),
                                    color: Colors.amber,
                                    textColor: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ))

                      ]),
                    ))
              ],
            )),
            onWillPop: null));
  }
}
