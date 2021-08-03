import 'package:breakeven/screens/cadastro/cadastro_page.dart';
import 'package:breakeven/screens/saldo_entrada/saldo.dart';
import 'package:breakeven/shared/logo_azul.dart';
import 'package:breakeven/shared/main_button.dart';
import 'package:breakeven/shared/main_textfield.dart';
import 'package:breakeven/shared/rodape_login_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
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
                  SizedBox(
                    height: 26,
                  ),
                  MainButton(
                    text: "Entrar",
                    onPressed: () {
                      Get.off(Saldo(), transition: Transition.rightToLeft);
                    },
                  )
                ],
              ),
            ),
            SizedBox(),
            RodapeLoginSignup(
              leftText: "Não tem uma conta?",
              rightText: "Cadastre-se",
              onPressed: () =>
                  Get.to(CadastroPage(), transition: Transition.rightToLeft),
            )
          ],
        ),
      ),
    );
  }
}
