import 'package:breakeven/theme/cores.dart';
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final Function(String) validator;
  final bool obscureText;
  MainTextField(
      {@required this.labelText,
      @required this.textController,
      @required this.validator,
      this.obscureText = false});

  final UnderlineInputBorder borderStyle = UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: primaryColor));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: TextFormField(
        controller: textController,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: cinza, fontSize: 16),
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
        ),
      ),
    );
  }
}
