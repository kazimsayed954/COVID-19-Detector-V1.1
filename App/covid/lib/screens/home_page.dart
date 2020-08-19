import 'package:covid/constants.dart';
import 'package:covid/screens/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid/components/reusable_card.dart';
import 'package:covid/screens/dos_and_donts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';

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
    Cases(),
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
      ],
    );
  }
}

class Cases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class Predictor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyImagePicker(),
    );
  }
}

class MyImagePicker extends StatefulWidget {
  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File imageURI;
  String result;
  String path;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      imageURI = File(image.path);
      path = image.path;
    });
  }

  Future getImageFromGallery() async {
    final image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageURI = File(image.path);
      path = image.path;
    });
  }

  Future classifyImage() async {
    await Tflite.loadModel(
        model: "assets/models/model1.tflite",
        labels: "assets/models/labels.txt");
    var output = await Tflite.runModelOnImage(path: path);
    setState(() {
      result = output.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            imageURI == null
                ? Expanded(
                    flex: 1,
                    child: Center(
                      child: Text('No image selected.'),
                    ),
                  )
                : Expanded(
                    flex: 5,
                    child: Image.file(imageURI,
                        width: 300, height: 200, fit: BoxFit.cover),
                  ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFDFE2E2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RaisedButton(
                  onPressed: () => getImageFromCamera(),
                  child: Text(
                    'Click Here To Select Image From Camera',
                    style: kPredictButtonsStyle,
                    textAlign: TextAlign.center,
                  ),
                  color: kSelectImageCameraButtonColor,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFDFE2E2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RaisedButton(
                  onPressed: () => getImageFromGallery(),
                  child: Text(
                    'Click Here To Select Image From Gallery',
                    style: kPredictButtonsStyle,
                    textAlign: TextAlign.center,
                  ),
                  textColor: Colors.black,
                  color: kSelectImageButtonGalleryColor,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFDFE2E2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RaisedButton(
                  onPressed: () => classifyImage(),
                  child: Text(
                    'Classify Image',
                    style: kPredictButtonsStyle,
                    textAlign: TextAlign.center,
                  ),
                  color: kClassifyImageButtonColor,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),
            ),
            result == null
                ? Expanded(
                    flex: 2,
                    child: Center(
                      child: Text('Result', style: kResultTextStyle),
                    ),
                  )
                : Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(result, style: kResultTextStyle),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
