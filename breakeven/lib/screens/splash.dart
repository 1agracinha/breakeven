import 'package:breakeven/screens/saldo_entrada/saldo.dart';
import 'package:breakeven/theme/cores.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:transparent_image/transparent_image.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(
          seconds: 6,
          routeName: "/",
          backgroundColor: primaryColor,
          navigateAfterSeconds: Saldo(),
          loaderColor: Colors.transparent,
        ),
        Container(
            child: Container(
          child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      fadeInCurve: Curves.easeInCirc,
                      image:
                          'https://www.imagemhost.com.br/images/2021/02/04/white-icon.png',
                      fit: BoxFit.cover),
                  FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      fadeInCurve: Curves.easeInCirc,
                      image:
                          'http://www.hostcgs.com.br/hostimagem/images/600white_name.png',
                      fit: BoxFit.cover)
                ],
              )),
        ))
      ],
    );
  }
}
