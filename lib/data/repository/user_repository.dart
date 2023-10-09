import 'package:dio/dio.dart';
import '../../presentation/models/user.dart';

class UserRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'http://45.10.110.181:8080';

  UserRepository() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _addAuthTokenHeader,
    ));
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final data = {'email': email, 'password': password};
      final response =
          await _dio.post('$baseUrl/api/v1/auth/login', data: data);

      if (response.statusCode == 200) {
        final responseData = response.data;
        final accessToken = responseData['tokens']['accessToken'];
        final user = responseData['user'];

        if (accessToken != null && user != null) {
          final nicknameData = user['nickname'];
          final emailData = user['email'];

          if (nicknameData != null && emailData != null) {
            return User(nickname: nicknameData, email: emailData);
          }
        }
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  Future<void> _addAuthTokenHeader(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authToken = await getAuthToken();
    options.headers['Authorization'] = 'Bearer $authToken';
    handler.next(options);
  }

  Future<String> getAuthToken() async {
    const authToken = 'your_auth_token';
    return authToken;
  }
}
