import 'package:a_laugh_a_day/icon_classes/venmo_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

class VenmoContact extends StatefulWidget {
  const VenmoContact({Key? key}) : super(key: key);

  @override
  State<VenmoContact> createState() => _VenmoContactState();
}

class _VenmoContactState extends State<VenmoContact> {
  final String venmoHandle = Constants.venmoHandle;
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
              Venmo.venmo,
              size: 30,
              color: Constants.PRIMARY_BLACK,
            ),
          ),
          Text(
            venmoHandle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Lato',
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
                    await Clipboard.setData(ClipboardData(text: venmoHandle))
                        .then((value) => ScaffoldMessenger.of(context)
                                .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Copied Venmo Handle To Clipboard",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Constants.PRIMARY_BLACK,
                                        fontFamily: 'Lato',
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
                                .then(((value) {
                              mounted
                                  ? setState(() {
                                      snackBarIsOpen = false;
                                    })
                                  : null;
                            })));
                  },
          ),
        ],
      ),
    );
  }
}
