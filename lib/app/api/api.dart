import 'dart:io';

import 'package:dio/dio.dart';

const apiKeyTMDB = '452e1f972d2e508c37b9754d09558910';
const apiTokenTMDB =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NTJlMWY5NzJkMmU1MDhjMzdiOTc1NGQwOTU1ODkxMCIsInN1YiI6IjY1MWFjYjk3OTY3Y2M3MzQyN2YxYzUxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Sl0RZwS9X9SrsUQbye905AcZx_PvPqfhpxSAaJm4BgU';
const urlTMdb = 'https://api.themoviedb.org/3/movie';
const urlTMdbImagesBig = 'https://image.tmdb.org/t/p/w780/';
const urlTMdbImagesW500 = 'https://image.tmdb.org/t/p/w500/';

final Dio dio = Dio();

class ApiCalls {
  static String apiSufix = '?api_key=$apiKeyTMDB';

  static post(String url, Map<String, dynamic> data) async {
    return await dio.post(url + apiSufix,
        data: data,
        options: Options(
          headers: {
            Headers.acceptHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $apiTokenTMDB",
          },
        ));
  }

  static get(String url) async {
    return await dio.get(url,
        options: Options(
          headers: {
            Headers.acceptHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $apiTokenTMDB",
          },
        ));
  }
}
