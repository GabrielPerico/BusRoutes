import 'package:flutter/material.dart';
import '../helper/api.dart';
import '../helper/class_helper.dart';

class home extends StatefulWidget {
  final Api api;
  int login_id;

  home(this.login_id, this.api);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  LoginHelper helper = LoginHelper();
  List<Noticia> noticia = List();

  @override
  void initState() {
    _getAllNoticias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("img/busstop.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      new Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                print('btn1');
                              },
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.center,
                                      colors: <Color>[
                                        Color(0xFF42A5F5),
                                        Color(0xFF1976D2),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: const Text(
                                  'Perto de mim',
                                ),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                print('btn2');
                              },
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.center,
                                      colors: <Color>[
                                        Color(0xFF42A5F5),
                                        Color(0xFF1976D2),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                padding:
                                    const EdgeInsets.fromLTRB(5, 10, 5, 10),
                                child: const Text(
                                  'Escolher destino',
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Center(
              child: WillPopScope(
                  child: ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: noticia.length,
                      itemBuilder: (context, index) {
                        return _noticiaCard(context, index);
                      }),
                  onWillPop: () {
                    return null;
                  })),
        ),
      ),
    );
  }

  Widget _noticiaCard(BuildContext context, int index) {
    return GestureDetector(
        child: Card(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(noticia[index].titulo),
                subtitle: Text(noticia[index].minidescricao),
                trailing: Text('Por: ' + noticia[index].nome),
              )),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                children: <Widget>[
                  Form(
                    child: Column(
                      textDirection: TextDirection.ltr,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(noticia[index].titulo),
                        ),
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(noticia[index].minidescricao +
                                '\n' +
                                noticia[index].descricao,style: TextStyle(),)),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: <Widget>[
                              Text(
                                '\nEscrito por: ' + noticia[index].nome,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        });
  }

  void _getAllNoticias() async {
    await widget.api.noticias().then((list) {
      setState(() {
        noticia = list;
        debugPrint(noticia.toString());
      });
    });
  }
}
