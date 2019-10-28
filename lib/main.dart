import 'dart:convert';
import 'package:SIAAM/model.dart';
import 'package:flutter/material.dart';
import './hal_profil.dart' as profil;
import './hal_outlet.dart' as outlet;
import './hal_obat.dart' as obat;
import './hal_cari.dart' as cari;

void main() {
  runApp(new MaterialApp(home: new Home(), title: "Apotek Atma Medika"));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.yellow[200],
      appBar: new AppBar(
        backgroundColor: Colors.green[800],
        title: new Center(
          child: Text("Apotek Atma Medika"),
        ),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home), text: "Profil"),
            new Tab(icon: new Icon(Icons.business), text: "Outlet"),
            new Tab(icon: new Icon(Icons.healing), text: "Obat"),
            new Tab(icon: new Icon(Icons.history), text: "History"),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new profil.Profil(),
          new outlet.Outlet(),
          new obat.Obat(),
          new cari.Cari()
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.green[800],
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(
                Icons.home,
                size: 30.0,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.business,
                size: 30.0,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.healing,
                size: 30.0,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.search,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
