import 'package:dio/dio.dart';
import 'rest_client.dart';

Future<RestClient> createRestClient() async {
  final dio = Dio();
  print("[DEBUG] Configurando Dio com interceptores");

  dio.options.baseUrl = 'http://192.168.0.210:3000';

  dio.options.validateStatus = (status) {
    return status != null && status >= 200 && status < 500; // Permite status 404
  };

// Adiciona o interceptor de log
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    logPrint: (log) => print('[DIO_LOG] $log'),
  ));

  dio.interceptors.add(InterceptorsWrapper(
    onError: (DioError e, ErrorInterceptorHandler handler) {
      if (e.response != null && e.response!.statusCode == 404) {
        final customError = DioError(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: "Nenhuma partida encontrada para o time informado.",
          );
      return handler.reject(customError);
    }
    return handler.next(e);
  }
  ));

  // Criação do cliente REST
  return RestClient(dio);
}