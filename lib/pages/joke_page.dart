// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:a_laugh_a_day/utils/constants.dart' as Constants;
import 'package:a_laugh_a_day/widgets/custom_box_shadow/custom_box_shadow.dart';

import '../models/joke.dart';
import '../utils/joke_utils.dart';
import '../widgets/dad_message_box_widget.dart';
import '../widgets/typing_indicator/typing_indicator.dart';

class JokePage extends StatefulWidget {
  JokeObject joke;
  String dadName;
  AssetImage dadImage;
  bool typingDelayComplete;

  JokePage({
    Key? key,
    required this.joke,
    required this.dadName,
    required this.dadImage,
    required this.typingDelayComplete,
  }) : super(key: key);

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  Random rnd = Random();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: _setDelayMilliseconds()), () {
      mounted
          ? setState(() {
              widget.typingDelayComplete = true;
            })
          : null;
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
              child: widget.typingDelayComplete && mounted
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
                          jokeText: widget.joke.joke,
                          dadName: widget.dadName,
                          dadImage: widget.dadImage,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TypingIndicator(
                showIndicator: !widget.typingDelayComplete,
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
                        widget.typingDelayComplete = false;

                        fetchJokeJson(http.Client()).then((value) {
                          Future.delayed(
                              Duration(milliseconds: _setDelayMilliseconds()),
                              () {
                            setState(() {
                              widget.joke = value;
                              widget.typingDelayComplete = true;
                              widget.dadName = getDadName();
                              widget.dadImage = getDadImage();
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

  int _setDelayMilliseconds() {
    //typing indicator delay range
    int min = 1500;
    int max = 2850;

    var delayMillis = min + rnd.nextInt(max - min);
    return delayMillis;
  }
}
