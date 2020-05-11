import 'dart:io';
import 'dart:convert';
import 'movie.dart';

import 'package:http/http.dart' as http;

// class HttpHelper {
//   final String urlKey = 'api_key=1a9aceba94048ac5e5014afa3d93e25e';
//   final String urlBase = 'https://api.themoviedb.org/3/movie';
//   final String urlUpcoming = '/upcoming?';
//   final String urlLanguage = '&language=en-US';

//   Future<List> getUpcomnig() async {
//     final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;

//     http.Response result = await http.get(upcoming);

//     if (result.statusCode == HttpStatus.ok) {
//       final jsonResponse = json.decode(result.body);
//       final moviesMap = jsonResponse['result'];

//       List movies = moviesMap.map((i) => Movie.formJson(i)).toList();
//       return movies;
//     } else {
//       return null;
//     }
//   }
// }
class HttpHelper {
  final String urlKey = 'api_key=1a9aceba94048ac5e5014afa3d93e25e';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String urlSearchBase = 'https://api.themoviedb.org/3/search/movie?api_key=e3fd37e8dd3eca6eecb8808906be73bc&query=';

  Future<List> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(upcoming);
    // var myResult = await http.get(upcoming);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List> findMovies(String title) async {
    final String query = urlSearchBase + title ;
    http.Response result = await http.get(query);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    }
    else {
      return null;
    }  }
}
