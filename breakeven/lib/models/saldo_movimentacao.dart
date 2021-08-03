class SaldoMovimentacao {
  bool isReceita;
  String valor;

  SaldoMovimentacao({this.isReceita, this.valor});

  Map<String, dynamic> toMap() {
    return {
      'valor': this.valor,
      'isReceita': this.isReceita,
    };
  }
}
