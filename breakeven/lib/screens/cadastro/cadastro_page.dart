import 'package:breakeven/screens/login/login_page.dart';
import 'package:breakeven/shared/logo_azul.dart';
import 'package:breakeven/shared/main_button.dart';
import 'package:breakeven/shared/main_textfield.dart';
import 'package:breakeven/shared/rodape_login_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroPage extends StatelessWidget {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

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
                    labelText: "Usuário",
                    textController: usuarioController,
                    validator: (value) {},
                  ),
                  MainTextField(
                      labelText: "Senha",
                      textController: senhaController,
                      validator: (value) {}),
                  MainTextField(
                      labelText: "Confirmar Senha",
                      textController: confirmarSenhaController,
                      validator: (value) {}),
                  SizedBox(
                    height: 26,
                  ),
                  MainButton(
                    text: "Cadastrar",
                    onPressed: () {},
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
