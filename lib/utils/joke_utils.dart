import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';

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

Image getDadImage() {
  return Image.asset(
      Constants.DAD_PHOTOS.elementAt(rnd.nextInt(Constants.DAD_PHOTOS.length)));
}
