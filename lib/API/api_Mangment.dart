import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movise/model/MoviesDM.dart';

class ApiManager {
  static const imagePath = 'https://image.tmdb.org/t/p/w500';
  static const api_key = 'a91213acd24852770df4d9b4e0de3462';

  static const baseUrlPopular =
      'https://api.themoviedb.org/3/movie/popular?api_key=$api_key';
  static const baseUrlNewReleases =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$api_key';
  static const baseUrlRecomended =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$api_key';

  String baseUrlMoreLikeThis(int id) {
    return 'https://api.themoviedb.org/3/movie/$id/similar?api_key=$api_key';
  }

  String baseUrlDataSearch() {
    return 'https://api.themoviedb.org/3/search/movie?query=block&api_key=$api_key';
  }

  Future<List<MoviesDM>> getPopularMovies() async {
    final response = await http.get(Uri.parse(baseUrlPopular));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((popular) => MoviesDM.fromJson(popular)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }

  Future<List<MoviesDM>> getNewReleases() async {
    final response = await http.get(Uri.parse(baseUrlNewReleases));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((popular) => MoviesDM.fromJson(popular)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }

  Future<List<MoviesDM>> getRecomended() async {
    final response = await http.get(Uri.parse(baseUrlRecomended));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((popular) => MoviesDM.fromJson(popular)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }

  Future<List<MoviesDM>> getMoreLikeThis(id) async {
    print(id);
    final response = await http.get(Uri.parse(baseUrlMoreLikeThis(id)));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((popular) => MoviesDM.fromJson(popular)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }

  Future<List<MoviesDM>> getDataSearch() async {
    final response = await http.get(Uri.parse(baseUrlDataSearch()));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((popular) => MoviesDM.fromJson(popular)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }
}
