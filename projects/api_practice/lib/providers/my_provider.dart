import 'dart:convert';

import 'package:api_practice/models/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MyProvider with ChangeNotifier {
  final url = Uri.parse(
    "http://www.omdbapi.com/?i=tt3896198&apikey=c4033450&s=Movies",
  );

  final List<Movie> _movies = [];

  List<Movie> get movies {
    return [..._movies];
  }

  Future<void> fetchAndSetMovies() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData.containsKey('Search')) {
        final movies = extractedData['Search'] as List<dynamic>;
        _movies.clear();
        for (var movie in movies) {
          _movies.add(
            Movie(
              poster: movie['Poster'],
              title: movie['Title'],
              year: movie['Year'],
              imdbID: movie['imdbID'],
              type: movie['Type'],
            ),
          );
        }
        notifyListeners();
      }
    }
  }
}
