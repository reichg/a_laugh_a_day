import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

import '../custom_box_shadow/custom_box_shadow.dart';

class JokeSource extends StatefulWidget {
  JokeSource({Key? key}) : super(key: key);

  @override
  State<JokeSource> createState() => _JokeSourceState();
}

class _JokeSourceState extends State<JokeSource> {
  final String dadJokeSource = Constants.dadJokeSource;

  bool snackBarIsOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          CustomBoxShadow(
              color: Constants.PRIMARY_BLACK,
              offset: Offset(0.5, 0.5),
              blurRadius: 10.0,
              blurStyle: BlurStyle.outer)
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              "Where Do The Jokes Come From?",
              textAlign: TextAlign.center,
              style: TextStyle(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dadJokeSource,
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
                icon: const Icon(Icons.copy),
                onPressed: snackBarIsOpen
                    ? null
                    : () async {
                        setState(() {
                          snackBarIsOpen = true;
                        });
                        await Clipboard.setData(
                                ClipboardData(text: dadJokeSource))
                            .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Copied Website To Clipboard",
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
        ],
      ),
    );
  }
}
