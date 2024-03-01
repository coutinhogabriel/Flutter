class Carro {
  // Atributos
  String _modelo;
  int _ano;
  String _imagemUrl;
  //contrutor
  Carro(this._modelo, this._ano, this._imagemUrl);
  // Getters
  String get modelo => _modelo;
  int get ano => _ano;
  String get imagemUrl => _imagemUrl;
  // Setters
  set modelo(String modelo) {
    var novoModelo;
    if (novoModelo.isNotEmpty) {
      _modelo = novoModelo;
    }
  }
  set ano(int novoAno) {
    if (novoAno >= 1900) {
      _ano = novoAno;
    }
  }
}
