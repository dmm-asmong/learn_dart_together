import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/movie_dto.dart';

class MovieApi {
  Future<List<MovieDto>> getMovies() async {
    final _baseUrl = 'https://api.themoviedb.org';

    final http.Response response = await http.get(Uri.parse(
        '$_baseUrl/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

    final Map<String, dynamic> json = jsonDecode(response.body);
    final resultsJson = json['results'] as List;
    // 위 코드와 동일 final List<resultsJson> = json['results'];
    final movieList = resultsJson.map((e) => MovieDto.fromJson(e)).toList();
    return movieList;
  }
}
