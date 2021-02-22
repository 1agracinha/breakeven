import 'package:flutter/material.dart';

class Movimentacao extends StatefulWidget {
  @override
  _MovimentacaoState createState() => _MovimentacaoState();
}

class _MovimentacaoState extends State<Movimentacao> {
  List<String> items = ['30', '40', '60', '80'];
  bool isReceita = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          key: Key(item),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });

            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("Você apagou R\$$item,00!")));
          },
          background: Container(color: Color(0xffF68870)),
          child: isReceita
              ? ListTile(
                  trailing: Icon(Icons.arrow_drop_up,
                      size: 40, color: Color(0xff00E995)),
                  title: Text(
                    "Você adicionou R\$${item},00",
                    style: TextStyle(color: Color(0xff00E995)),
                  ))
              : ListTile(
                  trailing: Icon(Icons.arrow_drop_down,
                      size: 40, color: Color(0xffF68870)),
                  title: Text(
                    "Você retirou R\$${item},00",
                    style: TextStyle(color: Color(0xffF68870)),
                  )),
        );
      },
    );
  }
}
