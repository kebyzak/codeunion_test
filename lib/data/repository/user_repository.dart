import 'package:dio/dio.dart';

class UserRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'http://45.10.110.181:8080';

  Future<bool> signIn(String username, String password) async {
    try {
      final data = {
        'username': username,
        'password': password,
      };

      final response =
          await _dio.post('$baseUrl/api/v1/auth/login', data: data);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error signing in: $e');
      return false;
    }
  }
}
