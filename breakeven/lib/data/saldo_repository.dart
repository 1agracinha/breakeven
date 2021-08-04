import 'package:breakeven/models/saldo_movimentacao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovimentacaoRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  adicionarMovimentacao(
      SaldoMovimentacao movimentacao, String idUsuario) async {
    try {
      final response =
          await firestore.collection("movimentacao").add(movimentacao.toMap());
      return response;
    } catch (e) {
      print("ERRO AO ADICIONAR MOVIMENTACAO: $e");
    }
  }

  getMovimentacao(String idUsuario) async {
    try {
      final response = await firestore.collection("movimentacao").get();

      return response.docs;
    } catch (e) {}
  }

  getMovimentacaoDetalhes(String idUsuario, String idMovimentacao) async {
    try {
      final response =
          await firestore.collection("movimentacao").doc(idMovimentacao).get();

      return response;
    } catch (e) {}
  }
}
