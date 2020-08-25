import 'package:flutter/material.dart';
import 'package:covid/constants.dart';

class HomeScreenCard extends StatelessWidget {
  HomeScreenCard(
      {@required this.colour, this.onPress, this.iconChild, this.text});

  final Color colour;
  final Function onPress;
  final String text;
  final Icon iconChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 20),
            Expanded(child: Text(text, style: kHomeScreenTextStyle)),
            SizedBox(
              width: 30,
            ),
            Expanded(child: iconChild),
          ],
        ),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
