import 'dart:convert';

import 'package:breakeven/data/login_repository.dart';
import 'package:breakeven/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsuarioController {
  LoginRepository loginRepository = LoginRepository();

  Future<UsuarioModel> authenticateController(
      String email, String senha) async {
    try {
      final response = await loginRepository.authenticate(email, senha);

      return UsuarioModel.fromJson(response);
    } catch (e) {
      final failure = json.decode(e);

      Get.snackbar(
        "Ops!",
        "${failure["error"]["message"]}",
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 600),
      );
    }
    return null;
  }

  Future<UsuarioModel> signupController(String email, String senha) async {
    try {
      final response = await loginRepository.signup(email, senha);

      return UsuarioModel.fromJson(response);
    } catch (e) {
      final failure = json.decode(e);

      Get.snackbar(
        "Ops!",
        "${failure["error"]["message"]}",
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 600),
      );
    }
    return null;
  }
}
