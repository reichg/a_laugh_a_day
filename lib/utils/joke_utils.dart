import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../models/joke.dart';
import 'package:http/http.dart' as http;
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

Random rnd = Random();

Future<Set<JokeObject>> fetchJokeJson(http.Client client) async {
  const url = 'https://icanhazdadjoke.com/';
  final headers = {
    "Accept": "application/json",
    "User-Agent": "A Laugh A Day (evolutionary.eyes@gmail.com)"
  };
  final response = await client.get(Uri.parse(url), headers: headers);
  Set<JokeObject> jokeJsonObjectSet = <JokeObject>{};

  if (response.statusCode == 200) {
    if (jokeJsonObjectSet.isNotEmpty) {
      jokeJsonObjectSet.clear();
    }
    var jokeJson = json.decode(response.body);
    jokeJsonObjectSet.add(JokeObject.fromJson(jokeJson));
  }
  return jokeJsonObjectSet;
}

String getDadName() {
  return Constants.DAD_NAMES.elementAt(rnd.nextInt(Constants.DAD_NAMES.length));
}

AssetImage getDadImage() {
  return AssetImage(
      Constants.DAD_PHOTOS.elementAt(rnd.nextInt(Constants.DAD_PHOTOS.length)));
}
