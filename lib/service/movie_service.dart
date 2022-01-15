import 'package:chopper/chopper.dart';
import 'package:movies/models/popular.dart';

import 'header_interceptor.dart';
import 'model_converter.dart';

part 'movie_service.chopper.dart';

@ChopperApi()
abstract class MovieService extends ChopperService {
  @Get(path: 'movie/popular')
  Future<Response<Popular>> getPopularMovies();

  static MovieService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.themoviedb.org/3',
      interceptors: [HeaderInterceptor(), HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: JsonConverter(),
      services: [
        _$MovieService(),
      ],
    );
    return _$MovieService(client);
  }
}
