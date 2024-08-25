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

class RegisterServices {
  Dio dio = Dio();
  Future<Map<String, dynamic>> postData(
      {required String email,
      required String username,
      required String password,
      required String comfirepassword}) async {
    try {
      Response response = await dio.post("RegisterEndPoint", data: {
        'username': username,
        'email': email,
        'password': password,
        'confirmPassword': password,
      });
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
