import 'package:dio/dio.dart';
class DioHelper {
  static late Dio dio ;



  static init(){
    dio = Dio(BaseOptions(
      baseUrl: 'http://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }


  static Future<Response> getData(
      String url,
      Map< String , dynamic> query
      ) async {
    return await dio.get(url,queryParameters: query );
  }

}



