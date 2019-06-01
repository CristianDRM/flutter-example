import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Movie {
  Movie({@required this.name}) : assert(name != null);
  String name;
}

class MoviesBloc {
  final _client = http.Client();

  // Your data fetch here
  Future<Iterable<Movie>> movies() async {
    final response = await _client.get('https://pokeapi.co/api/v2/pokemon');
    final jsonData = json.decode(response.body);
    return (jsonData['results'] as List)
        .map((data) => Movie(name: data['name']))
        .toList();
  }
}
