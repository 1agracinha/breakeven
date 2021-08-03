import 'package:breakeven/data/saldo_repository.dart';
import 'package:breakeven/models/saldo_movimentacao.dart';
import 'package:get/get.dart';

class SaldoController extends GetxController {
  var valorEntrada = "0".obs;
  var valorAtual = "0".obs;
  var valorCalculado = 0.0.obs;
  var movimentacao = <SaldoMovimentacao>[].obs;
  MovimentacaoRepository movimentacaoRepository = MovimentacaoRepository();

  salvarMovimentacao(SaldoMovimentacao movimentacao, String idUsuario) {
    final response =
        movimentacaoRepository.adicionarMovimentacao(movimentacao, idUsuario);
    return response;
  }

  calcularMovimentacao() {
    valorCalculado.value = 0.0;
    for (SaldoMovimentacao s in movimentacao) {
      if (s.isReceita) {
        valorCalculado.value = valorCalculado.value + double.parse(s.valor);
      } else {
        valorCalculado.value = valorCalculado.value - double.parse(s.valor);
      }
      print("VALOR CALC: $valorCalculado, ${s.isReceita}");
    }

    valorAtual.value =
        (double.parse(valorEntrada.value) + valorCalculado.value).toString();
  }

  retirar(var valorRetirado) => valorAtual =
      (double.parse(valorAtual as String) - double.parse(valorRetirado))
          as RxString;
  adicionar(var valorAdicionado) => valorAtual =
      (double.parse(valorAtual as String) - double.parse(valorAdicionado))
          as RxString;
}
