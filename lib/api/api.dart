import 'dart:convert';

import 'package:moviesapp/constant.dart';
import 'package:moviesapp/models/movie.dart';
import 'package:http/http.dart' as http;
class Api {
  static const _trendyUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upComingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  // static const _searchUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendyMovies() async{
    final response = await http.get(Uri.parse(_trendyUrl));
    if (response.statusCode == 200) {
          final decodeData = json.decode(response.body)['results'] as List  ;
          return decodeData.map((movie) =>Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something Happened');
    }
  }
  Future<List<Movie>> getTopRatedMovies() async{
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
          final decodeData = json.decode(response.body)['results'] as List  ;
          return decodeData.map((movie) =>Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something Happened');
    }
  }
  Future<List<Movie>> getUpcomingMovies() async{
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
          final decodeData = json.decode(response.body)['results'] as List  ;
          return decodeData.map((movie) =>Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something Happened');
    }
  }
  // Future<List<Movie>> getSearchMovies({required String query}) async{
  //   final url = '$_searchUrl&query=$query';
  //   final response = await http.get(
  //     Uri.parse(url));
  //   if (response.statusCode == 200) {
  //         final decodeData = json.decode(response.body)['results'] as List  ;
  //         return decodeData.map((movie) =>Movie.fromJson(movie)).toList();
  //   }else{
  //     throw Exception('Something Happened');
  //   }
  // }
}