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
  Future postData(
      {required String email,
      required String username,
      required String password,
      required String confirmpassword}) async {
    try {
      Response response = await dio.post("https://localhost:7270/Auth/register", data: {
        'username': username,
        'email': email,
        'password': password,
        'confirmPassword': confirmpassword,
      });
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
