import 'package:flutter/material.dart';

class AtualizarSaldoConteudo extends StatelessWidget {
  final List<Widget> widgets;
  const AtualizarSaldoConteudo({this.widgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...widgets],
      ),
    );
  }
}
