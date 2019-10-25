import 'package:flutter/material.dart';
import 'ui/cadastro.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusRoutes',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: const Color(0xFFffc107),
        accentColor: const Color(0xFFffc107),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.amber,
          elevation: 5,
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
                      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0),
                    ),
                    new Padding(
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
                              ))),
                      padding: const EdgeInsets.all(15.0),
                    ),
                    new Padding(
                      child: new TextFormField(
                          focusNode: _focusNode,
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
                              ))),
                      padding: const EdgeInsets.all(15.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {},
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                          child: Text("Confirmar"),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          color: Colors.amber,
                          textColor: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cadastro()));
                          },
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.amberAccent)),
                          child: Text("Cadastrar"),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          color: Colors.amber,
                          textColor: Colors.white,
                        )
                      ],
                    )
                  ]),
            ),
            onWillPop: null));
  }
}
