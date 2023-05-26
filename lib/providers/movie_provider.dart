import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:aplicacion_de_peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '73a11aa8d836a2f4b6f636530f776ca4';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
  }
  
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}