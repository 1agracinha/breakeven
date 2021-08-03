import 'package:breakeven/controller/saldo_controller.dart';
import 'package:breakeven/screens/atualizar_saldo/widgets/atualizar_saldo_conteudo.dart';
import 'package:breakeven/screens/atualizar_saldo/widgets/receita_button.dart';
import 'package:breakeven/screens/atualizar_saldo/widgets/atualizar_saldo_textfield.dart';
import 'package:breakeven/screens/atualizar_saldo/widgets/salvar_saldo_button.dart';
import 'package:breakeven/theme/cores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AtualizarSaldo extends StatefulWidget {
  @override
  _AtualizarSaldoState createState() => _AtualizarSaldoState();
}

class _AtualizarSaldoState extends State<AtualizarSaldo> {
  bool receita = true;
  TextEditingController valorSaldoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaldoController>(
      builder: (saldoController) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Adicionar Movimentação",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        body: AtualizarSaldoConteudo(
          widgets: [
            Text("É uma receita ou despesa?",
                style: TextStyle(fontSize: 18, color: Colors.black38)),
            Row(
              children: [
                ReceitaButton(
                  text: "receita",
                  activeButtonColor: verde,
                  disableButtonColor: Colors.black26,
                  isReceita: receita,
                  onTap: () {
                    setState(() {
                      receita = true;
                    });
                  },
                ),
                ReceitaButton(
                  text: "despesa",
                  activeButtonColor: Colors.black26,
                  disableButtonColor: vermelho,
                  isReceita: receita,
                  onTap: () {
                    setState(() {
                      receita = false;
                    });
                  },
                ),
              ],
            ),
            AtualizarSaldoTextField(
              valorSaldoController: valorSaldoController,
            )
          ],
        ),
        floatingActionButton: SalvarSaldoButton(
          isReceita: receita,
          sc: saldoController,
          valorSaldoController: valorSaldoController,
        ),
      ),
    );
  }
}
