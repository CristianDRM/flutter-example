import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example/pokemons_bloc.dart';

class Pokemons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PokemonsBloc>(context);
    return Scaffold(
      appBar:
          AppBar(title: Text('Pokemons'), backgroundColor: Colors.deepPurple),
      body: FutureBuilder(
          future: bloc.fetchPokemons(),
          builder: (BuildContext context,
              AsyncSnapshot<Iterable<Pokemon>> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Container(
                  child: Text(
                'Sorry, there was an error :/\n${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ));
            }
            if (snapshot.data.isEmpty) {
              return Container(child: Text('Sorry!, no pokemons for you :/'));
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = snapshot.data.elementAt(index);
                  return ListTile(title: Text(movie.name));
                });
          }),
    );
  }
}
