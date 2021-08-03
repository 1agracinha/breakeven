import 'package:breakeven/screens/saldo_entrada/saldo.dart';
import 'package:breakeven/theme/cores.dart';
import 'package:flutter/material.dart';

class RodapeLoginSignup extends StatelessWidget {
  final String rightText, leftText;
  final Function onPressed;
  RodapeLoginSignup(
      {@required this.leftText,
      @required this.rightText,
      @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: TextStyle(color: cinza, fontSize: 16),
        ),
        TextButton(
          child: Text(rightText),
          onPressed: onPressed,
          style: TextButton.styleFrom(
            primary: primaryColor,
            textStyle:
                TextStyle(fontSize: 16, decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
