import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:a_laugh_a_day/models/joke.dart';
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;
import 'package:a_laugh_a_day/utils/joke_utils.dart';
import 'package:a_laugh_a_day/widgets/custom_box_shadow/custom_box_shadow.dart';
import 'package:a_laugh_a_day/widgets/dad_message_box_widget.dart';
import 'package:a_laugh_a_day/widgets/typing_indicator/typing_indicator.dart';
import 'package:sizer/sizer.dart';

class JokeGeneratorHome extends StatefulWidget {
  const JokeGeneratorHome({Key? key}) : super(key: key);

  @override
  State<JokeGeneratorHome> createState() => _JokeGeneratorHomeState();
}

class _JokeGeneratorHomeState extends State<JokeGeneratorHome> {
  Random rnd = Random();
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
              letterSpacing: 9),
        ),
        centerTitle: true,
        backgroundColor: Constants.PRIMARY_BLACK,
        foregroundColor: Constants.PRIMARY_AQUA,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Constants.PRIMARY_GRADIENT_GREY,
            Constants.PRIMARY_BLACK,
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: _typingDelayComplete
                    ? Container(
                        decoration: const BoxDecoration(
                            color: Constants.PRIMARY_AQUA,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              CustomBoxShadow(
                                  color: Constants.PRIMARY_AQUA,
                                  offset: Offset(1.2, 1.2),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: Center(
                          child: DadMessageBoxWidget(
                            jokeText: _jokes.first.joke,
                            dadName: Constants.DAD_NAMES.elementAt(
                                Random().nextInt(Constants.DAD_NAMES.length)),
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
                      style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith((states) =>
                            EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 3.w)),
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Constants.PRIMARY_AQUA,
                        ),
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 5),
                        shadowColor: MaterialStateProperty.resolveWith(
                            (states) => Constants.PRIMARY_AQUA),
                      ),
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
                      child: const Text(
                        "Another Laugh?",
                        style: TextStyle(
                          fontFamily: 'Aleo-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.PRIMARY_BLACK,
                          letterSpacing: 5,
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
    int min = 1500;
    int max = 2850;

    var delayMillis = min + rnd.nextInt(max - min);
    return delayMillis;
  }
}
