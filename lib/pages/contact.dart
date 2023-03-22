import 'package:flutter/material.dart';

import '../widgets/custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(238, 3, 4, 6), boxShadow: [
        CustomBoxShadow(
            color: Constants.PRIMARY_BLACK,
            offset: Offset(0.5, 0.5),
            blurRadius: 10.0,
            blurStyle: BlurStyle.outer)
      ]),
      child: Center(
        child: Text("Contact"),
      ),
    );
  }
}
