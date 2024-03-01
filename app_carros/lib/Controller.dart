
import 'package:app_carros/Model.dart';

class CarroController {
  // Atributo
  List<Carro> _carrosLista = [];

  // Métodos
  List<Carro> get listarCarros => _carrosLista;

  // Outros métodos
  void adicionarCarro(String modelo, int ano, String imagemUrl) {
    Carro carro = Carro(modelo, ano, imagemUrl);
    _carrosLista.add (carro);
  }
}
