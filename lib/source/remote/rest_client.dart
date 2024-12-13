import 'package:dio/dio.dart';
import 'package:palpite_campeao/model/Partida.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

//@RestApi(baseUrl: 'http://localhost:3000')
@RestApi(baseUrl: 'http://192.168.0.210:3000')
//@RestApi(baseUrl: 'http://10.0.2.2:3000')
abstract class RestClient{
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/partidas')
  Future<List<Partida>> getPartidas();

  @GET('/partidas/{timeNome}')
  Future<List<Partida>> getPartidasPorTime(@Path("timeNome") String timeNome);

}