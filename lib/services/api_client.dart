import 'package:dio/dio.dart';
import 'package:weather_app/utilities/constant.dart';

class ApiClient {
  Future<Response> getWeather(String location) async {
    // String url = '$baseUrl?q=$location&APPID=$appId';
    Map<String, dynamic> params = {'q': location, 'APPID': appId};
    try {
      Dio request = Dio();
      Response response = await request.get(baseUrl, queryParameters: params);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
