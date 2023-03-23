import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);
  final String dadJokeSource = Constants.dadJokeSource;

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
                  Expanded(
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
                  ),
                  Divider(
                    color: Color.fromARGB(207, 0, 221, 207),
                    thickness: 3,
                    indent: 8,
                    endIndent: 8,
                  ),
                  Container(
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
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
                                await Clipboard.setData(
                                        ClipboardData(text: "$dadJokeSource"))
                                    .then((value) =>
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text("copied to clipboard"),
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
          ),
        ],
      ),
    );
  }
}
