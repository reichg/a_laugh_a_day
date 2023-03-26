import 'package:a_laugh_a_day/widgets/contact/email_contact.dart';
import 'package:a_laugh_a_day/widgets/contact/venmo_contact.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);
  final String email = Constants.email;
  final String venmoHandle = Constants.venmoHandle;

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
            Padding(
              padding: const EdgeInsets.only(top: 48.0, left: 8, right: 8),
              child: Text(
                "Feedback?",
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmailContact(),
                  VenmoContact(),
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(207, 0, 221, 207),
              thickness: 3,
              indent: 8,
              endIndent: 8,
            ),
          ],
        ),
      ),
    );
  }
}
