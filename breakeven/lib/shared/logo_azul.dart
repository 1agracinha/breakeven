import 'package:flutter/material.dart';

class LogoAzul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'http://www.hostcgs.com.br/hostimagem/images/258blue_name.png',
            scale: 4,
          ),
          Image.network(
            'https://i.ibb.co/SKS9dT2/blue-icon.png',
            scale: 2.5,
          ),
        ],
      ),
    );
  }
}
