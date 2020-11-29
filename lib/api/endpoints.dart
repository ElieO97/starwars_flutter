
import 'package:star_wars_flutter/constants/api_constants.dart';

class Endpoints {

  static String fetchAllMoviesUrl() {
    return '$BASE_URL'
        'films/';
  }

}