import 'package:dio_dart_imc/imc.dart';
import 'package:test/test.dart';

void main() {
  IMC imc = IMC();

  test('Calcula o IMC - 80kg | 1.75m', () {
    expect(
      imc.calcularIMC(peso: 80, altura: 1.75),
      allOf([greaterThan(26.12), lessThan(26.13)]),
    );
  });

  test('Calcula o IMC - 93kg | 1.71m', () {
    expect(
      imc.calcularIMC(peso: 93, altura: 1.71),
      allOf([greaterThan(31.80), lessThan(31.81)]),
    );
  });

  test('Classifica o IMC - 16.5', () {
    expect(
      imc.classificarIMC(imc: 16.5),
      equals('Magreza moderada'),
    );
  });

  test('Classifica o IMC - 27.65', () {
    expect(
      imc.classificarIMC(imc: 27.65),
      equals('Sobrepeso'),
    );
  });

  test('Calcula o IMC - 93kg | zero metros', () {
    expect(
      () => imc.calcularIMC(peso: 93, altura: 0),
      throwsA(isA<ImcZeroException>()),
    );
  });

  test('Calcula o IMC - zero kg | 1.75 metros', () {
    expect(
      () => imc.calcularIMC(peso: 0, altura: 1.75),
      throwsA(isA<ImcZeroException>()),
    );
  });
}
