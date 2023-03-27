import 'package:a_laugh_a_day/widgets/about/about_description.dart';
import 'package:a_laugh_a_day/widgets/about/joke_source.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.TRANSPARENT_BG_DARK_GREY,
        boxShadow: const [
          CustomBoxShadow(
              color: Constants.PRIMARY_BLACK,
              offset: Offset(0.5, 0.5),
              blurRadius: 10.0,
              blurStyle: BlurStyle.outer)
        ],
        image: DecorationImage(
          image:
              AssetImage('${Constants.assetsBackgroundImages}lights_night.jpg'),
          fit: BoxFit.cover,
          opacity: 0.25,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: Constants.TRANSPARENT_BG_LIGHTER_GREY,
                boxShadow: const [
                  CustomBoxShadow(
                      color: Constants.PRIMARY_BLACK,
                      offset: Offset(0.5, 0.5),
                      blurRadius: 10.0,
                      blurStyle: BlurStyle.outer)
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: const [
                  Divider(
                    color: Constants.PRIMARY_AQUA,
                    thickness: 3,
                    indent: 8,
                    endIndent: 8,
                  ),
                  AboutDescription(),
                  Divider(
                    color: Constants.PRIMARY_AQUA,
                    thickness: 3,
                    indent: 8,
                    endIndent: 8,
                  ),
                  JokeSource(),
                  Divider(
                    color: Constants.PRIMARY_AQUA,
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
