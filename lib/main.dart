import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example/pokemons.dart';
import 'package:example/pokemons_bloc.dart';

void main() => runApp(
      MaterialApp(
        title: 'Simplest State Management Example',
        routes: {
          // When we navigate to the "/" route, build the FirstScreen Widget
          '/': (context) =>
              Provider(builder: (_) => PokemonsBloc(), child: Pokemons()),
        },
      ),
    );
