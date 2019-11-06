import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
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
                pinned: false,
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
                              onPressed: () {print('btn1');},
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
                              onPressed: () {print('btn2');},
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
            child: Text("Sample text"),
          ),
        ),
      ),
    );
  }
}

/*
background: Stack(
                  children: <Widget>[
                    new Container(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(image: new AssetImage("images/background.jpg"), fit: BoxFit.cover,),
                      ),
                    ),
                    new Center(
                      child: new Text("Hello background"),
                    )
                  ],
                ),





Center(
                      child: Row(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {},
                            child: Text('Procurar Perto'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Text('Selecionar Destino'),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
 */
