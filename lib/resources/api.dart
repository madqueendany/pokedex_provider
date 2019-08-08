import 'package:dio/dio.dart';

class PokeApi {
  Dio _dio = Dio();

  // String _baseUrl = 'https://pokeapi.co/api/v2';
  String _baseUrl = 'http://localhost/api/v2';

  Future<dynamic> dispatch(String path,
      {String uri, Map<String, dynamic> params}) async {
    String _uri = uri ?? '$_baseUrl/$path';

    try {
      Response res = await _dio.get(
        _uri,
        queryParameters: params,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Connection': 'keep-alive',
        }),
      );

      if (res.statusCode == 200) {
        return res.data;
      } else if (res.statusCode == 503) {
        return null;
      }
    } on DioError catch (de) {
      print('de->${de.message}');
      return null;
    } catch (e) {
      print('e->$e');
      return null;
    }
  }
}
