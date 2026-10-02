import 'package:simulador_frete/models/resultado_frete.dart';
import 'package:simulador_frete/models/tipo_frete.dart';

class CalculadoraFrete {
  ResultadoFrete calcular({
    required TipoFrete tipo,
    required double peso,
    required int distanciaKm,
    required double valorCompra,
  }) {
    if (peso <= 0) {
      throw ArgumentError("O peso deve ser maior que 0");
    }

    if (distanciaKm <= 0) {
      throw ArgumentError("A distancia deve ser maior que 0");
    }

    late ResultadoFrete resultadoFrete;

    switch (tipo) {
      case TipoFrete.economico:
        return ResultadoFrete(
          valor: 8 + 2 * peso + distanciaKm * 0.10,
          prazoDias: 5,
        );

      case TipoFrete.expresso:
        return ResultadoFrete(
          valor: 15 + 4 * peso + distanciaKm * 0.25,
          prazoDias: 2,
        );

      case TipoFrete.retirada:
        return ResultadoFrete(
          valor: 0.0,
          prazoDias: 1,
        );
    }

    if (valorCompra >= 300.0) {
      return resultadoFrete.copyWith(valor: 0.0);
    }

    return resultadoFrete;
  }
}
