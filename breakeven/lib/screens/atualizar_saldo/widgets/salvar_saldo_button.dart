import 'package:breakeven/controller/saldo_controller.dart';
import 'package:breakeven/controller/usuario_controller.dart';
import 'package:breakeven/models/saldo_movimentacao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/home.dart';

class SalvarSaldoButton extends StatelessWidget {
  final SaldoController sc;
  final bool isReceita;
  final TextEditingController valorSaldoController;
  final Function onPressed;
  SalvarSaldoButton(
      {this.sc, this.valorSaldoController, this.isReceita, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child:
          Text("Salvar", style: TextStyle(fontSize: 17, color: Colors.white)),
      elevation: 2.0,
      fillColor: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(left: 20, right: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    );
  }
}
