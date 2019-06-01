import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example/movies.dart';
import 'package:example/movies_bloc.dart';

void main() => runApp(
      MaterialApp(
        title: 'Flutter Example',
        routes: {
          // When we navigate to the "/" route, build the FirstScreen Widget
          '/': (context) =>
              Provider(builder: (_) => MoviesBloc(), child: Movies()),
        },
      ),
    );
