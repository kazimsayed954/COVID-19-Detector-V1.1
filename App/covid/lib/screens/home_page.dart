import 'package:covid/constants.dart';
import 'package:covid/screens/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid/components/reusable_card.dart';
import 'package:covid/screens/dos_and_donts.dart';
import 'package:covid/screens/predict.dart';
import 'package:covid/screens/stats_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    HomeBase(),
    StatsScreen(),
    Predictor(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTapped,
          backgroundColor: Color(0xFFDFE2E2),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                color: Colors.black,
              ),
              title: Text(
                'Home',
                style: kBottomBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.chartLine,
                color: Colors.black,
              ),
              title: Text(
                'Cases',
                style: kBottomBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.superpowers,
                color: Colors.black,
              ),
              title: Text(
                'Predict',
                style: kBottomBarTextStyle,
              ),
            ),
          ],
        ),
        body: _children[_currentIndex],
      ),
    );
  }
}

class HomeBase extends StatelessWidget {
  const HomeBase({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Baloo',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: HomeScreenCard(
              colour: Color(0xFF47B2A0),
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SymptomsPage()));
              },
              iconChild: Icon(
                FontAwesomeIcons.lungsVirus,
                size: kHomeScreenIconSize,
              ),
              text: 'Symptoms'),
        ),
        Expanded(
          flex: 2,
          child: HomeScreenCard(
              colour: Color(0xFFF9D553),
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DosAndDontsPage()));
              },
              iconChild:
                  Icon(FontAwesomeIcons.handsWash, size: kHomeScreenIconSize),
              text: 'Do\'s and Dont\'s'),
        ),
        Expanded(
          flex: 2,
          child: HomeScreenCard(
              colour: Color(0xFFF48A8F),
              onPress: () {},
              iconChild: Icon(
                FontAwesomeIcons.virus,
                size: kHomeScreenIconSize,
              ),
              text: 'Virus'),
        ),
        Expanded(
          flex: 2,
          child: HomeScreenCard(
              colour: Color(0xFF77BBF3),
              onPress: () {},
              iconChild: Icon(
                FontAwesomeIcons.bookOpen,
                size: kHomeScreenIconSize,
              ),
              text: 'Myth'),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
