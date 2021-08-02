import 'package:breakeven/controller/saldo_controller.dart';
import 'package:breakeven/screens/home/home.dart';
import 'package:breakeven/theme/cores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonSaldoEntrada extends StatelessWidget {
  final SaldoController sc;
  final TextEditingController saldoController;
  ButtonSaldoEntrada({this.saldoController, this.sc});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        sc.valorEntrada.value = saldoController.text;
        Get.off(
          Home(valor: saldoController.text, receita: true),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 300),
        );
      },
      backgroundColor: primaryColor,
      child: Icon(
        Icons.keyboard_arrow_right_rounded,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
