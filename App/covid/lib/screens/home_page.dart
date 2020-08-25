import 'package:covid/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid/components/reusable_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xFF),
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
                  onPress: () {},
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
                  onPress: () {},
                  iconChild: Icon(FontAwesomeIcons.handsWash,
                      size: kHomeScreenIconSize),
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
          ],
        ),
      ),
    );
  }
}
