import 'package:flutter/material.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

class AboutDescription extends StatelessWidget {
  const AboutDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 48.0,
            horizontal: 8,
          ),
          child: Text(
            "A Laugh A Day is a simple app designed for a quick laugh!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 20,
              color: Constants.PRIMARY_TEXT,
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 3.0,
                  color: Constants.PRIMARY_BLACK,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
