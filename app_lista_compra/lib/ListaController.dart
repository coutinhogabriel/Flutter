import 'package:app_lista_compra/ListaModel.dart';
import 'package:flutter/material.dart';

class ListaController extends ChangeNotifier {
  // Lista de Tarefas
  List<Lista> _listas = [];

  // Getter para acessar a lista de tarefas
  List<Lista> get listas => _listas;

  // Método para adicionar uma nova tarefa à lista
  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty) {
      // Verifica se a tarefa já existe na lista
      if (_listas.any((tarefa) => tarefa.descricao == descricao.trim())) {
        // Tarefa duplicada, trata o erro
        throw Exception('Tarefa já existe na lista');
      }

      _listas.add(Lista(descricao.trim(), false));
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para marcar uma tarefa como concluída com base no índice
  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _listas.length) {
      _listas[indice].concluida = !_listas[indice].concluida;
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para excluir uma tarefa com base no índice
  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _listas.length) {
      _listas.removeAt(indice);
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    } else {
      // Índice inválido, trata o erro
      throw Exception('Índice de tarefa inválido');
    }
  }
}
