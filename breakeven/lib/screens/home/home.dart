import 'package:breakeven/controller/saldo_controller.dart';
import 'package:breakeven/screens/atualizar_saldo/atualizar_saldo.dart';
import 'package:breakeven/screens/home/widgets/atualizar_saldo_button.dart';
import 'package:breakeven/screens/home/widgets/cabecalho_home.dart';
import 'package:breakeven/screens/home/widgets/movimentacao_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  final String valor;
  final bool receita;
  Home({this.valor = "0.0", this.receita});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SaldoController sc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CabecalhoHome(
            sc: sc,
          ),
          Divider(
            color: Colors.black26,
          ),
          Expanded(
            child: MovimentacaoWidget(),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AtualizarSaldoButton(
        onTap: () {
          Get.to(AtualizarSaldo(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 500));
        },
      ),
    );
  }
}
