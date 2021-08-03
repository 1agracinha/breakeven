import 'package:flutter/foundation.dart';

class UsuarioModel {
  final String id, token, email;
  UsuarioModel({@required this.id, @required this.email, @required this.token});

  static UsuarioModel fromJson(dynamic json) {
    return UsuarioModel(
        email: json["email"], id: json["localId"], token: json["idToken"]);
  }
}
