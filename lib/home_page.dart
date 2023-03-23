import 'dart:math';

import 'package:a_laugh_a_day/icon_classes/app_icons.dart';
import 'package:a_laugh_a_day/models/joke.dart';
import 'package:a_laugh_a_day/pages/about.dart';
import 'package:a_laugh_a_day/pages/contact.dart';
import 'package:a_laugh_a_day/pages/joke_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'utils/joke_utils.dart';

class JokeGeneratorHome extends StatefulWidget {
  const JokeGeneratorHome({Key? key}) : super(key: key);

  @override
  State<JokeGeneratorHome> createState() => _JokeGeneratorHomeState();
}

class _JokeGeneratorHomeState extends State<JokeGeneratorHome> {
  Random rnd = Random();
  int _selectedTab = 0;
  late JokeObject _joke;
  bool _typingDelayComplete = false;
  late String _dadName;
  late AssetImage _dadImage;

  List<Widget> _tabChildren = [
    AboutPage(),
    ContactPage(),
  ];

  @override
  void initState() {
    fetchJokeJson(http.Client()).then((value) {
      setState(() {
        _joke = value;
        _dadName = getDadName();
        _dadImage = getDadImage();
        _tabChildren.insert(
            0,
            JokePage(
              dadImage: _dadImage,
              dadName: _dadName,
              joke: _joke,
              typingDelayComplete: _typingDelayComplete,
            ));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        extendBody: false,
        appBar: AppBar(
          title: Text(
            "A LAUGH A DAY",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Futura',
                letterSpacing: 9),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 44, 44, 44),
          foregroundColor: Color.fromARGB(207, 0, 221, 207),
          elevation: 8,
          shadowColor: Color.fromARGB(255, 0, 0, 0),
        ),
        body: _tabChildren[_selectedTab],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(148, 0, 0, 0),
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) => _changeTab(index),
            backgroundColor: Color.fromARGB(255, 34, 34, 34),
            currentIndex: _selectedTab,
            selectedItemColor: Color.fromARGB(207, 0, 221, 207),
            unselectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.emo_thumbsup),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "About",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail),
                label: "Contact",
              ),
            ],
            elevation: 20,
          ),
        ),
      ),
    );
  }

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
}
