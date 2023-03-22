import 'dart:math';

import 'package:a_laugh_a_day/widgets/custom_box_shadow/custom_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

import '../models/joke.dart';
import '../utils/joke_utils.dart';
import 'package:http/http.dart' as http;

import '../widgets/dad_message_box_widget.dart';
import '../widgets/typing_indicator/typing_indicator.dart';

class JokePage extends StatefulWidget {
  JokePage({
    Key? key,
  }) : super(key: key);

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  Random rnd = Random();
  final Set<JokeObject> _jokes = <JokeObject>{};
  late String dadName;
  late AssetImage dadImage;
  bool _typingDelayComplete = false;

  @override
  void initState() {
    fetchJokeJson(http.Client()).then((value) {
      Future.delayed(Duration(milliseconds: setDelayMilliseconds()), () {
        mounted
            ? setState(() {
                _jokes.add(value.first);
                _typingDelayComplete = true;
                dadName = getDadName();
                dadImage = getDadImage();
              })
            : null;
      });
    });
    super.initState();
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: _typingDelayComplete && mounted
                  ? Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(18, 203, 203, 203),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            CustomBoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                offset: Offset(1.5, 1.5),
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: Center(
                        child: DadMessageBoxWidget(
                          jokeText: _jokes.first.joke,
                          dadName: dadName,
                          dadImage: dadImage,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TypingIndicator(
                showIndicator: !_typingDelayComplete,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        primary: Color.fromARGB(207, 0, 221, 207),
                        shadowColor: Colors.black),
                    onPressed: () {
                      setState(() {
                        _typingDelayComplete = false;

                        fetchJokeJson(http.Client()).then((value) {
                          Future.delayed(
                              Duration(milliseconds: setDelayMilliseconds()),
                              () {
                            setState(() {
                              _jokes.clear();
                              _jokes.add(value.first);
                              _typingDelayComplete = true;
                              dadName = getDadName();
                              dadImage = getDadImage();
                            });
                          });
                        });
                      });
                    },
                    child: const Text(
                      "Another Laugh?",
                      style: TextStyle(
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Constants.PRIMARY_BLACK,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int setDelayMilliseconds() {
    //typing indicator delay range
    int min = 1500;
    int max = 2850;

    var delayMillis = min + rnd.nextInt(max - min);
    return delayMillis;
  }
}
