import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import '../helper/api.dart';
import '../helper/class_helper.dart';
import 'package:random_color/random_color.dart';

class PertoDeMim extends StatefulWidget {
  double lat, long;
  Api api;

  PertoDeMim(this.lat, this.long, this.api);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<PertoDeMim> {
  RandomColor _randomColor = RandomColor();
  List<Rotas> rotas = List();
  GoogleMapController mapController;
  int coutpoly = 0;
  Color color;
  LatLng lastlatlng;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyCQyN8DSyvNEhybSXQ6OskQw2p7_CByNyk";

  @override
  void initState() {
    super.initState();
    _pegarRotasPerto();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(widget.lat, widget.long), zoom: 15),
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(markers.values),
        polylines: Set<Polyline>.of(polylines.values),
      )),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    print('☺ ' + widget.lat.toString() + '  ' + widget.long.toString());
  }

  _addMarker(LatLng position, String id,horario,passagem,passagemE) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
        markerId: markerId,
        icon: BitmapDescriptor.fromAsset('img/busstop.png'),
        infoWindow: InfoWindow(title: 'Passagem: R\$'+ passagem+' Estudante: R\$'+passagemE,snippet: 'Chegada as ' + horario),
        position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    coutpoly++;
    PolylineId id = PolylineId(coutpoly.toString());
    Polyline polyline = Polyline(
        polylineId: id,
        color: color,
        points: polylineCoordinates,
        width: 5,
        patterns: [PatternItem.dot],
        geodesic: true,
        jointType: JointType.bevel);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline(double lato, lngo, lata, lnga) async {
    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey, lato, lngo, lata, lnga);
    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    polylineCoordinates.removeLast();

    _addPolyLine();
  }

  _pegarRotasPerto() async {
    await widget.api.RotasPerto(widget.lat, widget.long).then((list) {
      list.forEach((id) => setState(() {
            color = _randomColor.randomColor();
            //polylineCoordinates.clear();
            _atualizarRotas(id['id']);
          }));
    });
  }

  _atualizarRotas(dynamic id) async {
    await widget.api.PegarRota(id).then((list) {
      setState(() {
        rotas = list;
      });
    });
    lastlatlng = null;

    rotas.forEach((rota) => setState(() {
          _addMarker(LatLng(rota.lat, rota.lng), rota.horario.toString(),rota.horario.toString(),rota.passagem.toString(),rota.passagemE.toString());

          if (lastlatlng != null) {
            _getPolyline(
                lastlatlng.latitude, lastlatlng.longitude, rota.lat, rota.lng);
          }
          lastlatlng = LatLng(rota.lat, rota.lng);
        }));
  }
}
