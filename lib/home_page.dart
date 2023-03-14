import 'dart:math';

import 'package:a_laugh_a_day/widgets/subscription_page/subscription.dart';
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
  Random rnd = Random();
  final Set<JokeObject> _jokes = <JokeObject>{};
  int _jokesRetrievedToday = 0;
  bool _typingDelayComplete = false;
  bool isMenuActive = false;

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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(
                    "Subscription",
                  ),
                  onTap: () {},
                ),
              ];
            },
            icon: Icon(Icons.menu_sharp),
          ),
          title: Text(
            "A LAUGH A DAY",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Futura',
                letterSpacing: 9),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(18, 203, 203, 203),
          foregroundColor: Color.fromARGB(207, 0, 221, 207),
          elevation: 5,
          shadowColor: Color.fromARGB(255, 0, 0, 0),
        ),
        body: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(238, 3, 4, 6),
              boxShadow: [
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
                  child: _typingDelayComplete
                      ? Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(18, 203, 203, 203),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Color.fromARGB(207, 0, 221, 207),
                            shadowColor: Colors.black),
                        onPressed: () {
                          if (isSubscriptionsPage()) {
                            showSubscriptionPage();
                            return;
                          }
                          setState(() {
                            _typingDelayComplete = false;
                            _jokesRetrievedToday++;
                            print(_jokesRetrievedToday);

                            fetchJokeJson(http.Client()).then((value) {
                              Future.delayed(
                                  Duration(
                                      milliseconds: setDelayMilliseconds()),
                                  () {
                                setState(() {
                                  _jokes.clear();
                                  _jokes.add(value.first);
                                  _typingDelayComplete = true;
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

  bool isSubscriptionsPage() {
    return _jokesRetrievedToday >= 5;
  }

  void showSubscriptionPage() {
    showDialog(
        context: context,
        builder: (BuildContext context) => SubscriptionsPage());
  }
}
