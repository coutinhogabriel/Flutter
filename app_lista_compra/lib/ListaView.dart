import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ListaController.dart';

class ListaScreen extends StatelessWidget {
  // Controlador para o campo de texto de nova tarefa
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Novo Produto',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarTarefa do Provider para atualizar o estado
                    Provider.of<ListaController>(context, listen: false)
                        .adicionarTarefa(_controller.text, context);
                    // Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.listas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.listas[index].descricao),
                      // Checkbox para marcar a tarefa como concluída
                      trailing: Checkbox(
                        value: model.listas[index].concluida,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoConcluida(index);
                        },
                      ),
                      // Exclui a tarefa ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirTarefa do Provider para atualizar o estado
                        model.excluirTarefa(index, context);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
