
import 'package:dio/dio.dart';

// baseURL: https://newsapi.org/
// Method url: v2/everything?
// Query: q=tesla&from=2023-06-13&sortBy=publishedAt&apiKey=c4c9f4ddc89d4c6da21f8337ae191838

class DioHelper
{
  static Dio? dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response?> getData({
  required String url,
    required Map<String, dynamic> query
}) async
  {
    return await  dio?.get(
      url,
      queryParameters: query
    );
  }
}