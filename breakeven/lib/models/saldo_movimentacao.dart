class SaldoMovimentacao {
  String idUsuario;
  bool isReceita;
  String valor;

  SaldoMovimentacao({this.isReceita, this.valor, this.idUsuario});

  Map<String, dynamic> toMap() {
    return {
      'valor': this.valor,
      'isReceita': this.isReceita,
      'idUsuario': this.idUsuario
    };
  }

  static SaldoMovimentacao fromJson(dynamic json) {
    return SaldoMovimentacao(
        valor: json["valor"],
        idUsuario: json["idUsuario"],
        isReceita: json["isReceita"]);
  }
}
