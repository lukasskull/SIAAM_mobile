import 'dart:convert';

import 'package:SIAAM/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Obat extends StatefulWidget {
  @override
  _ObatState createState() => _ObatState();
}

class _ObatState extends State<Obat> {
  List<Obats> _list = [];
  List<Obats> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();

    final response = await http.get("http://10.0.2.2/siaam/readObat.php");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (this.mounted) {
        setState(() {
          for (Map i in data) {
            _list.add(Obats.fromJson(i));
            loading = false;
          }
        });
      }
    }
  }

  TextEditingController controller = TextEditingController();
  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    } else {
      _list.forEach((f) {
        if (f.obat_name.toLowerCase().contains(text)) _search.add(f);
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: new Center(
            child: Text("Daftar Obat"),
          )),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.green[800],
              child: Card(
                  child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      hintText: "Cari Ketersediaan Obat?",
                      border: InputBorder.none),
                ),
                trailing: IconButton(
                  onPressed: () {
                    controller.clear();
                    onSearch('');
                  },
                  icon: Icon(Icons.cancel),
                ),
              )),
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: _search.length != 0 || controller.text.isNotEmpty
                        ? ListView.builder(
                            itemCount: _search.length,
                            itemBuilder: (context, i) {
                              final b = _search[i];
                              return Container(
                                padding: EdgeInsets.all(10.0),
                                child: Card(
                                  elevation: 10.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            1.0, 1.0, 1.0, 1.0),
                                      ),
                                      Center(
                                        child: new Image.asset(
                                            "img/oskadon.png",
                                            width: 150.0),
                                      ),
                                      Center(child: Text(b.obat_photo)),
                                      Center(
                                        child: Text(
                                          b.obat_name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final a = _list[i];
                              return Container(
                                padding: EdgeInsets.all(10.0),
                                child: Card(
                                  elevation: 10.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            1.0, 1.0, 1.0, 1.0),
                                      ),
                                      Center(
                                        child: new Image.asset(
                                            "img/oskadon.png",
                                            width: 150.0),
                                      ),
                                      Center(child: Text(a.obat_photo)),
                                      Center(
                                        child: Text(
                                          a.obat_name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}
