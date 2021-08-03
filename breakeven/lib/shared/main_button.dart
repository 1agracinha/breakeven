import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const MainButton({@required this.onPressed, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        elevation: 2.0,
        fillColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            top: 12,
            bottom: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
