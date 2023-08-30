class Pessoa {
  String _nome;
  double _peso = 0;
  double _altura = 0;

  Pessoa(this._nome);

  String get nome => _nome;
  void setNome(String nome) {
    _nome = nome;
  }

  double get peso => _peso;
  void setPeso(double peso) {
    _peso = peso;
  }

  double get altura => _altura;
  void setAltura(double altura) {
    _altura = altura;
  }
}
