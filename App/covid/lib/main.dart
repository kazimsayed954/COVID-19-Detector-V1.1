import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(Covid());
}

class Covid extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFFF7F7F7),
          scaffoldBackgroundColor: Color(0xFFF7F7F7),
        ));
  }
}
