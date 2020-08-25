This app contained a COVID tracker and a COVID Detector deployed using TFLite.

To setup and build the app yourself you need have setup Flutter SDK and Android Development SDK. To do that refer [here](https://flutter.dev/docs/get-started/install).

Due to time limitations the Virus and Myth Section of the app was not implemented.

After your SDK is setup:


From the root project directory, run the following commands in terminal.

    cd Covid-19_Flutter
    pub get
    flutter build apk


If you want to deploy your TFlite model, you just need to replace the existing model file inside `assets/models` and rename your file to `model1.tflite`.

Then run

    pub get
    flutter build


This app was created by [Janmejai Singh](https://github.com/janmejai2002).