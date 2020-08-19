import 'package:covid/components/symptoms_card.dart';
import 'package:covid/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black, size: 30.0),
          shadowColor: Colors.black54,
          title: Text('Symptoms', style: kAppBarStyle),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: SymptomsCard(
                image: 'assets/images/symptoms/dry-cough.svg',
                symptomName: 'Dry Cough',
                symptomInfo:
                    'A dry cough is a cough that doesn\'t bring up mucus.',
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SymptomsSmallCard(
                      image: 'assets/images/symptoms/high-fever.svg',
                      symptomName: 'Fever',
                      symptomInfo: 'A temperature higher than 98.6°F',
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SymptomsSmallCard(
                      image: 'assets/images/symptoms/runny-nose.svg',
                      symptomName: 'Runny Nose',
                      symptomInfo:
                          'Mucus draining or dripping from the nostril.',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SymptomsSmallCard(
                      image: 'assets/images/symptoms/breathing-problem.svg',
                      symptomName: 'Breathing Problem',
                      symptomInfo: 'Difficulty in breathing.',
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SymptomsSmallCard(
                      image: 'assets/images/symptoms/low-energy.svg',
                      symptomName: 'Fatigue',
                      symptomInfo:
                          'Low energy and overall feeling of tiredness is there.',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
