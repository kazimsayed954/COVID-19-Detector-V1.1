import 'package:flutter/material.dart';
import 'package:covid/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:covid/services/location_service.dart';
import 'package:covid/services/coronavirus_service.dart';
import 'package:covid/models/coronavirus_data.dart';
import 'package:covid/components/stack_pie.dart';
import 'package:covid/components/stats.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid/components/error_alert.dart';
import 'package:covid/screens/stateswise.dart';
import 'package:covid/components/bottom_button.dart';

enum LocationSource { Global, Local, Search }

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  Future<CoronavirusData> futureCoronavirusData;
  LocationSource locationSource = LocationSource.Global;

  @override
  void initState() {
    super.initState();
    futureCoronavirusData = CoronavirusService().getLatestData();
  }

  void getData({String countryCode}) async {
    switch (locationSource) {
      case LocationSource.Global:
        futureCoronavirusData = CoronavirusService().getLatestData();
        break;
      case LocationSource.Local:
        Placemark placemark = await LocationService().getPlacemark();
        setState(() {
          futureCoronavirusData =
              CoronavirusService().getLocationDataFromPlacemark(placemark);
        });
        break;
      case LocationSource.Search:
        if (countryCode != null) {
          futureCoronavirusData =
              CoronavirusService().getLocationDataFromCountryCode(countryCode);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: FutureBuilder<CoronavirusData>(
            future: futureCoronavirusData,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return SpinKitPulse(color: kColourPrimary, size: 80);
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return dataColumn(coronavirusData: snapshot.data);
                  } else if (snapshot.hasError) {
                    return ErrorAlert(
                      errorMessage: snapshot.error.toString(),
                      onRetryButtonPressed: () {
                        setState(() {
                          getData();
                        });
                      },
                    );
                  }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Column dataColumn({CoronavirusData coronavirusData}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            coronavirusData.date,
            style: kTextStyleDate,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Card(
            child: Text(
              coronavirusData.locationLabel,
              style: kTextStyleLocationLabel,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.lightGreen[400],
              borderRadius: BorderRadius.circular(4)),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StackPie(
                totalNumber: coronavirusData.totalNumber,
                sickNumber: coronavirusData.sickNumber,
                recoveredNumber: coronavirusData.recoveredNumber,
                deadNumber: coronavirusData.deadNumber,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.deepOrange[300],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Card(
            child: Stats(
              sickNumber: coronavirusData.sickNumber,
              recoveredNumber: coronavirusData.recoveredNumber,
              deadNumber: coronavirusData.deadNumber,
              sickPercentage: coronavirusData.sickPercentage,
              recoveredPercentage: coronavirusData.recoveredPercentage,
              deadPercentage: coronavirusData.deadPercentage,
            ),
          ),
        ),
        Container(
          child: Card(
            elevation: 8,
            child: BottomButton(
              buttonTitle: 'India',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserList()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
