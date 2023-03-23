import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

class EmailContact extends StatelessWidget {
  const EmailContact({Key? key}) : super(key: key);
  final String email = Constants.email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(0, 0, 0, 0),
        border: Border.all(
          color: Color.fromARGB(62, 0, 0, 0),
        ),
        boxShadow: [
          CustomBoxShadow(
              color: Constants.PRIMARY_BLACK,
              offset: Offset(0.5, 0.5),
              blurRadius: 10.0,
              blurStyle: BlurStyle.outer)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.email_outlined,
              size: 30,
            ),
          ),
          Text(
            "$email",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Futura',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color.fromARGB(189, 255, 255, 255),
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ]),
          ),
          IconButton(
            icon: Icon(
              Icons.copy,
              size: 20,
            ),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: "$email"))
                  .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("copied email to clipboard"),
                          duration: Duration(
                            milliseconds: 1250,
                          ),
                        ),
                      ));
            },
          ),
        ],
      ),
    );
  }
}
