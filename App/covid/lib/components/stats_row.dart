import 'package:flutter/material.dart';
import 'package:covid/components/color_box.dart';
import 'package:covid/constants.dart';

class StatsRow extends StatelessWidget {
  final Color colour;
  final String label;
  final int number;
  final double percentage;

  StatsRow({
    @required this.colour,
    @required this.label,
    @required this.number,
    @required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 4),
        ColourBox(colour: colour),
        Text('$label:', style: kTextStyleStats),
        SizedBox(width: 4),
        Text('${kNumberFormat.format(number)}', style: kTextStyleNumberStats),
        SizedBox(width: 4),
        Text('(${percentage.toStringAsFixed(2)}%)',
            style: kTextStyleNumberStats),
        SizedBox(width: 4),
      ],
    );
  }
}
