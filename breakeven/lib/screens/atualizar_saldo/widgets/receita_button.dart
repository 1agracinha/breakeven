import 'package:flutter/material.dart';

class ReceitaButton extends StatelessWidget {
  final Function onTap;
  final bool isReceita;
  final Color activeButtonColor;
  final Color disableButtonColor;
  final String text;
  const ReceitaButton(
      {this.isReceita,
      this.onTap,
      this.activeButtonColor,
      this.text,
      this.disableButtonColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        margin: EdgeInsets.only(top: 20, left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: !isReceita ? disableButtonColor : activeButtonColor,
        ),
        child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
