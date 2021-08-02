import 'package:flutter/material.dart';

class AtualizarSaldoButton extends StatelessWidget {
  final Function onTap;
  const AtualizarSaldoButton({this.onTap});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      elevation: 2.0,
      fillColor: Theme.of(context).primaryColor,
      child: Text("Atualizar saldo",
          style: TextStyle(fontSize: 17, color: Colors.white)),
      padding: EdgeInsets.only(left: 20, right: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
    );
  }
}
