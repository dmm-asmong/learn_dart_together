import 'package:learn_dart_together/240329/data_source/movie_api.dart';
import 'package:learn_dart_together/240329/mapper/movie_mapper.dart';
import 'package:learn_dart_together/240329/model/movie.dart';

import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi _api;

  MovieRepositoryImpl(this._api);

  @override
  Future<List<Movie>> getMovieInfoList() async {
    //Movie 리스트 가져와야
    final movieDtoList = await _api.getMovies();
    final List<Movie> movieList = movieDtoList.map((e) => e.toMovie()).toList();
    return movieList;
  }
}

void main() async {
  final MovieApi _api = MovieApi();

  //다형성을 이용한 MovieRepository 타입으로
  MovieRepository repository = MovieRepositoryImpl(_api);
  final movieList = await repository.getMovieInfoList();

  print(movieList);
}
