import 'package:dio/dio.dart';


class ApiService {
  final Dio dio = Dio();

  /// get Method

  Future<Response> getMethod({required String url}) async {
    final response = await dio.get(url);
    print("[get Method api response print here---${response.data}]");
    return response;
  }


}
