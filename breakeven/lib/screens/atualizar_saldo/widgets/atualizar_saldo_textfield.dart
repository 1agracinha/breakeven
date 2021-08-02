import 'package:flutter/material.dart';

class AtualizarSaldoTextField extends StatelessWidget {
  final TextEditingController valorSaldoController;
  const AtualizarSaldoTextField({this.valorSaldoController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
        ),
        Text("Qual o valor?",
            style: TextStyle(fontSize: 18, color: Colors.black38)),
        TextFormField(
          controller: valorSaldoController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(),
        )
      ],
    );
  }
}
