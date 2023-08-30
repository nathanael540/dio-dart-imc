class IMC {
  double calcularIMC({required double peso, required double altura}) {
    if (peso <= 0 || altura <= 0) throw ImcZeroException();

    return peso / (altura * altura);
  }

  String classificarIMC({required double imc}) {
    if (imc < 16) {
      return 'Magreza grave';
    } else if (imc < 17) {
      return 'Magreza moderada';
    } else if (imc < 18.5) {
      return 'Magreza leve';
    } else if (imc < 25) {
      return 'Saudável';
    } else if (imc < 30) {
      return 'Sobrepeso';
    } else if (imc < 35) {
      return 'Obesidade Grau I';
    } else if (imc < 40) {
      return 'Obesidade Grau II (severa)';
    } else {
      return 'Obesidade Grau III (mórbida)';
    }
  }
}

class ImcZeroException implements Exception {}
