import 'package:breakeven/controller/saldo_controller.dart';
import 'package:breakeven/screens/saldo_entrada/button_saldo_entrada.dart';
import 'package:breakeven/screens/saldo_entrada/cabecalho_saldo_entrada.dart';
import 'package:breakeven/screens/saldo_entrada/textfield_saldo_entrada.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Saldo extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController saldoController = TextEditingController();
  final SaldoController sc = Get.put(SaldoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            CabecalhoSaldoEntrada(),
            TextFieldSaldoEntrada(
              saldoController: saldoController,
            ),
          ]),
        ),
        floatingActionButton:
            ButtonSaldoEntrada(saldoController: saldoController, sc: sc));
  }
}
