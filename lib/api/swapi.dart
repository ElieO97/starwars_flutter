
import 'dart:convert';
import 'package:star_wars_flutter/api/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_flutter/models/movies_response.dart';

class Swapi {

   Future<MoviesResponse> fetchAllMovies() async {
      final response = await _makeGetRequest(Endpoints.fetchAllMoviesUrl());
      print ('fetchAllMovies(): result = ${response.body}');
      final MoviesResponse result =  MoviesResponse.fromJson(json.decode(response.body));
      return result;
   }


   Future<http.Response>  _makeGetRequest(String url) async {
      print('calling -> $url');
      return await http.get(url);
   }
}