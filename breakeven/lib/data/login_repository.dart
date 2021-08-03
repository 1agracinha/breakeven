import 'dart:convert';

import 'package:http/http.dart' as http;
import '../enviroment.dart';

class LoginRepository {
  Future<Map<String, dynamic>> authenticate(
      String email, String password) async {
    final response = await http.post(
      Uri.parse(
          "${Env.firebaseAPI}/accounts:signInWithPassword?key=${Env.apiKey}"),
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw response.body;
    }
  }

  Future<Map<String, dynamic>> signup(String email, String password) async {
    final response = await http.post(
      Uri.parse("${Env.firebaseAPI}/accounts:signUp?key=${Env.apiKey}"),
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw response.body;
    }
  }
}
