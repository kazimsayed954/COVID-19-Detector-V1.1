import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid/constants.dart';

class SymptomsCard extends StatelessWidget {
  SymptomsCard(
      {@required this.image,
      @required this.symptomName,
      @required this.symptomInfo});

  final String image;
  final String symptomName;
  final String symptomInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.asset(
              '$image',
              semanticsLabel: 'Label',
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  symptomName,
                  style: kSymptomCardTitleTextStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10.0),
                Text(
                  symptomInfo,
                  style: kSymptomCardInfoStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SymptomsSmallCard extends StatelessWidget {
  SymptomsSmallCard(
      {@required this.image,
      @required this.symptomName,
      @required this.symptomInfo});

  final String image;
  final String symptomName;
  final String symptomInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        // margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SvgPicture.asset(
                '$image',
                semanticsLabel: 'Label',
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      symptomName,
                      style: kSymptomCardTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      symptomInfo,
                      style: kSymptomCardInfoStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
