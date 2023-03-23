import 'package:flutter/material.dart';

class AboutDescription extends StatelessWidget {
  const AboutDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 48.0,
            horizontal: 8,
          ),
          child: Text(
            "A Laugh A Day is a simple app designed for a quick laugh!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 20,
              color: Color.fromARGB(189, 255, 255, 255),
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}