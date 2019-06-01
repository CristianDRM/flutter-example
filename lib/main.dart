import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example/pokemons_bloc.dart';
import 'package:example/pokemons.dart';
import 'package:example/single_pokemon.dart';

void main() => runApp(
      MaterialApp(
        title: 'Simplest State Management Example',
        routes: {
          // When we navigate to the "/" route, build the FirstScreen Widget
          '/': (context) =>
              Provider(builder: (_) => PokemonsBloc(), child: Pokemons()),
          '/pokemon': (context) {
            final String url = ModalRoute.of(context).settings.arguments;
            return Provider(
                builder: (_) => PokemonsBloc(), child: SinglePokemon(url));
          },
        },
      ),
    );
