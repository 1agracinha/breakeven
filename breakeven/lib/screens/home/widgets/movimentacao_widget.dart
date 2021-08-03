import 'package:breakeven/controller/saldo_controller.dart';
import 'package:breakeven/theme/cores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovimentacaoWidget extends StatefulWidget {
  @override
  _MovimentacaoWidgetState createState() => _MovimentacaoWidgetState();
}

class _MovimentacaoWidgetState extends State<MovimentacaoWidget> {
  bool isReceita = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaldoController>(builder: (saldoController) {
      if (saldoController.movimentacao.length == 0)
        return Center(
          child: Text("Ainda não há movimentações"),
        );
      return ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: saldoController.movimentacao.length,
        itemBuilder: (context, index) {
          final item = saldoController.movimentacao[index];

          return Dismissible(
            key: Key(item.valor),
            onDismissed: (direction) {
              setState(() {
                saldoController.movimentacao.removeAt(index);
              });

              Get.snackbar(
                "",
                "Você apagou R\$${item.valor},00!",
                backgroundColor: Colors.redAccent,
              );
            },
            child: item.isReceita
                ? ListTile(
                    trailing: Icon(Icons.arrow_drop_up, size: 40, color: verde),
                    title: Text(
                      "Você adicionou R\$${item.valor},00",
                      style: TextStyle(color: verde),
                    ))
                : ListTile(
                    trailing:
                        Icon(Icons.arrow_drop_down, size: 40, color: vermelho),
                    title: Text(
                      "Você retirou R\$${item.valor},00",
                      style: TextStyle(color: vermelho),
                    ),
                  ),
            background: Container(color: vermelho),
            direction: DismissDirection.startToEnd,
          );
        },
      );
    });
  }
}
