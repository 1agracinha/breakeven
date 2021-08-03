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
  SalvarSaldoButton({this.sc, this.valorSaldoController, this.isReceita});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsuarioController>(
      builder: (usuario) => RawMaterialButton(
        onPressed: () {
          sc.movimentacao.add(
            SaldoMovimentacao(
              valor: valorSaldoController.text,
              isReceita: isReceita,
            ),
          );

          sc.salvarMovimentacao(
              SaldoMovimentacao(
                valor: valorSaldoController.text,
                isReceita: isReceita,
              ),
              usuario.idUsuario.value);

          sc.calcularMovimentacao();
          Get.to(Home(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        },
        child:
            Text("Salvar", style: TextStyle(fontSize: 17, color: Colors.white)),
        elevation: 2.0,
        fillColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(left: 20, right: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
