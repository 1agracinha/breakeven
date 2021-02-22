import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home.dart';

class AtualizarSaldo extends StatefulWidget {
  @override
  _AtualizarSaldoState createState() => _AtualizarSaldoState();
}

class _AtualizarSaldoState extends State<AtualizarSaldo> {
  bool receita = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor //change your color here
          ),
      
          backgroundColor: Colors.white,
          title: Center(child: Text("Atualizar Saldo", style: TextStyle(color: Theme.of(context).primaryColor))),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("É uma receita ou despesa?",
                  style: TextStyle(fontSize: 18, color: Colors.black38)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        receita = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: receita ? Color(0xff00E995) : Colors.black26,
                      ),
                      child: Text("receita",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        receita = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      margin: EdgeInsets.only(top: 20, left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: receita ? Colors.black26 : Color(0xffF68870),
                      ),
                      child: Text("despesa",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Text("Qual o valor?",
                  style: TextStyle(fontSize: 18, color: Colors.black38)),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(),
              )
            ],
          ),
        ),
        floatingActionButton: RawMaterialButton(
            onPressed: () {
              Get.to(Home(),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 500));
            },
            elevation: 2.0,
            fillColor: Theme.of(context).primaryColor,
            child: Text("Salvar",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            padding: EdgeInsets.only(left: 20, right: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)))));
  }
}
