import 'dart:io';

import 'package:dio_dart_imc/imc.dart';
import 'package:dio_dart_imc/pessoa.dart';

class ImcMenu {
  IMC imc = IMC();
  late Pessoa pessoa;

  void askInfo(String text, Function(String) callback) {
    print('[?] $text: ');

    String? value = stdin.readLineSync();

    if (value == null) {
      inputError();
      return;
    }

    callback(value);
  }

  void inputError() {
    print('[!] Valor informado é inválido! Por favor, tente novamente.');
  }

  void alturaError() {
    print('[!] Altura é inválida! Informe em metros. Ex.: 1.75');
  }

  void askNome() {
    askInfo("Informe o seu nome", (input) {
      if (input.isEmpty) {
        inputError();
        askNome();
        return;
      }

      pessoa = Pessoa(input);

      askPeso();
    });
  }

  void askPeso() {
    askInfo("Informe o seu peso em kg", (input) {
      final peso = double.tryParse(input.replaceAll(',', '.'));

      if (peso == null || peso <= 0) {
        inputError();
        askPeso();
        return;
      }

      pessoa.setPeso(peso);

      askAltura();
    });
  }

  void askAltura() {
    askInfo("Informe a sua altura em metros", (input) {
      final altura = double.tryParse(input.replaceAll(',', '.'));

      if (altura == null || altura <= 0) {
        inputError();
        askAltura();
        return;
      }

      if (altura > 3) {
        alturaError();
        askAltura();
        return;
      }

      pessoa.setAltura(altura);

      informarIMC();
    });
  }

  void informarIMC() {
    final imcValor = imc.calcularIMC(
      peso: pessoa.peso,
      altura: pessoa.altura,
    );

    final imcClassificacao = imc.classificarIMC(imc: imcValor);

    print(
      "Olá ${pessoa.nome}, seu IMC é ${imcValor.toStringAsFixed(1)} e é classificado como '$imcClassificacao'!",
    );
  }

  void start() {
    print('Bem vindo ao calculador de IMC!');

    askNome();
  }
}
