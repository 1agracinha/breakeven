import 'package:breakeven/controller/saldo_controller.dart';
import 'package:breakeven/controller/usuario_controller.dart';
import 'package:breakeven/models/saldo_movimentacao.dart';
import 'package:breakeven/theme/cores.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovimentacaoWidget extends StatefulWidget {
  @override
  _MovimentacaoWidgetState createState() => _MovimentacaoWidgetState();
}

class _MovimentacaoWidgetState extends State<MovimentacaoWidget> {
  bool isReceita = false;
  SaldoMovimentacao saldoMovimentacao = SaldoMovimentacao();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsuarioController>(
      builder: (usuario) => GetBuilder<SaldoController>(
        builder: (saldo) => FutureBuilder<List<QueryDocumentSnapshot>>(
            future: saldo.getMovimentacao(usuario.idUsuario.value),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data.length == 0)
                return Text("Você não fez nenhuma movimentação ainda");
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var movimentacao =
                        SaldoMovimentacao.fromJson(snapshot.data[index].data());

                    if (movimentacao.idUsuario == usuario.idUsuario.value) {
                      saldo.movimentacao.add(movimentacao);
                      saldo.calcularMovimentacao();
                      return Dismissible(
                        key: Key(movimentacao.valor),
                        onDismissed: (direction) {
                          setState(() {
                            saldo.movimentacao.removeAt(index);
                          });

                          Get.snackbar(
                            "",
                            "Você apagou R\$${movimentacao.valor},00!",
                            backgroundColor: Colors.redAccent,
                          );
                        },
                        child: movimentacao.isReceita
                            ? ListTile(
                                trailing: Icon(Icons.arrow_drop_up,
                                    size: 40, color: verde),
                                title: Text(
                                  "Você adicionou R\$${movimentacao.valor},00",
                                  style: TextStyle(color: verde),
                                ))
                            : ListTile(
                                trailing: Icon(Icons.arrow_drop_down,
                                    size: 40, color: vermelho),
                                title: Text(
                                  "Você retirou R\$${movimentacao.valor},00",
                                  style: TextStyle(color: vermelho),
                                ),
                              ),
                        background: Container(color: vermelho),
                        direction: DismissDirection.startToEnd,
                      );
                    }
                    return null;
                  });
            }),
      ),
    );
  }
}
