import 'package:flutter/material.dart';
import 'package:covid/components/stats_row.dart';
import 'package:covid/constants.dart';

class Stats extends StatelessWidget {
  final int sickNumber;
  final int recoveredNumber;
  final int deadNumber;
  final double sickPercentage;
  final double recoveredPercentage;
  final double deadPercentage;

  Stats({
    @required this.sickNumber,
    @required this.recoveredNumber,
    @required this.deadNumber,
    @required this.sickPercentage,
    @required this.recoveredPercentage,
    @required this.deadPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            StatsRow(
              colour: kColourPieSick,
              label: 'Active',
              number: sickNumber,
              percentage: sickPercentage,
            ),
            SizedBox(height: 10),
            StatsRow(
              colour: kColourPieRecovered,
              label: 'Recovered',
              number: recoveredNumber,
              percentage: recoveredPercentage,
            ),
            SizedBox(height: 10),
            StatsRow(
              colour: kColourPieDead,
              label: 'Dead',
              number: deadNumber,
              percentage: deadPercentage,
            ),
            SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
