import 'package:breakeven/controller/usuario_controller.dart';
import 'package:breakeven/screens/home/home.dart';
import 'package:breakeven/screens/login/login_page.dart';
import 'package:breakeven/screens/saldo_entrada/saldo.dart';
import 'package:breakeven/theme/cores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:transparent_image/transparent_image.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  UsuarioController usuarioController = Get.put(UsuarioController());
  bool isLogado;
  @override
  void initState() {
    carregarIdUsuario().then((id) {
      if (id != "" && id != null) {
        setState(() {
          usuarioController.idUsuario.value = id;
          isLogado = true;
        });
      } else {
        setState(() {
          isLogado = false;
        });
      }
    });
    super.initState();
  }

  Future carregarIdUsuario() async {
    GetStorage box = GetStorage('usuario');
    var id = await box.read("idUsuario");
    return id;
  }

  @override
  Widget build(BuildContext context) {
    if (isLogado != null)
      return Stack(
        children: [
          SplashScreen(
            seconds: 6,
            routeName: "/",
            backgroundColor: primaryColor,
            navigateAfterSeconds: isLogado ? Saldo() : LoginPage(),
            loaderColor: Colors.transparent,
          ),
          conteudoSplash()
        ],
      );
    else
      return conteudoSplash();
  }

  Widget conteudoSplash() {
    return Container(
      color: primaryColor,
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
          ),
        ),
      ),
    );
  }
}
