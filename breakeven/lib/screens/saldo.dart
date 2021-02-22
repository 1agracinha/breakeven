import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../managers/dao.dart';

import 'Home.dart';

class Saldo extends StatelessWidget {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController saldoController = TextEditingController();

  Gerenciador gerenciador;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SafeArea(
              child: Container(
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
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            Container(
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.off(Home(valor: saldoController.text, receita: true), transition: Transition.rightToLeft, duration: Duration(milliseconds: 300));
          },
          backgroundColor: Color(0xff00B3CB),
          child: Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 40,
            color: Colors.white,
          )),
    );
  }
}
