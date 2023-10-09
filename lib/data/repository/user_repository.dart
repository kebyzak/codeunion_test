import 'package:dio/dio.dart';

import '../../presentation/models/user.dart';

class UserRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'http://45.10.110.181:8080';
  User? _loggedInUser;

  UserRepository() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final authToken = await getAuthToken();
        options.headers['Authorization'] = 'Bearer $authToken';
        return handler.next(options);
      },
    ));
  }

  void clearUserData() {
    _loggedInUser = null;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final data = {
        'email': email,
        'password': password,
      };

      final response =
          await _dio.post('$baseUrl/api/v1/auth/login', data: data);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final String? accessToken = responseData['tokens']['accessToken'];
        final Map<String, dynamic>? user = responseData['user'];

        if (user != null) {
          final String? nicknameData = user['nickname'];
          final String? emailData = user['email'];

          if (nicknameData != null && emailData != null) {
            final loggedInUser = User(nickname: nicknameData, email: emailData);
            _loggedInUser = loggedInUser;
            return loggedInUser;
          }
        }
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  Future<String> getAuthToken() async {
    const authToken = 'your_auth_token';
    return authToken;
  }
}
