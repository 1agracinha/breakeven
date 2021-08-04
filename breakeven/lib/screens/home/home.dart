import 'package:breakeven/controller/saldo_controller.dart';
import 'package:breakeven/controller/usuario_controller.dart';
import 'package:breakeven/screens/atualizar_saldo/atualizar_saldo.dart';
import 'package:breakeven/screens/home/widgets/atualizar_saldo_button.dart';
import 'package:breakeven/screens/home/widgets/cabecalho_home.dart';
import 'package:breakeven/screens/home/widgets/movimentacao_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatefulWidget {
  final String valor;
  final bool receita;
  Home({this.valor = "0.0", this.receita});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaldoController>(
      builder: (saldoController) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CabecalhoHome(
                sc: saldoController,
              ),
              Divider(
                color: Colors.black26,
              ),
              Expanded(
                child: MovimentacaoWidget(),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AtualizarSaldoButton(
          onTap: () {
            Get.to(AtualizarSaldo(),
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 500));
          },
        ),
      ),
    );
  }
}
