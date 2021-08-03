import 'package:breakeven/shared/logo_azul.dart';
import 'package:flutter/material.dart';

class CabecalhoSaldoEntrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LogoAzul(),
      Divider(
        color: Colors.black26,
      ),
    ]);
  }
}
