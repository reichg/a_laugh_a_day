import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

import '../custom_box_shadow/custom_box_shadow.dart';

class JokeSource extends StatelessWidget {
  const JokeSource({Key? key}) : super(key: key);
  final String dadJokeSource = Constants.dadJokeSource;

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              "Where Do The Jokes Come From?",
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$dadJokeSource",
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
                icon: Icon(Icons.copy),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: "$dadJokeSource"))
                      .then(
                          (value) => ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("copied website to clipboard"),
                                  duration: Duration(
                                    milliseconds: 1250,
                                  ),
                                ),
                              ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
