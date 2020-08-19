import 'package:covid/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DosAndDontsCard extends StatelessWidget {
  DosAndDontsCard(
      {this.image, this.actionName, this.actionInfo, this.actionStyle});

  final String image;
  final String actionName;
  final String actionInfo;
  final actionStyle;
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
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 2,
            child: SvgPicture.asset(
              '$image',
              semanticsLabel: 'Image',
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
                  actionName,
                  style: actionStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10.0),
                Text(
                  actionInfo,
                  style: kactionInfoStyle,
                )
              ],
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
