import 'package:dio/dio.dart';
import 'package:elementary_test_app/models/base_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://api.disneyapi.dev/characters")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/")
  Future<BaseResponseModel> getCharacters();
}
