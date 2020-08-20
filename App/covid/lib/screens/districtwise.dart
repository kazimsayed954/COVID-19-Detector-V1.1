import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid/constants.dart';
import 'package:covid/models/Districts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DistrictPage extends StatefulWidget {
  DistrictPage({Key key, this.title, this.code}) : super(key: key);

  final String title;
  final String code;

  @override
  DistrictPageState createState() => new DistrictPageState();
}

class DistrictPageState extends State<DistrictPage> {
  final String apiUrl = "https://api.covid19india.org/state_district_wise.json";

  Future<Map<dynamic, dynamic>> fetchUsers(String title) async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)[title]['districtData'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title,
          style: kTextStyleAppBar,
          textAlign: TextAlign.justify,
        ),
      ),
      body: Container(
        child: FutureBuilder<Map<dynamic, dynamic>>(
            future: fetchUsers(widget.title),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<String> l = getDistricts(widget.code);
                print(snapshot.data[l[0]]['active']);
                return ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: l.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading:
                                  Icon(Icons.show_chart, color: kColourPrimary),
                              title: Text(
                                '${(l[index])}',
                                style: kTextStyleDate,
                              ),
                              subtitle: Text(
                                "Confirmed :${(snapshot.data[(l[index])]['confirmed'].toString())}",
                                style: kData,
                              ),
                              trailing: SingleChildScrollView(
                                child: Column(children: <Widget>[
                                  Text(
                                    " Active :${(snapshot.data[l[index]]['active'].toString())}",
                                    style: kDataActive,
                                  ),
                                  Text(
                                    " Deaths :${(snapshot.data[l[index]]['deceased'].toString())}",
                                    style: kDataDeath,
                                  ),
                                  Text(
                                    "Recovered :${(snapshot.data[l[index]]['recovered'].toString())}",
                                    style: kDataRecoverd,
                                  ),
                                ]),
                              ),
                              isThreeLine: true,
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                    child: SpinKitPulse(color: kColourPrimary, size: 80));
              }
            }),
      ),
    );
  }
}
