import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:a_laugh_a_day/models/joke.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;
import 'package:a_laugh_a_day/utils/joke_utils.dart';
import 'package:a_laugh_a_day/widgets/custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/widgets/dad_message_box_widget.dart';
import 'package:a_laugh_a_day/widgets/typing_indicator/typing_indicator.dart';

class JokeGeneratorHome extends StatefulWidget {
  const JokeGeneratorHome({Key? key}) : super(key: key);

  @override
  State<JokeGeneratorHome> createState() => _JokeGeneratorHomeState();
}

class _JokeGeneratorHomeState extends State<JokeGeneratorHome> {
  final Set<JokeObject> _jokes = <JokeObject>{};
  bool _typingDelayComplete = false;

  @override
  void initState() {
    fetchJokeJson(http.Client()).then((value) {
      Future.delayed(Duration(milliseconds: setDelayMilliseconds()), () {
        setState(() {
          _jokes.add(value.first);
          _typingDelayComplete = true;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "A LAUGH A DAY",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Aleo-Regular',
              letterSpacing: width / 80),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: const Color.fromARGB(255, 28, 245, 219),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 28, 245, 220),
            Color.fromARGB(255, 253, 163, 163),
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: (width / 20), right: width / 20),
                child: _typingDelayComplete
                    ? Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(144, 253, 163, 163),
                                Color.fromARGB(57, 28, 245, 220),
                              ],
                            ),
                            boxShadow: [
                              CustomBoxShadow(
                                  color: Color.fromARGB(71, 0, 0, 0),
                                  offset: new Offset(0.5, 0.5),
                                  blurRadius: 10.0,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: DadMessageBoxWidget(
                          jokeText: _jokes.first.joke,
                          dadName: Constants.DAD_NAMES.elementAt(
                              Random().nextInt(Constants.DAD_NAMES.length)),
                        ),
                      )
                    : SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TypingIndicator(
                  showIndicator: !_typingDelayComplete,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromARGB(99, 253, 163, 163))),
                      onPressed: () {
                        setState(() {
                          _typingDelayComplete = false;
                        });

                        fetchJokeJson(http.Client()).then((value) {
                          Future.delayed(
                              Duration(milliseconds: setDelayMilliseconds()),
                              () {
                            setState(() {
                              _jokes.clear();
                              _jokes.add(value.first);
                              _typingDelayComplete = true;
                            });
                          });
                        });
                      },
                      child: Text(
                        "Another Laugh?",
                        style: TextStyle(
                          fontFamily: 'Aleo-Regular',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(204, 0, 0, 0),
                          letterSpacing: width / 130,
                          shadows: [
                            Shadow(
                              offset: Offset(0.75, 0.75),
                              color: Color.fromARGB(57, 28, 245, 220),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  int setDelayMilliseconds() {
    //typing indicator delay range
    int min = 1750;
    int max = 2850;

    Random rnd = Random();

    return rnd.nextInt(min + (max - min));
  }
}
