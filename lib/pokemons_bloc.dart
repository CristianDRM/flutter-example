import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Pokemon {
  Pokemon({
    @required this.name,
    @required this.url,
  }) : assert(name != null && url != null);
  final String name;
  final String url;
}

class FullPokemon {
  FullPokemon({
    @required this.name,
    @required this.sprite,
  }) : assert(name != null && sprite != null);
  final String name;
  final String sprite;
}

class PokemonsBloc {
  final _client = http.Client();

  Future<Iterable<Pokemon>> fetchPokemons() async {
    final response = await _client.get('https://pokeapi.co/api/v2/pokemon');
    final jsonData = json.decode(response.body);
    return (jsonData['results'] as List)
        .map((data) => Pokemon(name: data['name'], url: data['url']))
        .toList();
  }

  Future<FullPokemon> fetchSinglePokemon(String url) async {
    final response = await _client.get(url);
    final jsonData = json.decode(response.body);
    return FullPokemon(
      name: jsonData['name'],
      sprite: jsonData['sprites']['front_default'],
    );
  }
}
