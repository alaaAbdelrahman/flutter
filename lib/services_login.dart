import 'package:dio/dio.dart';

class LoginServices {
  Dio dio = Dio();
  Future<Map<String, dynamic>> postData(
      {required String username, required String password}) async {
    try {
      Response response = await dio.post("https://localhost:7270/Auth/login", data: {
        'username': username,
        'password': password,
      });https://localhost:7270/
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
