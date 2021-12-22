import 'package:dio/dio.dart';
import 'dart:async';
import 'package:film_app/model/respon_aliran.dart';
import 'package:film_app/model/respon_detail_film.dart';
import 'package:film_app/model/respon_film.dart';
import 'package:film_app/model/respon_pemeran.dart';
import 'package:film_app/model/respon_video.dart';
import 'package:film_app/model/tanggapan_orang.dart';

class GudangFilm {
  final String apiKey = "1e8632d3f90a3b8c1a52c693fec1a5bb";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  var getTopRatedUrl = '$mainUrl/movie/top_rated';
  var getMovieDiscoverUrl = '$mainUrl/discover/movie';
  var getNowPlayingUrl = '$mainUrl/movie/now_playing';
  var getMovieListUrl = '$mainUrl/genre/movie/list';
  var getTrendingUrl = '$mainUrl/trending/person/week';
  var filmUrl = "$mainUrl/movie";

  // Top Rated URL
  Future<ResponFilm> getFilms() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
    };

    try {
      Response response =
          await _dio.get(getTopRatedUrl, queryParameters: params);
      return ResponFilm.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponFilm.withError("$error");
    }
  }

  // Movie Discover URL
  Future<ResponFilm> getFilmsByGenre(int id) async {
    var params = {
      "api_key": "1e8632d3f90a3b8c1a52c693fec1a5bb",
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response =
          await _dio.get(getMovieDiscoverUrl, queryParameters: params);
      return ResponFilm.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponFilm.withError("$error");
    }
  }

  // Now Playing URL
  Future<ResponFilm> getPlayingMovies() async {
    var params = {
      "api_key": "1e8632d3f90a3b8c1a52c693fec1a5bb",
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getNowPlayingUrl, queryParameters: params);
      return ResponFilm.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponFilm.withError("$error");
    }
  }

  // Movie List URL (Genres)
  Future<ResponAliran> getGenres() async {
    var params = {
      "api_key": "1e8632d3f90a3b8c1a52c693fec1a5bb",
      "language": "en-US",
    };
    try {
      Response response =
          await _dio.get(getMovieListUrl, queryParameters: params);
      return ResponAliran.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponAliran.withError("$error");
    }
  }

  // Trending URL (Persons)
  Future<TanggapanOrang> getPersons() async {
    var params = {"api_key": apiKey};
    try {
      Response response =
          await _dio.get(getTrendingUrl, queryParameters: params);
      return TanggapanOrang.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TanggapanOrang.withError("$error");
    }
  }

  //Film Detail
  Future<ResponDetailFilm> getFilmDetail(int id) async {
    var params = {
      "api_key": "1e8632d3f90a3b8c1a52c693fec1a5bb",
      "language": "en-US",
    };
    try {
      Response response =
          await _dio.get(filmUrl + "/$id", queryParameters: params);
      return ResponDetailFilm.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponDetailFilm.withError("$error");
    }
  }

  // Film Video
  Future<ResponVideo> getFilmVideos(int id) async {
    var params = {
      "api_key": "1e8632d3f90a3b8c1a52c693fec1a5bb",
      "language": "en-US",
    };
    try {
      Response response =
          await _dio.get(filmUrl + "/$id" + "/videos", queryParameters: params);
      return ResponVideo.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponVideo.withError("$error");
    }
  }

  // Similar Film
  Future<ResponFilm> getSimilarFilms(int id) async {
    var params = {
      "api_key": "1e8632d3f90a3b8c1a52c693fec1a5bb",
      "language": "en-US",
      "page": 1,
    };
    try {
      Response response = await _dio.get(filmUrl + "/$id" + "/similar",
          queryParameters: params);
      return ResponFilm.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponFilm.withError("$error");
    }
  }

  // Credits
  Future<ResponPemeran> getActors(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
    };
    try {
      Response response = await _dio.get(filmUrl + "/$id" + "/credits",
          queryParameters: params);
      return ResponPemeran.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponPemeran.withError("$error");
    }
  }
}
