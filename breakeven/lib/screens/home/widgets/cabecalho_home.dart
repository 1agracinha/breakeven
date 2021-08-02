import 'package:breakeven/controller/saldo_controller.dart';
import 'package:flutter/material.dart';

class CabecalhoHome extends StatelessWidget {
  final SaldoController sc;
  const CabecalhoHome({this.sc});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Entrada:",
              style: TextStyle(fontSize: 20, color: Colors.black45)),
          Text(
            "R\$${sc.valorEntrada}",
            style:
                TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
          ),
          Text("Atual: ",
              style: TextStyle(fontSize: 20, color: Colors.black45)),
          Text(
            "R\$${sc.valorAtual}",
            style:
                TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
