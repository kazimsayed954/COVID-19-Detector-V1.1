import 'package:flutter/material.dart';
import 'package:covid/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';

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
