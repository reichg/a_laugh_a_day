import 'package:flutter/material.dart';
import 'package:a_laugh_a_day/pages/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'A Laugh A Day',
      home: JokeGeneratorHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
