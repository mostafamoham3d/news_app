import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String url, required dynamic query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
