import 'package:dio/dio.dart';

class LoginServices {
  Dio dio = Dio();
  Future<Map<String, dynamic>> postData(
      {required String username, required String password}) async {
    try {
      Response response = await dio.post("loginEndPoint", data: {
        'Username': username,
        'Password': password,
      });
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
