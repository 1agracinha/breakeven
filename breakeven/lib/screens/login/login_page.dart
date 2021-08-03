import 'package:breakeven/controller/usuario_controller.dart';
import 'package:breakeven/models/usuario_model.dart';
import 'package:breakeven/screens/cadastro/cadastro_page.dart';
import 'package:breakeven/screens/saldo_entrada/saldo.dart';
import 'package:breakeven/shared/logo_azul.dart';
import 'package:breakeven/shared/main_button.dart';
import 'package:breakeven/shared/main_textfield.dart';
import 'package:breakeven/shared/rodape_login_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController senhaController = TextEditingController();

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
                      if (!GetUtils.isEmail(value)) return "E-mail inválido";
                      return null;
                    },
                  ),
                  MainTextField(
                      labelText: "Senha",
                      textController: senhaController,
                      validator: (value) {
                        if (value.isEmpty) return "Campo Obrigatório!";
                        return null;
                      }),
                  SizedBox(
                    height: 26,
                  ),
                  MainButton(
                    text: "Entrar",
                    onPressed: () async {
                      if (formkey.currentState.validate()) {
                        UsuarioModel usuario =
                            await usuarioController.authenticateController(
                                emailController.text, senhaController.text);
                        if (usuario != null) {
                          Get.to(() => Saldo());
                        }
                      }
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
