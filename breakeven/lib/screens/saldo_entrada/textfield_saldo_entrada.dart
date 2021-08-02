import 'package:flutter/material.dart';

class TextFieldSaldoEntrada extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController saldoController;
  TextFieldSaldoEntrada({this.saldoController});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 200,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 32, color: Colors.black54),
              controller: saldoController,
              decoration: InputDecoration(
                hintText: 'Informe seu saldo. Ex: 240,00',
                hintStyle: TextStyle(fontSize: 20, color: Colors.black26),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
