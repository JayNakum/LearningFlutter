import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/movie.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  const MoviesList({
    required this.movies,
    Key? key,
  }) : super(key: key);

  void _launchUrl(String id) async {
    final url = Uri.parse('https://www.imdb.com/title/$id');
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (ctx, i) {
        return Card(
          child: ListTile(
            onTap: () {
              _launchUrl(movies[i].imdbID);
            },
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('IMDB ID: ${movies[i].imdbID}'),
                ),
              );
            },
            leading: Image.network(movies[i].poster),
            title: Text(movies[i].title),
            subtitle: Text(movies[i].year),
            trailing: Text(movies[i].type),
          ),
        );
      },
    );
  }
}
