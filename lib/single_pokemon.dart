import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example/pokemons_bloc.dart';

class SinglePokemon extends StatelessWidget {
  SinglePokemon(this.url);

  final String url;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PokemonsBloc>(context);
    return Scaffold(
      appBar:
          AppBar(title: Text('Pokemon'), backgroundColor: Colors.deepPurple),
      body: FutureBuilder(
          future: bloc.fetchSinglePokemon(url),
          builder: (BuildContext context, AsyncSnapshot<FullPokemon> snapshot) {
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
            if (snapshot.data == null) {
              return Container(child: Text('Sorry!, no pokemons for you :/'));
            }
            return Column(
              children: [
                Image.network(snapshot.data.sprite),
                Text(snapshot.data.name),
              ],
            );
          }),
    );
  }
}
