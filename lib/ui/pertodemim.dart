import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// number of km per degree = ~111km (111.32 in google maps, but range varies
// between 110.567km at the equator and 111.699km at the poles)
// 1km in degree = 1 / 111.32km = 0.0089
// 1m in degree = 0.0089 / 1000 = 0.0000089
// double coef = meters * 0.0000089;

class PertoDeMim extends StatefulWidget {
  double lat, long;

  PertoDeMim({this.lat, this.long});

  @override
  _PertoDeMimState createState() => _PertoDeMimState();
}

class _PertoDeMimState extends State<PertoDeMim> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    print('Long:' + widget.long.toString() + '\n Lat:' + widget.lat.toString());
    _pegarRotasPerto;
  }

  double ZoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(CupertinoIcons.battery_charging), onPressed: () {}),
        title: Text("Teste"),
        actions: <Widget>[
          IconButton(icon: Icon(CupertinoIcons.search), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _googleMaps(context),
          //       _zoomminusfunction(),
          //         _zoomplusfunction(),
//          _buildContainer(),
        ],
      ),
    );
  }

  Widget _googleMaps(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(widget.lat, widget.long), zoom: 16),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,myLocationEnabled: true,
      ),
    );
  }

  void _pegarRotasPerto() async{
    setState(() {

      _markers.add(
        Marker(markerId: null)

      );
    });
  }
}
