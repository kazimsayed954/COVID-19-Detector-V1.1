import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kHomeScreenTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 30);

const kHomeScreenIconSize = 80.0;

final kBottomBarTextStyle =
    TextStyle(fontFamily: 'Baloo', color: Colors.black, fontSize: 20.0);

final kSymptomCardTitleTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final kSymptomCardInfoStyle =
    TextStyle(fontFamily: 'Baloo', fontSize: 17, height: 1.2);

final kAppBarStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Poppins',
    fontSize: 25.0,
    fontWeight: FontWeight.bold);

final kactionNameGreenStyle = TextStyle(
  color: Color(0xFF3B978E),
  fontFamily: 'Poppins',
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final kactionNameRedStyle = TextStyle(
  color: Color(0xFFD84B6B),
  fontFamily: 'Poppins',
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final kactionInfoStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Ballo',
  fontSize: 17,
  height: 1.2,
);

final kSelectImageCameraButtonColor = Color(0xFF47B2A0);
final kSelectImageButtonGalleryColor = Color(0xFFFAD751);
final kClassifyImageButtonColor = Color(0xFF4E76E5);

final kResultTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Baloo',
    fontWeight: FontWeight.bold,
    fontSize: 20);

final kPredictButtonsStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Poppins',
  fontSize: 25,
  fontWeight: FontWeight.w700,
);

const kAppBarMainTitle = 'Tracker';

final kNumberFormat = NumberFormat('#,##0');

final kColourPrimary = Colors.blue[800];
final kColourBackground = Colors.white;

final kColourPieSick = Color(0xFFD84B6B);
final kColourPieRecovered = Color(0xFF47B2A0);
final kColourPieDead = Colors.black;

final kColourAlertBackground = Colors.blue[700];

const kTextStyleAppBar = TextStyle(
    fontSize: 30,
    fontFamily: 'Baloo',
    color: Colors.black,
    fontWeight: FontWeight.w800);
const kTextStyleDate = TextStyle(
  fontFamily: 'Baloo',
  fontSize: 30.0,
);
const kData = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 15.0,
    textBaseline: TextBaseline.ideographic);
const kDataActive = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 13.0,
    color: Colors.red,
    fontWeight: FontWeight.bold);
const kDataDeath = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 13.0,
    color: Colors.black,
    fontWeight: FontWeight.bold);
const kDataRecoverd = TextStyle(
    fontFamily: 'Courier-Prime',
    fontSize: 13.0,
    color: Colors.green,
    fontWeight: FontWeight.bold);
const kTextStyleLocationLabel = TextStyle(
    fontFamily: 'Poppins', fontSize: 40.0, fontWeight: FontWeight.bold);
const kTextStyleTotalLabel =
    TextStyle(fontFamily: 'Baloo', fontSize: 25.0, fontWeight: FontWeight.w700);
const kTextStyleTotalNumber = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 32.0,
);
const kTextStyleStats = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 25.0,
);

const kTextStyleNumberStats = TextStyle(
    fontFamily: 'Poppins', fontSize: 21.0, fontWeight: FontWeight.w400);

const kTextStyleAlertTitle = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  fontSize: 27,
  color: Colors.white,
);
const kTextStyleAlertText = TextStyle(
  fontFamily: 'Courier-Prime',
  fontSize: 18,
  color: Colors.white,
);
const kTextStyleAlertButton = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  fontSize: 22,
  color: Colors.white,
);
const kTextStyleTextField = TextStyle(
  fontFamily: 'Courier-Prime-Bold',
  fontSize: 21,
);
const kTextStyleTextFieldHint = TextStyle(
  fontFamily: 'Courier-Prime',
  fontSize: 21,
);

final kInputDecorationTextField = InputDecoration(
  hintText: 'Enter country name:',
  hintStyle: kTextStyleTextFieldHint,
  filled: true,
  fillColor: Colors.lightBlue,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w500,
);
const kBottomContainerHeight = 80.0;
const kBottomContainerColor = Color(0xFFEDA500);
