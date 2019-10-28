import 'package:flutter/material.dart';

class Cari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
          child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(20.0),
          ),
          new Text(
            "Ini Halama Untuk cari",
            style: new TextStyle(fontSize: 20.0),
          ),
        ],
      )),
    );
  }
}
