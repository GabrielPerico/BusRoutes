import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                
                  centerTitle: true,
                  title: Text("Collapsing Toolbar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Column(
          children: <Widget>[
            RaisedButton(onPressed: (){},child: Text('teste'),),
            RaisedButton(onPressed: (){},child: Text('teste'),),

          ],
          ),
            ),
            )];
        },
        body: Center(
          child: Text("Sample Text"),
        ),
      ),
    );
  }
}
