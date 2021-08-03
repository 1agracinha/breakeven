import 'package:breakeven/controller/usuario_controller.dart';
import 'package:breakeven/models/usuario_model.dart';
import 'package:breakeven/screens/login/login_page.dart';
import 'package:breakeven/shared/logo_azul.dart';
import 'package:breakeven/shared/main_button.dart';
import 'package:breakeven/shared/main_textfield.dart';
import 'package:breakeven/shared/rodape_login_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  final UsuarioController usuarioController = UsuarioController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            LogoAzul(),
            Form(
              key: formkey,
              child: Column(
                children: [
                  MainTextField(
                    labelText: "E-mail",
                    textController: emailController,
                    validator: (value) {
                      if (value.isEmpty) return "Campo Obrigatório!";
                      if (value.length < 3)
                        return "Usuário deve conter 3 ou mais caracteres";
                    },
                  ),
                  MainTextField(
                      labelText: "Senha",
                      textController: senhaController,
                      validator: (value) {
                        if (value.isEmpty) return "Campo Obrigatório!";
                      }),
                  MainTextField(
                      labelText: "Confirmar Senha",
                      textController: confirmarSenhaController,
                      validator: (value) {
                        if (value.isEmpty) return "Campo Obrigatório!";
                        if (value != senhaController.text)
                          return "Senha não coincide com a anterior";
                      }),
                  SizedBox(
                    height: 26,
                  ),
                  MainButton(
                    text: "Cadastrar",
                    onPressed: () async {
                      if (formkey.currentState.validate()) {
                        Future<UsuarioModel> response =
                            usuarioController.signupController(
                                emailController.text, senhaController.text);
                        if (response != null) {
                          Get.snackbar(
                            "Sucesso!",
                            "Usuário cadastrado.",
                            backgroundColor: Colors.greenAccent,
                            duration: Duration(seconds: 1),
                          );
                        }
                      }
                    },
                  )
                ],
              ),
            ),
            SizedBox(),
            RodapeLoginSignup(
              leftText: "Já tem uma conta?",
              rightText: "Entrar",
              onPressed: () =>
                  Get.to(LoginPage(), transition: Transition.leftToRight),
            )
          ],
        ),
      ),
    );
  }
}
