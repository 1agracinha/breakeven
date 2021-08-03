import 'package:breakeven/models/saldo_movimentacao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovimentacaoRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  adicionarMovimentacao(
      SaldoMovimentacao movimentacao, String idUsuario) async {
    try {
      final response = await firestore
          .collection("usuario")
          .doc(idUsuario)
          .collection("movimentacao")
          .add(movimentacao.toMap());
      return response;
    } catch (e) {
      print("ERRO AO ADICIONAR MOVIMENTACAO: $e");
    }
  }

  getMovimentacao(String idUsuario) async {
    try {
      final response = await firestore
          .collection("usuario")
          .doc(idUsuario)
          .collection("movimentacao")
          .get();

      return response.docs;
    } catch (e) {}
  }

  getMovimentacaoDetalhes(String idUsuario, String doc) async {
    try {
      final response = await firestore
          .collection("usuario")
          .doc(idUsuario)
          .collection("movimentacao")
          .doc(doc)
          .get();

      return response;
    } catch (e) {}
  }
}
