import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:SIAAM/model.dart';
import './detail_outlet.dart';

class Outlet extends StatelessWidget {
  Future<List> fetchData() async {
    final response = await http.get("http://10.0.2.2/siaam/readOutlet.php");
    //BUILD EMULATOR ANDROID 10.0.2.2
    //OTHERS EMULATOR 10.0.2.3
    //BUILD DIRECT ON MY DEVICE PAKAI IP PC
    //wifi sendiri 192.168.43.200
    return json.decode(response.body);
  }
  //

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: new Center(
            child: Text("Daftar Outlet"),
          )),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              elevation: 10.0,
              child: new ListTile(
                title: new Text(
                  list[i]['outlet_name'],
                ),
                leading: new Icon(
                  Icons.toys,
                  //color: Colors.white70,
                ),
                subtitle: new Text("${list[i]['outlet_city']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
