import 'package:flutter_test/flutter_test.dart';
import 'package:simulador_frete/models/calculadora_frete.dart';
import 'package:simulador_frete/models/tipo_frete.dart';

void main() {
  final calculadoraFrete = CalculadoraFrete();

  test('frete economico deve calcular o valor pelo peso e a distancia', () {
    //ARRANGE
    const peso = 2.0;
    const distanciaKm = 100;
    const valorCompra = 1.0;

    //ACT
    final resultado = calculadoraFrete.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distanciaKm: distanciaKm,
      valorCompra: valorCompra,
    );

    // Assert
    expect(resultado.valor, closeTo(22.0, 0.01));
  });

  test('frete expresso deve calcular valor pelo peso e distância', () {
    const peso = 2.0;
    const distanciaKm = 100;
    const valorCompra = 1.0;


    final resultado = calculadoraFrete.calcular(
      tipo: TipoFrete.expresso,
      peso: peso,
      distanciaKm: distanciaKm,
      valorCompra: valorCompra,
    );

    expect(resultado.valor, closeTo(48.0, 0.01));
  });

  test('peso 0 deve gerar erros', () {
    expect(
      () => calculadoraFrete.calcular(
        tipo: TipoFrete.economico,
        peso: 0,
        distanciaKm: 100,
        valorCompra: 1.0,
      ),
      throwsArgumentError,
    );
  });

  test('peso for negativo deve gerar erro', () {
    expect(
      () => calculadoraFrete.calcular(
        tipo: TipoFrete.economico,
        peso: -2.0,
        distanciaKm: 100,
        valorCompra: 1.0,
      ),
      throwsArgumentError,
    );
  });

  test('quando a distancia for 0 deve gerar erros', () {
    expect(
      () => calculadoraFrete.calcular(
        tipo: TipoFrete.economico,
        peso: 2.0,
        distanciaKm: 0,
        valorCompra: 1.0,
      ),
      throwsArgumentError,
    );
  });

  test('compra de 350 deve possuir teste gratis', () {
    //ARRANGE
    const peso = 2.0;
    const distanciaKm = 100;
    const valorCompra = 350.0;

    //ACT
    final resultado = calculadoraFrete.calcular(
      tipo: TipoFrete.expresso,
      peso: peso,
      distanciaKm: distanciaKm,
      valorCompra: valorCompra,
    );

    // Assert
    expect(resultado.valor, closeTo(0.0, 0.01));
  });

}
