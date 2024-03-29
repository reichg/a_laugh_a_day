import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/joke.dart';
import 'package:http/http.dart' as http;
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

Random rnd = Random();

Future<JokeObject> fetchJokeJson(http.Client client) async {
  const url = 'https://icanhazdadjoke.com/';
  final headers = {
    "Accept": "application/json",
    "User-Agent": "A Laugh A Day (evolutionary.eyes@gmail.com)"
  };
  final response = await client.get(Uri.parse(url), headers: headers);
  late JokeObject jokeJsonObject;

  if (response.statusCode == 200) {
    var jokeJson = json.decode(response.body);
    jokeJsonObject = JokeObject.fromJson(jokeJson);
  }
  return jokeJsonObject;
}

String getDadName() {
  return Constants.DAD_NAMES.elementAt(rnd.nextInt(Constants.DAD_NAMES.length));
}

Future<Image> getDadImage() async {
  List<String> images = json
      .decode(await rootBundle.loadString('AssetManifest.json'))
      .keys
      .where((String key) => key.contains('assets/photos/dad_photos'))
      .toList();

  return Image.asset(images.elementAt(rnd.nextInt(images.length)));
}

int setDelayMilliseconds() {
  //typing indicator delay range
  int min = 1500;
  int max = 2850;

  var delayMillis = min + rnd.nextInt(max - min);
  return delayMillis;
}
