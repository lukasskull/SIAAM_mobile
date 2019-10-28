import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Center(
            child: new Text("${widget.list[widget.index]['outlet_name']}")),
        backgroundColor: Colors.green[800],
      ),
      body: new Container(
          padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 80.0),
          child: new Card(
            elevation: 10.0,
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                  ),
                  new Text(
                    widget.list[widget.index]['outlet_name'],
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  new Text(
                    "Kota: ${widget.list[widget.index]['outlet_city']}",
                    style: new TextStyle(fontSize: 15.0),
                  ),
                  new Text(
                    "Provinsi: ${widget.list[widget.index]['outlet_province']}",
                    style: new TextStyle(fontSize: 15.0),
                  ),
                  new Text(
                    "Alamat: ${widget.list[widget.index]['outlet_address']}",
                    style: new TextStyle(fontSize: 15.0),
                  ),
                  new Text(
                    "Telepon: ${widget.list[widget.index]['outlet_phone']}",
                    style: new TextStyle(fontSize: 15.0),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                  ),
                  new Image.asset("img/atma_medika.png", width: 200.0),
                ],
              ),
            ),
          )),
    );
  }
}
