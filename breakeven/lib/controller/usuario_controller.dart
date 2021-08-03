import 'dart:convert';

import 'package:breakeven/data/login_repository.dart';
import 'package:breakeven/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UsuarioController extends GetxController {
  LoginRepository loginRepository = LoginRepository();
  GetStorage box = GetStorage("usuario");
  var idUsuario = "".obs;

  Future<UsuarioModel> authenticateController(
      String email, String senha) async {
    try {
      final response = await loginRepository.authenticate(email, senha);
      box.write("idUsuario", response["localId"]);
      idUsuario.value = box.read("idUsuario");
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
      box.write("idUsuario", response["localId"]);
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
