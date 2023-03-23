import 'package:a_laugh_a_day/widgets/about/about_description.dart';
import 'package:a_laugh_a_day/widgets/about/joke_source.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(238, 3, 4, 6),
        boxShadow: [
          CustomBoxShadow(
              color: Constants.PRIMARY_BLACK,
              offset: Offset(0.5, 0.5),
              blurRadius: 10.0,
              blurStyle: BlurStyle.outer)
        ],
        image: DecorationImage(
          image:
              AssetImage(Constants.assetsBackgroundImages + 'lights_night.jpg'),
          fit: BoxFit.cover,
          opacity: 0.25,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: Color.fromARGB(200, 29, 29, 29),
                boxShadow: [
                  CustomBoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(0.5, 0.5),
                      blurRadius: 10.0,
                      blurStyle: BlurStyle.outer)
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Divider(
                    color: Color.fromARGB(207, 0, 221, 207),
                    thickness: 3,
                    indent: 8,
                    endIndent: 8,
                  ),
                  AboutDescription(),
                  Divider(
                    color: Color.fromARGB(207, 0, 221, 207),
                    thickness: 3,
                    indent: 8,
                    endIndent: 8,
                  ),
                  JokeSource(),
                  Divider(
                    color: Color.fromARGB(207, 0, 221, 207),
                    thickness: 3,
                    indent: 8,
                    endIndent: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
