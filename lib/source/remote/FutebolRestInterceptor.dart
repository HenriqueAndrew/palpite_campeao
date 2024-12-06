import 'package:dio/dio.dart';
import 'rest_client.dart';

Future<RestClient> createRestClient() async {
  final dio = Dio();

  // Adiciona o token ao cabeçalho para todas as requisições
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        const token = 'test_2eb54fb90a3bee5d020ed8170b68dd';
        options.headers['Authorization'] = 'Bearer $token';
        print('Requisição para: ${options.uri}');
        print('Cabeçalhos: ${options.headers}');
        return handler.next(options);
      },
      onResponse: (response, handler){
        print('Resposta: ${response.statusCode}');
        print('Dados: ${response.data}');
        return handler.next(response);
      },
      onError: (DioError error, handler){
        print('Erro: ${error.response?.statusCode}');
        print('Mensagem: ${error.response?.data}');
        return handler.next(error);
      }
    ),
  );

  // Criação do cliente REST
  return RestClient(dio);
}