import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../helper/api.dart';
import '../helper/class_helper.dart';
import '../noticia.dart';
import 'procurarlocal.dart';
import 'pertodemim.dart';
import 'package:geolocator/geolocator.dart';

class home extends StatefulWidget {
  final Api api;
  dynamic login_id;

  home(this.login_id, this.api);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  LoginHelper helper = LoginHelper();
  List<Noticia> noticia = List();
  List<Onibus> onibus = List();


  @override
  void initState() {
    _getAllNoticias();
    _getAllOnibus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [
            SliverOverlapAbsorber(
              child: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  expandedHeight: 250.0,
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
                                onPressed: () async {
                                  Position position = await Geolocator()
                                      .getCurrentPosition(
                                      locationPermissionLevel: GeolocationPermission
                                          .locationAlways,
                                      desiredAccuracy: LocationAccuracy
                                          .bestForNavigation);
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PertoDeMim(position.latitude,
                                                  position.longitude,
                                                  Api(token: widget.api
                                                      .token))));
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
                                onPressed: () async {
                                  Position position = await Geolocator()
                                      .getCurrentPosition(
                                      locationPermissionLevel: GeolocationPermission
                                          .locationAlways,
                                      desiredAccuracy: LocationAccuracy
                                          .bestForNavigation);
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProcurarLocal(position.latitude,
                                                  position.longitude,
                                                  Api(token: widget.api
                                                      .token))));
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
              ),
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
          ],
          body: RefreshIndicator(
            child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: Center(
                  child: WillPopScope(
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('Noticias',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: ListView.builder(
                                padding: EdgeInsets.all(10.0),
                                itemCount: (noticia.length != null)?noticia.length:0,
                                itemBuilder: (context, index) {
                                  return _noticiaCard(context, index);
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 370, 15, 0
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Ultimos Onibus:',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 420),
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(10.0),
                                itemCount: (onibus.length != null)?onibus.length:0,
                                itemBuilder: (context, index) {
                                  return _onibusCard(context, index);
                                }),
                          )
                        ],
                      ),
                      onWillPop: () {
                        return null;
                      })),
            ),
            onRefresh: () {
              _getAllNoticias();
              _getAllOnibus();
              return null;
            },
          ),
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
          Navigator.of(context).push(TutorialOverlay(
              nome: noticia[index].nome,
              minidescricao: noticia[index].minidescricao,
              descricao: noticia[index].descricao,
              titulo: noticia[index].titulo));
        });
  }

  Widget _onibusCard(BuildContext context, int index) {
    return GestureDetector(
        child: Card(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(onibus[index].modelo),
                subtitle: Text(onibus[index].data_registro.toString()),
                trailing: Image.network(onibus[index].img_onibus.toString()),
              )),
        ));
  }

  Future<void> _getAllNoticias() async {
    await widget.api.noticias().then((list) {
      Future.delayed(Duration(seconds: 15));
      setState(() {
        noticia = list;
      });
    });
  }

  Future<void> _getAllOnibus() async {
    await widget.api.PegarOnibus().then((list) {
    Future.delayed(Duration(seconds: 15));
      setState(() {
        onibus = list;
      });
    });
  }
}
