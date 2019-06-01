import 'package:flutter/foundation.dart';

class Movie {
  Movie({@required this.name}) : assert(name != null);
  String name;
}

class MoviesBloc {
  // Your data fetch here
  Future<Iterable<Movie>> movies() => Future.value([
        Movie(name: 'The future is purple'),
        Movie(name: 'The future is now'),
      ]);
}
