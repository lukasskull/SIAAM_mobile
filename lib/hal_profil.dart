import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[800],
            title: new Center(child: Text("Tentang Kami"))),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                children: <Widget>[
                  Image.asset('img/home.png', width: 400.0),
                  Image.asset('img/profil1.png', width: 400.0),
                  Image.asset('img/profil2.png', width: 400.0),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                  )
                ],
              ),
            ),
          ),
        )
        //backgroundColor: Colors.white,
        );
  }
}
