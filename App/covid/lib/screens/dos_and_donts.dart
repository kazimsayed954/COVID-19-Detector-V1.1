import 'package:covid/components/dos_and_dont_card.dart';
import 'package:flutter/material.dart';
import 'package:covid/constants.dart';

class DosAndDontsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black, size: 30.0),
          shadowColor: Colors.black54,
          title: Text('Do\'s and Don\'t', style: kAppBarStyle),
        ),
        body: Column(
          // padding: EdgeInsets.all(5),
          children: [
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: DosAndDontsCard(
                image: 'assets/images/dosanddonts/avoid-crowd.svg',
                actionName: 'Avoid Crowded Places',
                actionInfo: 'Avoid large events or mass gatherings.',
                actionStyle: kactionNameRedStyle,
              ),
            ),
            Expanded(
              flex: 1,
              child: DosAndDontsCard(
                image: 'assets/images/dosanddonts/twenty-second-wash-hand.svg',
                actionName: 'Wash Hands',
                actionInfo: 'Wash Hands properly with soap for twenty secondds',
                actionStyle: kactionNameGreenStyle,
              ),
            ),
            Expanded(
              flex: 1,
              child: DosAndDontsCard(
                image: 'assets/images/dosanddonts/no-traveling.svg',
                actionName: 'Avoid Travelling',
                actionInfo:
                    'Avoid travelling to reduce the risk of getting infected.',
                actionStyle: kactionNameRedStyle,
              ),
            ),
            Expanded(
              flex: 1,
              child: DosAndDontsCard(
                image: 'assets/images/dosanddonts/social-distance.svg',
                actionName: 'Practice Social Distancing',
                actionInfo:
                    'In case you go out, keep a distance of 6 feet from others',
                actionStyle: kactionNameGreenStyle,
              ),
            ),
            Expanded(
              flex: 1,
              child: DosAndDontsCard(
                image: 'assets/images/dosanddonts/do-not-touch-face.svg',
                actionName: 'Do not touch your face',
                actionInfo: 'Your hands may be contaminated.',
                actionStyle: kactionNameRedStyle,
              ),
            ),
            Expanded(
              flex: 1,
              child: DosAndDontsCard(
                image: 'assets/images/dosanddonts/work-from-home.svg',
                actionName: 'Work From Home',
                actionInfo: 'Work from home to reduce risk of getting infected',
                actionStyle: kactionNameGreenStyle,
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
