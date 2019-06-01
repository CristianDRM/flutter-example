import 'package:example/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<MoviesBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Movies'), backgroundColor: Colors.deepPurple),
      body: FutureBuilder(
          future: bloc.movies(),
          builder:
              (BuildContext context, AsyncSnapshot<Iterable<Movie>> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.data.isEmpty) {
              return Container(child: Text('Sorry!, no movies for you :/'));
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
