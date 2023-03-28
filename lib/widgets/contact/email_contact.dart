import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

class EmailContact extends StatefulWidget {
  const EmailContact({Key? key}) : super(key: key);

  @override
  State<EmailContact> createState() => _EmailContactState();
}

class _EmailContactState extends State<EmailContact> {
  final String email = Constants.email;
  bool snackBarIsOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
        boxShadow: const [
          CustomBoxShadow(
              color: Constants.PRIMARY_BLACK,
              offset: Offset(0, 1),
              blurRadius: 10,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.email_outlined,
              size: 30,
            ),
          ),
          Text(
            email,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Futura',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Constants.PRIMARY_TEXT,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 3.0,
                    color: Constants.PRIMARY_BLACK,
                  ),
                ]),
          ),
          IconButton(
              icon: const Icon(
                Icons.copy,
                size: 20,
              ),
              onPressed: snackBarIsOpen
                  ? null
                  : () async {
                      setState(() {
                        snackBarIsOpen = true;
                      });
                      await Clipboard.setData(ClipboardData(text: email))
                          .then((value) => ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Copied Email To Clipboard",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Constants.PRIMARY_BLACK,
                                          fontFamily: 'Futura',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      duration: Duration(
                                        milliseconds: 1250,
                                      ),
                                      backgroundColor: Constants.PRIMARY_AQUA,
                                    ),
                                  )
                                  .closed
                                  .then((value) {
                                setState(() {
                                  snackBarIsOpen = false;
                                });
                              }));
                    }),
        ],
      ),
    );
  }
}
