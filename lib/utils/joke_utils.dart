import 'dart:convert';

import '../models/joke.dart';
import 'package:http/http.dart' as http;
import 'package:a_laugh_a_day/utils/constants.dart' as Constants;

Future<Set<JokeObject>> fetchJokeJson(http.Client client) async {
  const url = 'https://icanhazdadjoke.com/';
  final headers = {"Accept": "application/json"};
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
