import 'package:breakeven/components/movimentacao.dart';
import 'package:breakeven/managers/dao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'atualizar_saldo.dart';

class Home extends StatefulWidget {
  String valor;
  bool receita;
  Home({this.valor, this.receita});
  Gerenciador gerenciador;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Seu saldo é de  ",
                          style:
                              TextStyle(fontSize: 20, color: Colors.black45)),
                      Text(
                        "R\$${widget.valor}",
                        style: TextStyle(
                            fontSize: 26,
                            color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black26,
              ),
              Expanded(
                child: Movimentacao(),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: RawMaterialButton(
            onPressed: () {
              Get.to(AtualizarSaldo(),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 500));
            },
            elevation: 2.0,
            fillColor: Theme.of(context).primaryColor,
            child: Text("Atualizar saldo",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            padding: EdgeInsets.only(left: 20, right: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)))));
  }
}
