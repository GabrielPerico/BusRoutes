import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  FocusNode _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.amber,
          elevation: 5,
        ),
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      new Padding(
                        child: new Image.asset(
                          'img/BusRoutes_Logo.png',
                          fit: BoxFit.contain,
                        ),
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.5),
                        child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hoverColor: Colors.purple,
                                labelStyle: new TextStyle(color: Colors.purple),
                                focusColor: Colors.purple,
                                labelText: "Nome",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Digite seu nome';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.5),
                        child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hoverColor: Colors.purple,
                                labelStyle: new TextStyle(color: Colors.purple),
                                focusColor: Colors.purple,
                                labelText: "Email",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Digite seu email';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.5),
                        child: TextFormField(
                          focusNode: _focusNode,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hoverColor: Colors.purple,
                              labelStyle: new TextStyle(color: Colors.purple),
                              focusColor: Colors.purple,
                              labelText: "Senha",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digite sua senha';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
                        child: ButtonTheme(
                          minWidth: double.infinity,
                          child: RaisedButton(
                              child: Text("Cadastrar"),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 15.0),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Colors.amberAccent)),
                              color: Colors.amber,
                              textColor: Colors.white,
                              onPressed: () {}),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
