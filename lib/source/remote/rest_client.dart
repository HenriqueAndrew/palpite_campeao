import 'package:dio/dio.dart';
import 'package:palpite_campeao/model/Partida.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

//https://api.api-futebol.com.br/v1/partidas/7034
//https://api.api-futebol.com.br/v1/campeonatos/14/partidas

@RestApi(baseUrl: 'https://api.api-futebol.com.br')
abstract class RestClient{
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  //v1/campeonatos/{campeonato_id}/partidas
  //'/v1/partidas/{partida_id}'
  @GET('/v1/partidas/{partida_id}') //16795
  Future<Partida> getPartida(@Path() String partida_id);
}