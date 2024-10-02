import 'package:dio/dio.dart';

class PopularApi {

  final dio = Dio();
  void getPopularMovies() async {
    final response = await dio.get('https://api.themoviedb.org/3/movie/popular?api_key=&language=es-MX&page=1');
    final res = response.data;
    print('API MOVIES');
    print(res);
  }


}